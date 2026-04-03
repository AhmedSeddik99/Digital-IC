# Hazard
.text
.main:    
    addi x28, x0, 50        # init x28
    addi x29, x0, 160       # address to sw x28
    
    addi x1, x0, 5          # x1 = 5
    addi x2, x0, 10         # x2 = 10
    add x3, x1, x2          # x3 = x1 + x2 = 15        
    sub x4, x3, x1          # x4 = x2 - x1 = 10  
    and x5, x4, x2          # x5 = x1 & x2 = 10
    or  x6, x1, x5          # x6 = x1 | x2 = 15
       
    sw x28, 0(x29)
    
    lw x12, 0(x29)           # x12 = 10    

    
    addi a0, x0, 10 # ID (a0) = 10 means end the program
    ecall # terminate ecall