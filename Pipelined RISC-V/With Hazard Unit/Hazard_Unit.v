module Hazard_Unit (
    input       wire        [4:0]       rs1_PPX, rs2_PPX, rd_PPM, rd_PPW,       // Forward
    input       wire        [4:0]       rs1_PPD, rs2_PPD, rd_PPX,               // Stall
    input       wire                    RF_WrEn_M, RF_WrEn_W,
    input       wire                    lwInst,
    output      reg         [1:0]       FwA, FwB,
    output      reg                     StallD, StallF    
);
    




always @(*) begin
    if (RF_WrEn_W && (rd_PPW != 5'b0) && (rd_PPW == rs1_PPX)) begin                // Forward WB_Out
        FwA = 2'b10;
    end    
    else if (RF_WrEn_M && (rd_PPM != 5'b0) && (rd_PPM == rs1_PPX)) begin           // Forward ALU_Out
        FwA = 2'b11;
    end    
    else begin
        FwA = 2'b00;
    end
end    


always @(*) begin
    if (RF_WrEn_W && (rd_PPW != 5'b0) && (rd_PPW == rs2_PPX)) begin                // Forward WB_Out
        FwB = 2'b10;
    end    
    else if (RF_WrEn_M && (rd_PPM != 5'b0) && (rd_PPM == rs2_PPX)) begin           // Forward ALU_Out
        FwB = 2'b11;
    end    
    else begin
        FwB = 2'b00;
    end
end     


always @(*) begin
    if (lwInst && ((rd_PPX == rs1_PPD) | (rd_PPX == rs2_PPD))) begin
        StallF = 1'b1;
        StallD = 1'b1;        
    end
    else begin
        StallF = 1'b0;
        StallD = 1'b0;
    end
end



endmodule