module mux4x1 #(parameter WIDTH = 32) (
    input       wire        [WIDTH-1:0]     in0, in1, in2, in3,
    input       wire        [1:0]           sel,
    output      reg         [WIDTH-1:0]     out
);
    


always @(*) begin
    case (sel)
        2'd0: out = in0;
        2'd1: out = in1;
        2'd2: out = in2;
        2'd3: out = in3;
        default: out = 'bx;
    endcase
end    


endmodule