module DMEM #(parameter WIDTH = 32) (
    input       wire                        clk,
    input       wire                        MemRW,          // 1 -> Read, 0 -> Write
    input       wire        [7:0]           addr,
    input       wire        [WIDTH-1:0]     DataWr,
    output      wire        [WIDTH-1:0]     DataRd
);


    reg     [WIDTH-1:0]  DataMEM  [0:255];


always @(posedge clk) begin
    if (!MemRW) begin
        DataMEM[addr] <= DataWr;
    end
end
    

assign DataRd = (MemRW)? DataMEM[addr] : 32'bx;    


endmodule