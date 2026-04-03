module RegFile #(parameter WIDTH = 32, ADDR = 5, DEPTH = 32) (
    input       wire                        clk,
    input       wire                        WrEn,
    input       wire        [ADDR-1:0]      AddrA, AddrB, AddrD,
    input       wire        [WIDTH-1:0]     DataD,
    output      wire        [WIDTH-1:0]     DataA, DataB
);
    

    reg     [WIDTH-1:0]     MEM     [0:DEPTH-1];


integer i;

always @(negedge clk) begin
    if (WrEn && AddrD != 5'd0) begin
        MEM[AddrD] <= DataD;                            
    end
end    

assign DataA = (AddrA == 'd0)? 0 : MEM[AddrA];
assign DataB = (AddrB == 'd0)? 0 : MEM[AddrB];

endmodule