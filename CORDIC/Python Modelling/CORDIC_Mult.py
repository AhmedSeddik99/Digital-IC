## import


## Initialization
N = 16
hw_scale = pow(2, 15)
norm_scale = pow(2, 7)
safety_scale = pow(2, 1)

### note: zin <= 2 since zin*xin <= 2*xin ###
xin = 128                                   # initial values
yin = 0                                     # initial values
zin = 2                                     # initial values

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
    if zi_hw >= 0:                
        yi1_hw = yi_hw + (xi_hw >> i)
        zi1_hw = zi_hw - power2_lut[i]        
    else:
        yi1_hw = yi_hw - (xi_hw >> i)
        zi1_hw = zi_hw + power2_lut[i]

    yi_hw = yi1_hw
    zi_hw = zi1_hw    
    
    
yn_hw = yi_hw                                       # output from RTL


yn = yn_hw / hw_scale

result = round(yn * norm_scale * safety_scale, 5)   # final output


print(f"{zin} * {xin} = {result}")