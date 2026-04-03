module ControlLogic_PPM (
    input       wire        [8:0]       InstSel_PPM,
    input       wire                    BrLT, BrEQ_PPM,
    output      reg                     DMem_RW,
    output      reg                     RF_WrEn_M,
    output      reg                     PCSel
);
    
 

always @(*) begin
    DMem_RW = 1'b0;
    PCSel   = 1'b0;
    RF_WrEn_M = 1'b0;

    casex ({BrEQ_PPM, BrLT, InstSel_PPM})     // {BrEQ_PPM, BrLT, Inst[30], Inst[14:12], Inst[6:2]} 
        11'bxx000001100: begin                // add        
            PCSel   = 1'b0;        
            DMem_RW = 1'b1;
            RF_WrEn_M = 1'b1;
        end

        11'bxx100001100: begin                // sub
            PCSel   = 1'b0;        
            DMem_RW = 1'b1;      
            RF_WrEn_M = 1'b1; 
        end

        11'bxx011101100: begin              // and
            DMem_RW = 1'b1;                        
            PCSel   = 1'b0;
            RF_WrEn_M = 1'b1;            
        end

        11'bxx011001100: begin              // or
            DMem_RW = 1'b1;                        
            PCSel   = 1'b0;
            RF_WrEn_M = 1'b1;
        end

        11'bxxx00000100: begin              // addi
            PCSel   = 1'b0;
            DMem_RW = 1'b1;                        
            RF_WrEn_M = 1'b1;
        end

        11'bxxx11100100: begin              // andi
            PCSel   = 1'b0;
            DMem_RW = 1'b1;                        
            RF_WrEn_M = 1'b1;
        end

        11'bxxx11000100: begin              // ori
            PCSel   = 1'b0;
            DMem_RW = 1'b1;                        
            RF_WrEn_M = 1'b1;
        end

        11'bxxx01000000: begin              // lw
            PCSel   = 1'b0;
            DMem_RW = 1'b1;                        
            RF_WrEn_M = 1'b1;
        end

        11'bxxx01001000: begin              // sw
            PCSel   = 1'b0;
            DMem_RW = 1'b0;  
            RF_WrEn_M = 1'b0;     
        end

        11'b1xx00011000: begin              // beq (True)
            PCSel   = 1'b1;
            DMem_RW = 1'b1;            
            RF_WrEn_M = 1'b0;     
        end

        11'b0xx00011000: begin              // beq (False)
            PCSel   = 1'b0;
            DMem_RW = 1'b1;              
            RF_WrEn_M = 1'b0;     
        end

        11'b0xx00111000: begin              // bne (True)
            PCSel   = 1'b1;            
            DMem_RW = 1'b1;                   
            RF_WrEn_M = 1'b0;     
        end

        11'b1xx00111000: begin              // bne (False)
            PCSel   = 1'b0;
            DMem_RW = 1'b1;            
            RF_WrEn_M = 1'b0;     
        end

        11'bxxx00011001: begin              // jalr
            PCSel   = 1'b1;
            DMem_RW = 1'b1;  
            RF_WrEn_M = 1'b1;
        end
        
        11'bxxxxxx11011: begin              // jal
            PCSel   = 1'b1;
            DMem_RW = 1'b1;                   
            RF_WrEn_M = 1'b1;
            RF_WrEn_M = 1'b1;
        end

        11'bxxxxxx00101: begin              // auipc
            PCSel   = 1'b0;
            DMem_RW = 1'b1;                   
            RF_WrEn_M = 1'b1;
        end

        default: begin
            PCSel   = 1'b0;
            DMem_RW = 1'bx;            
            RF_WrEn_M = 1'bx;
        end
    endcase
end
    


endmodule