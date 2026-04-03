module ControlLogic_PPW (
    input       wire        [8:0]       InstSel_PPW,
    output      reg         [1:0]       WBSel,
    output      reg                     RF_WrEn_W
);



always @(*) begin
    WBSel   = 2'b0;
    RF_WrEn_W = 1'b0;

    casex (InstSel_PPW)                         // {Inst[30], Inst[14:12], Inst[6:2]} 
        9'b000001100: begin                  // add
            WBSel   = 2'd1;
            RF_WrEn_W = 1'b1;            
        end

        9'b100001100: begin                  // sub
            WBSel   = 2'd1;
            RF_WrEn_W = 1'b1;            
        end

        9'b011101100: begin                  // and
            WBSel   = 2'd1;
            RF_WrEn_W = 1'b1;            
        end

        9'b011001100: begin                  // or
            WBSel   = 2'd1;
            RF_WrEn_W = 1'b1;
        end

        9'bx00000100: begin                  // addi
            WBSel   = 2'd1;
            RF_WrEn_W = 1'b1;
        end

        9'bx11100100: begin                  // andi
            WBSel   = 2'd1;
            RF_WrEn_W = 1'b1;
        end

        9'bx11000100: begin                  // ori
            WBSel   = 2'd1;
            RF_WrEn_W = 1'b1;
        end

        9'bx01000000: begin                  // lw
            WBSel   = 2'd0;
            RF_WrEn_W = 1'b1;
        end

        9'bx01001000: begin                  // sw
            RF_WrEn_W = 1'b0;
        end

        9'bx00011000: begin                  // beq 
            RF_WrEn_W = 1'b0;            
        end

        9'bx00111000: begin                  // bne 
            RF_WrEn_W = 1'b0;            
        end

        9'bx00011001: begin                  // jalr
            WBSel   = 2'd2;                
            RF_WrEn_W = 1'b1;
        end
        
        9'bxxxx11011: begin                  // jal
            WBSel   = 2'd2;                
            RF_WrEn_W = 1'b1;
        end

        9'bxxxx00101: begin                  // auipc
            WBSel   = 2'd1;                
            RF_WrEn_W = 1'b1;
        end

        default: begin
            WBSel   = 2'bx;
            RF_WrEn_W = 1'bx;            
        end
    endcase
end
    


endmodule