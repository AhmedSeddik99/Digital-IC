## import
from math import atan, pi, sqrt

## Initialization
N = 16
hw_scale = pow(2, 15)
norm_scale = pow(2, 7)
safety_scale = pow(2, 1)
kn = 1
kn_hw = kn * hw_scale

for i in range(N):
    kn = kn * sqrt(1+pow(2, -(2*i)))

# print(f"{kn = }")

xin = -1/kn                                # initial values
yin = 0/kn                                # initial values
zin = 0                                     # initial values

xi_norm = xin / (norm_scale * safety_scale) # initial normalized values
yi_norm = yin / (norm_scale * safety_scale) # initial normalized values
zi_norm = zin / norm_scale                  # initial normalized values

xi_hw = round(xi_norm * hw_scale)           # input to RTL
yi_hw = round(yi_norm * hw_scale)           # input to RTL
zi_hw = round(zi_norm * hw_scale)           # input to RTL

# print(f"{xi_hw = }")
# print(f"{yi_hw = }")
# print(f"{zi_hw = }")

atan_lut = [0] * N

# pre-calculated then stored in LUTs
for i in range(N):
    atan_lut[i] = round((atan(pow(2, -i)) / pi) * hw_scale)    # stored in RTL
    # print(f"atan_lut[{i}] = {atan_lut[i]}")    

for i in range(N):
    if yi_hw >= 0:                
        xi1_hw = xi_hw + (yi_hw >> i)
        yi1_hw = yi_hw - (xi_hw >> i)
        zi1_hw = zi_hw + atan_lut[i]
    else:        
        xi1_hw = xi_hw - (yi_hw >> i)
        yi1_hw = yi_hw + (xi_hw >> i)
        zi1_hw = zi_hw - atan_lut[i]

    xi_hw = xi1_hw
    yi_hw = yi1_hw
    zi_hw = zi1_hw    
    

xn_hw = xi_hw                                       # output from RTL
zn_hw = zi_hw                                       # output from RTL

xn = xn_hw / hw_scale
zn = zn_hw / hw_scale

mag   = round(xn * norm_scale * safety_scale, 5)    # final output
theta = round(zn * pi, 5)                           # final output

print(f"{mag = }")
print(f"{theta = }")