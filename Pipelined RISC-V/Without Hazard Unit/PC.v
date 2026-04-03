module PC #(parameter WIDTH = 32) (
    input       wire                    clk, rst,
    input       wire        [WIDTH-1:0]      PrevPC,
    output      reg         [WIDTH-1:0]      NextPC
);
    


always @(posedge clk or negedge rst) begin
    if (!rst) begin
        NextPC <= 32'b0;
    end
    else begin
        NextPC <= PrevPC;
    end
end

endmodule