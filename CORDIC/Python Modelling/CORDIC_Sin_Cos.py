## import
from math import atan, pi, sqrt

## Initialization
N = 16
hw_scale = pow(2, 15)
kn = 1
kn_hw = kn * hw_scale

for i in range(N):
    kn = kn * sqrt(1+pow(2, -(2*i)))

# print(f"{kn = }")

xin = 1/kn                              # initial values
yin = 0                                 # initial values
zin = pi/3                              # initial values
zi_norm = zin/pi                        # initial values

xi_hw = round(xin * hw_scale)           # input to RTL
yi_hw = round(yin * hw_scale)           # input to RTL
zi_hw = round(zi_norm * hw_scale)       # input to RTL

# print(f"{xi_hw = }")
# print(f"{yi_hw = }")
# print(f"{zi_hw = }")

atan_lut = [0] * N

# pre-calculated then stored in LUTs
for i in range(N):
    atan_lut[i] = round((atan(pow(2, -i)) / pi) * hw_scale)    # stored in RTL
    # print(f"atan_lut[{i}] = {atan_lut[i]}")    
    # print(f"atan_lut[{i}] in hex = {atan_lut[i]:04X}")        

for i in range(N):
    if zi_hw >= 0:                
        xi1_hw = xi_hw - (yi_hw >> i)
        yi1_hw = yi_hw + (xi_hw >> i)
        zi1_hw = zi_hw - atan_lut[i]
    else:        
        xi1_hw = xi_hw + (yi_hw >> i)
        yi1_hw = yi_hw - (xi_hw >> i)
        zi1_hw = zi_hw + atan_lut[i]

    xi_hw = xi1_hw
    yi_hw = yi1_hw
    zi_hw = zi1_hw    
    

xn_hw = xi_hw                           # output from RTL
yn_hw = yi_hw                           # output from RTL

xn = xn_hw / hw_scale
yn = yn_hw / hw_scale

cos_theta = round(xn, 3)     # final output 
sin_theta = round(yn, 3)     # final output 

print("cos(30) = " , cos_theta)
print("sin(30) = " , sin_theta)    