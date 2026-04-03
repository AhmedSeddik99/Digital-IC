## import


## Initialization
N = 16
hw_scale = pow(2, 15)
norm_scale = pow(2, 7)
safety_scale = pow(2, 1)

### note: |yin| < |2*xin| since yin/xin = [-2, 2] ###
xin = 64                                    # initial values
yin = 128                                   # initial values
zin = 0                                     # initial values

xi_norm = xin / (norm_scale * safety_scale) # initial normalized values
yi_norm = yin / (norm_scale * safety_scale) # initial normalized values
zi_norm = zin / (norm_scale * safety_scale) # initial normalized values

xi_hw = round(xi_norm * hw_scale)           # input to RTL
yi_hw = round(yi_norm * hw_scale)           # input to RTL
zi_hw = round(zi_norm * hw_scale)           # input to RTL

# print(f"{xi_hw = }")
# print(f"{yi_hw = }")
# print(f"{zi_hw = }")

power2_lut = [0] * N

# pre-calculated then stored in LUTs
for i in range(N):
    power2_lut[i] = round((pow(2, -i) / (norm_scale * safety_scale)) * hw_scale)    # stored in RTL
    # print(f"power2_lut[{i}] = {power2_lut[i]}")

for i in range(N):
    if yi_hw >= 0:                
        yi1_hw = yi_hw - (xi_hw >> i)
        zi1_hw = zi_hw + power2_lut[i]        
    else:
        yi1_hw = yi_hw + (xi_hw >> i)
        zi1_hw = zi_hw - power2_lut[i]        

    yi_hw = yi1_hw
    zi_hw = zi1_hw    
    
zn_hw = zi_hw                                       # output from RTL

zn = zn_hw / hw_scale

result = round(zn * norm_scale * safety_scale, 5)   # final output

print(f"{yin} / {xin} = {result}")