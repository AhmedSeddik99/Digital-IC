module DFF_EN #(parameter WIDTH = 32) (
    input       wire                        clk, rst,
    input       wire                        EN,
    input       wire        [WIDTH-1:0]     din,
    output      reg         [WIDTH-1:0]     qout
);



always @(posedge clk or negedge rst) begin
    if (!rst) begin
        qout <= {WIDTH{1'b0}};
    end
    else if (EN) begin
        qout <= din;
    end
end

    
endmodule