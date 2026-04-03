module ImmGen #(parameter WIDTH = 32) (
    input       wire        [WIDTH-1:0]     Inst,
    input       wire        [2:0]           ImmSel,
    output      reg         [31:0]          ImmOut
);
    

always @(*) begin
    case (ImmSel)
        3'b001:  ImmOut = {{21{Inst[31]}}, Inst[30:20]};                                        // I-format
        3'b010:  ImmOut = {{21{Inst[31]}}, Inst[30:25], Inst[11:7]};                            // S-format
        3'b011:  ImmOut = {{20{Inst[31]}}, Inst[7], Inst[30:25], Inst[11:8], 1'b0};             // B-format
        3'b100:  ImmOut = {{12{Inst[31]}}, Inst[19:12], Inst[20], Inst[30:21], 1'b0};           // J-format
        3'b101:  ImmOut = {Inst[31:12], {12{1'b0}}};                                            // U-format
        default: ImmOut = 32'bx;
    endcase
end


endmodule