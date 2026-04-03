module DFF #(parameter WIDTH = 32) (
    input       wire                        clk, rst,
    input       wire        [WIDTH-1:0]     din,
    output      reg         [WIDTH-1:0]     qout
);



always @(posedge clk or negedge rst) begin
    if (!rst) begin
        qout <= {WIDTH{1'b0}};
    end
    else begin
        qout <= din;
    end
end

    
endmodule