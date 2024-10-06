
module ASYNC_FIFO #(parameter PTR_WIDTH = 4, DATA_WIDTH = 8, FIFO_DEPTH = 8) (
  input       wire        [DATA_WIDTH-1:0]        WR_DATA,
  input       wire                                W_CLK, W_RST,
  input       wire                                W_INC,
  input       wire                                R_CLK, R_RST,
  input       wire                                R_INC,                                
  output      wire        [DATA_WIDTH-1:0]        RD_DATA,
  output      wire                                FULL, EMPTY
);

  
  
  wire        [PTR_WIDTH-2:0]       wr_addr, rd_addr;
  wire        [PTR_WIDTH-1:0]       w2r_ptr, r2w_ptr;
  wire        [PTR_WIDTH-1:0]       gray_wr_ptr, gray_rd_ptr;
  
  
  
  
FIFO_MEM #(.PTR_WD(PTR_WIDTH), .DATA_WD(DATA_WIDTH), .FIFO_DP(FIFO_DEPTH)) U0_FIFO_MEM (
.W_CLK(W_CLK),
.W_RST(W_RST),
.W_INC(W_INC),
.FULL(FULL),
.wr_addr(wr_addr),
.rd_addr(rd_addr),
.WR_DATA(WR_DATA),
.RD_DATA(RD_DATA)
);  




// RD -> WR SYNC
DF_SYNC #(.PTR_WD(PTR_WIDTH)) RD_WR_DF_SYNC (
.CLK(W_CLK),
.RST(W_RST),
.ASYNC_PTR(gray_rd_ptr),
.SYNC_PTR(r2w_ptr)
);


FIFO_WR #(.PTR_WD(PTR_WIDTH)) U0_FIFO_WR (
.W_CLK(W_CLK),
.W_RST(W_RST),
.W_INC(W_INC),
.r2w_ptr(r2w_ptr),
.gray_wr_ptr(gray_wr_ptr),
.wr_addr(wr_addr),
.FULL(FULL)
);



// WR -> RD SYNC
DF_SYNC #(.PTR_WD(PTR_WIDTH)) WR_RD_DF_SYNC (
.CLK(R_CLK),
.RST(R_RST),
.ASYNC_PTR(gray_wr_ptr),
.SYNC_PTR(w2r_ptr)
);


FIFO_RD #(.PTR_WD(PTR_WIDTH)) U0_FIFO_RD (
.R_CLK(R_CLK),
.R_RST(R_RST),
.R_INC(R_INC),
.w2r_ptr(w2r_ptr),
.gray_rd_ptr(gray_rd_ptr),
.rd_addr(rd_addr),
.EMPTY(EMPTY)
);




endmodule