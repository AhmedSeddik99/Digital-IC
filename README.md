# Digital-IC

## RTL to GDS Implementation of Low Power Configurable Multi Clock Digital "UART" System:
1) Efficient RTL Coding Using Verilog language
2) Building Advanced Self-checking Verilog Test-bench 
3) RTL Synthesis on Design Compiler   
4) Design For Testing (DFT) Insertion
5) Formal Verification Post-Synthesis & Post-DFT & Post-PnR
6) ASIC Flow including (Floorplanning, Pin Placement, Clock Tree Synthesis, Placement, Routing, Timing Closure, Chip Finishing, Sign Off)



## RTL Design for AES
1) Designed a fully synthesizable RTL design of the Advanced Encryption Standard (AES) algorithm using Verilog.
2) Supports both encryption and decryption datapaths following standard AES transformations.
3) Key Expansion for round key generation supports standard AES configurations (AES-128, AES-192 & AES-256) dynamically
4) Modular RTL design of AES stages:
    * SubBytes (S-box substitution)
    * ShiftRows transformation
    * MixColumns operation
    * AddRoundKey stage



### RTL Design for pipelined RISC-V
1) Designed a synthesizable RTL implementation of a 5-stage pipelined RISC-V processor using Verilog.
2) Implemented full instruction flow across pipeline stages with hazard handling and control logic.
3) Implemented classic 5 pipeline stages:   
    * Instruction Fetch (IF)
    * Instruction Decode (ID)
    * Execute (EX)
    * Memory Access (MEM)
    * Write Back (WB)
4) Supports core RISC-V instruction types:
    * Arithmetic (R-type)
    * Immediate (I-type)
    * Load/Store
    * Branch instructions
5) Designed pipeline registers between stages to ensure proper data flow and timing