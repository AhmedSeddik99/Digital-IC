module ALU #(parameter WIDTH = 32) (
    input       wire        [WIDTH-1:0]     OP_A, OP_B,
    input       wire        [3:0]           ALUSel,             // {FUNCT7[5], FUNCT3} 
    output      reg         [WIDTH-1:0]     ALU_Out
);


    wire    [WIDTH-1:0]     NEW_B;
    wire    [WIDTH-1:0]     sum;


assign NEW_B = (ALUSel[3]) ? ~OP_B : OP_B; 

assign sum   = OP_A + NEW_B + ALUSel[3];


always @(*) begin
    case (ALUSel[2:0])
        3'b000: ALU_Out = sum;        
        3'b110: ALU_Out = OP_A | OP_B;         
        3'b111: ALU_Out = OP_A & OP_B;         
        default: ALU_Out = 'bx;
    endcase
end


endmodule