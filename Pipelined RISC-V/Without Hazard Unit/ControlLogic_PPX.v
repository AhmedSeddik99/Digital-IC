module ControlLogic_PPX (
    input       wire        [8:0]       InstSel_PPX,
    input       wire                    BrLT, BrEQ,
    output      reg         [3:0]       ALUSel,
    output      reg         [2:0]       ImmSel,
    output      reg                     ASel, BSel,
    output      reg                     BrUn
);
    
    wire        [10:0]      CtrlSel;

    assign CtrlSel = {BrEQ, BrLT, InstSel_PPX};

always @(*) begin
    ALUSel  = 4'b0;
    ImmSel  = 3'b0; 
    ASel    = 1'b0;
    BSel    = 1'b0;
    BrUn    = 1'b0;

    casex (CtrlSel)                          // {BrEQ, BrLT, Inst[30], Inst[14:12], Inst[6:2]} 
        11'bxx000001100: begin                // add
            ALUSel  = 4'b0000;                        
            ASel    = 1'b0;
            BSel    = 1'b0;
        end

        11'bxx100001100: begin                // sub
            ALUSel  = 4'b1000;
            ASel    = 1'b0;
            BSel    = 1'b0;                    
        end

        11'bxx011101100: begin              // and
            ALUSel  = 4'b0111;
            ASel    = 1'b0;
            BSel    = 1'b0;                     
        end

        11'bxx011001100: begin              // or
            ALUSel  = 4'b0110;                        
            ASel    = 1'b0;
            BSel    = 1'b0;                     
        end

        11'bxxx00000100: begin              // addi
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b001;
            ASel    = 1'b0;
            BSel    = 1'b1;
        end

        11'bxxx11100100: begin              // andi
            ALUSel  = 4'b0111; 
            ImmSel  = 3'b001;                 
            ASel    = 1'b0;
            BSel    = 1'b1;                    
        end

        11'bxxx11000100: begin              // ori
            ALUSel  = 4'b0110; 
            ImmSel  = 3'b001;
            ASel    = 1'b0;
            BSel    = 1'b1;                    
        end

        11'bxxx01000000: begin              // lw
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b001;
            ASel    = 1'b0;
            BSel    = 1'b1;                    
        end

        11'bxxx01001000: begin              // sw
            ALUSel  = 4'b0000;   
            ImmSel  = 3'b010;    
            ASel    = 1'b0;
            BSel    = 1'b1;                    
        end

        11'b1xx00011000: begin              // beq (True)
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b011;      
            ASel    = 1'b1;
            BSel    = 1'b1;
            BrUn    = 1'b1;                   
        end

        11'b0xx00011000: begin              // beq (False)
            ALUSel  = 4'b0000;       
            ImmSel  = 3'b011;
            ASel    = 1'b1;
            BSel    = 1'b1;
            BrUn    = 1'b1;                 
        end

        11'b0xx00111000: begin              // bne (True)
            ALUSel  = 4'b0000;       
            ImmSel  = 3'b011;
            ASel    = 1'b1;
            BSel    = 1'b1;
            BrUn    = 1'b1;                
        end

        11'b1xx00111000: begin              // bne (False)
            ALUSel  = 4'b0000;       
            ImmSel  = 3'b011;
            ASel    = 1'b1;
            BSel    = 1'b1;
            BrUn    = 1'b1;                   
        end

        11'bxxx00011001: begin              // jalr
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b001;       
            ASel    = 1'b0;
            BSel    = 1'b1;         
        end
        
        11'bxxxxxx11011: begin              // jal
            ALUSel  = 4'b0000; 
            ImmSel  = 3'b100;       
            ASel    = 1'b1;
            BSel    = 1'b1;         
        end

        11'bxxxxxx00101: begin              // auipc
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
            BrUn    = 1'bx;
        end
    endcase
end
    


endmodule