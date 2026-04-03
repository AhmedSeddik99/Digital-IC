# Fibonacci
.text
main: 
    addi t2, x0, 6          # init t2 with fibo num
    addi t4, x0, 160        # address  
    nop
    nop
    nop                     # t2 & t3 is ready
    sw t2, 0(t4)
    add t0, x0, x0          # init t0 with 1st Fib no. (0)
    addi t1, x0, 1          # init t1 with 2nd Fib no. (1)     
    lw t3, 0(t4)            # t3 = Mem[t3]
    nop
    nop                     # t0, t1 & t3 is ready                     
    
fib: 
    beq t3, x0, finish
    add t2, t1, t0          # t2 = sum of last two fib no.s
    nop 
    nop                     # t2 is ready
    mv t0, t1
    mv t1, t2
    addi t3, t3, -1
    j fib
    nop
    nop
    nop
    
finish: 
    addi a1, t0, 0                     
    addi a0, x0, 1          # ID (a0) = 1 means prints the integer stored in a1 (output console in simulator tab)           
    ecall                   
    addi a0, x0, 10         # ID (a0) = 10 means end the program
    ecall                   # terminate ecall