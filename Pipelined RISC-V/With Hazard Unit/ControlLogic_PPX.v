module ControlLogic_PPX (
    input       wire        [8:0]       InstSel_PPX,
    input       wire                    BrLT, BrEQ,
    input       wire        [1:0]       FwA, FwB,
    output      reg         [3:0]       ALUSel,
    output      reg         [2:0]       ImmSel,
    output      wire        [1:0]       ASel_Hz, BSel_Hz,
    // output      reg                     ASel, BSel,
    output      reg                     lwInst,
    output      reg                     BrUn
);
    
    wire        [10:0]      CtrlSel;

    reg                     ASel, BSel;

assign CtrlSel = {BrEQ, BrLT, InstSel_PPX};


assign ASel_Hz = (FwA == 2'b00)? {1'b0, ASel} : FwA;
assign BSel_Hz = (FwB == 2'b00)? {1'b0, BSel} : FwB;


always @(*) begin
    ALUSel  = 4'b0;
    ImmSel  = 3'b0; 
    ASel    = 1'b0;
    BSel    = 1'b0;
    lwInst  = 1'b0;
    BrUn    = 1'b0;

    casex (InstSel_PPX)                     // {BrEQ, BrLT, Inst[30], Inst[14:12], Inst[6:2]} 
        9'b000001100: begin                 // add
            ALUSel  = 4'b0000;                        
            ASel    = 1'b0;
            BSel    = 1'b0;
        end

        9'b100001100: begin                 // sub
            ALUSel  = 4'b1000;
            ASel    = 1'b0;
            BSel    = 1'b0;                    
        end

        9'b011101100: begin                 // and
            ALUSel  = 4'b0111;
            ASel    = 1'b0;
            BSel    = 1'b0;                     
        end

        9'b011001100: begin                 // or
            ALUSel  = 4'b0110;                        
            ASel    = 1'b0;
            BSel    = 1'b0;                     
        end

        9'bx00000100: begin                 // addi
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b001;
            ASel    = 1'b0;
            BSel    = 1'b1;
        end

        9'bx11100100: begin                 // andi
            ALUSel  = 4'b0111; 
            ImmSel  = 3'b001;                 
            ASel    = 1'b0;
            BSel    = 1'b1;                    
        end

        9'bx11000100: begin                 // ori
            ALUSel  = 4'b0110; 
            ImmSel  = 3'b001;
            ASel    = 1'b0;
            BSel    = 1'b1;                    
        end

        9'bx01000000: begin                 // lw
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b001;
            ASel    = 1'b0;
            BSel    = 1'b1;     
            lwInst  = 1'b1;               
        end

        9'bx01001000: begin                 // sw
            ALUSel  = 4'b0000;   
            ImmSel  = 3'b010;    
            ASel    = 1'b0;
            BSel    = 1'b1;                    
        end

        9'bx00011000: begin             // beq      
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b011;      
            ASel    = 1'b1;
            BSel    = 1'b1;
            BrUn    = 1'b1;                   
        end

        // 9'b0xx00011000: begin              // beq (False)
        //     ALUSel  = 4'b0000;       
        //     ImmSel  = 3'b011;
        //     ASel    = 1'b1;
        //     BSel    = 1'b1;
        //     BrUn    = 1'b1;                 
        // end 

        9'bx00111000: begin             
            ALUSel  = 4'b0000;       
            ImmSel  = 3'b011;
            ASel    = 1'b1;
            BSel    = 1'b1;
            BrUn    = 1'b1;                
        end

        // 9'b1xx00111000: begin              // bne (False)
        //     ALUSel  = 4'b0000;       
        //     ImmSel  = 3'b011;
        //     ASel    = 1'b1;
        //     BSel    = 1'b1;
        //     BrUn    = 1'b1;                   
        // end

        9'bx00011001: begin              // jalr
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b001;       
            ASel    = 1'b0;
            BSel    = 1'b1;         
        end
        
        9'bxxxx11011: begin              // jal
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b100;       
            ASel    = 1'b1;
            BSel    = 1'b1;         
        end

        9'bxxxx00101: begin              // auipc
            ALUSel  = 4'b0000;   
            ImmSel  = 3'b101;     
            ASel    = 1'b1;
            BSel    = 1'b1;         
        end

        default: begin
            ALUSel  = 4'bx;
            ImmSel  = 3'bx; 
            ASel    = 1'bx;
            BSel    = 1'bx;
            lwInst  = 1'bx;
            BrUn    = 1'bx;
        end
    endcase
end
    


endmodule