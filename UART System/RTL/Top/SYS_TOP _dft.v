
module SYS_TOP #(parameter DATA_WD = 8, ADDR_WD = 4, N_CHAINS = 4) (
  input       wire                          scan_clk ,
  input       wire                          scan_rst ,
  input       wire                          test_mode ,
  input       wire                          SE ,
  input       wire   [NUM_OF_CHAINS-1:0]    SI ,
  output      wire   [NUM_OF_CHAINS-1:0]    SO ,

  input       wire        REF_CLK, UART_CLK,
  input       wire        RST,
  input       wire        SYS_RX_IN,
  output      wire        PAR_Err, Frame_Err,     
  output      wire        SYS_TX_OUT
);




  wire                            REF_RST1, REF_RST2, SYNC_UART_SCAN_RST;

  wire                            SYS_TX_CLK, SYS_RX_CLK, ALU_CLK;

  wire        [DATA_WD-1:0]       TX_Div_Ratio, RX_Div_Ratio, UART_Config;
  
  wire                            Busy_SIG, Busy_PULSE;
  
  wire        [DATA_WD-1:0]       RX_DATA, SYS_CTRL_DATA;

  wire                            RX_DATA_VLD, SYS_CTRL_PULSE;

  wire        [DATA_WD-1:0]       FIFO_RD_DATA, FIFO_WR_DATA;

  wire                            FIFO_FULL, FIFO_EMPTY, FIFO_NOT_EMPTY;
  
  wire                            WR_INC, ALU_EN, CLKGATE_EN, ALU_OUT_VLD;
  
  wire        [3:0]               ALU_FUN;

  wire        [2*DATA_WD-1:0]     ALU_OUT;
  
  wire        [DATA_WD-1:0]       OP_A, OP_B;
  
  wire                            Wr_En, Rd_En;
  
  wire        [ADDR_WD-1:0]       REG_ADDR;
  
  wire        [DATA_WD-1:0]       REGF_RD_DATA, REGF_WR_DATA;
  
  wire                            REGF_RD_DATA_VLD;  


 wire                 		       REF_SCAN_CLK;
wire                                   UART_SCAN_CLK;
wire                                   UART_RX_SCAN_CLK;
wire                                   UART_TX_SCAN_CLK;

wire             		       RSTN_SCAN_RST;
wire              		       SYNC_REF1_SCAN_RST;
wire              		       SYNC_REF2_SCAN_RST;
wire              		       SYNC_UART_SCAN_RST;


///********************************************************///
//////////////////// Muxes Clocks & Resets////////////////////
///********************************************************///

//////////////////////// Clocks /////////////////////////////

// Mux primary REF_CLK & SCAN_CLK
mux2X1 U0_mux2X1 (
.IN_0(REF_SCAN_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(REF_SCAN_CLK)
); 

// Mux primary UART_CLK & SCAN_CLK
mux2X1 U1_mux2X1 (
.IN_0(UART_TX_SCAN_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(UART_SCAN_CLK)
); 

// Mux generated UART_RX_CLK & SCAN_CLK
mux2X1 U2_mux2X1 (
.IN_0(UART_RX_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(UART_RX_SCAN_CLK)
); 

// Mux generated UART_TX_CLK & SCAN_CLK
mux2X1 U3_mux2X1 (
.IN_0(UART_TX_CLK),
.IN_1(scan_clk),
.SEL(test_mode),
.OUT(UART_TX_SCAN_CLK)
); 

//////////////////////// Resets /////////////////////////////

// Mux primary RST_N & scan_rst
mux2X1 U4_mux2X1 (
.IN_0(RST_N),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(RSTN_SCAN_RST)
); 

// Mux generated SYNC_REF_RST & scan_rst
mux2X1 U5_mux2X1 (
.IN_0(SYNC_REF1_RST),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(SYNC_REF1_SCAN_RST)
); 

// Mux generated SYNC_REF_RST & scan_rst
mux2X1 U6_mux2X1 (
.IN_0(SYNC_REF2_RST),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(SYNC_REF2_SCAN_RST)
);

// Mux generated SYNC_UART_RST & scan_rst
mux2X1 U7_mux2X1 (
.IN_0(SYNC_SYNC_UART_SCAN_RST),
.IN_1(scan_rst),
.SEL(test_mode),
.OUT(SYNC_UART_SCAN_RST)
); 

/////////////////////////////////////////////////////////////////////////////


// RST_SYNC Domain(1)
RST_SYNC RST_SYNC_1 (
.CLK(REF_SCAN_CLK),
.RST(RSTN_SCAN_RST),
.SYNC_RST(SYNC_REF1_RST)
);     

RST_SYNC RST_SYNC_2 (
.CLK(REF_SCAN_CLK),
.RST(RSTN_SCAN_RST),
.SYNC_RST(SYNC_REF2_RST)
);


// RST_SYNC Domain(2)
RST_SYNC RST_SYNC_3 (
.CLK(UART_SCAN_CLK),
.RST(RSTN_SCAN_RST),
.SYNC_RST(SYNC_UART_RST)
);



// TX_ClkDiv 
ClkDiv TX_ClkDiv (
.i_ref_clk(UART_TX_SCAN_CLK),
.i_rst_n(SYNC_UART_SCAN_RST),
.i_clk_en(1'b1),
.i_div_ratio(TX_Div_Ratio),
.o_div_clk(SYS_TX_CLK)
);



// CLKDIV_MUX for RX Div_Ratio
CLKDIV_MUX RX_CLKDIV_MUX (
.IN(UART_Config[7:2]),
.OUT(RX_Div_Ratio)
);



// RX_ClkDiv 
ClkDiv RX_ClkDiv (
.i_ref_clk(UART_TX_SCAN_CLK),
.i_rst_n(SYNC_UART_SCAN_RST),
.i_clk_en(1'b1),
.i_div_ratio(RX_Div_Ratio),
.o_div_clk(SYS_RX_CLK)
);




// CLK_GATE for ALU_CLK
CLK_GATE ALU_CLK_GATE (
.CLK(REF_SCAN_CLK),
.CLK_EN(CLKG_EN||test_mode),
.GATED_CLK(ALU_CLK)
);




// PULSE_GEN for TX_Busy
PULSE_GEN BUSY_PULSE_GEN (
.CLK(SYS_TX_CLK),
.RST(SYNC_UART_SCAN_RST),
.LVL_SIG(Busy_SIG),
.PULSE_SIG(Busy_PULSE)
);




// DATA_SYNC bet UART & SYS_CTRL
DATA_SYNC #(.NUM_STAGES(2), .BUS_WIDTH(8)) U0_DATA_SYNC (
.CLK(REF_SCAN_CLK),
.RST(REF_RST2),
.unsync_bus(RX_DATA),
.bus_enable(RX_DATA_VLD),
.sync_bus(SYS_CTRL_DATA),
.enable_pulse_d(SYS_CTRL_PULSE)
);




// Empty Inv
INV EMPTY_INV (
.SIG(FIFO_EMPTY),
.NOT_SIG(FIFO_NOT_EMPTY)
);



// UART  
UART U0_UART (
.TX_CLK(SYS_TX_CLK),
.RX_CLK(SYS_RX_CLK),
.RST(SYNC_UART_SCAN_RST),                  
.RX_IN(SYS_RX_IN), 
.PAR_EN(UART_Config[0]),
.PAR_TYP(UART_Config[1]),            
.Prescale(UART_Config[7:2]),         
.TX_P_DATA(FIFO_RD_DATA),        
.TX_DATA_VALID(FIFO_NOT_EMPTY),    
.RX_P_DATA(RX_DATA),
.PAR_Err(PAR_Err),
.Frame_Err(Frame_Err),        
.RX_DATA_VALID(RX_DATA_VLD),    
.TX_OUT(SYS_TX_OUT),
.Busy(Busy_SIG)    
);





// ASYNC_FIFO
ASYNC_FIFO U0_ASYNC_FIFO (
.W_CLK(REF_SCAN_CLK),
.W_RST(REF_RST1),
.W_INC(WR_INC),
.WR_DATA(FIFO_WR_DATA),
.FULL(FIFO_FULL),
.R_CLK(SYS_TX_CLK),
.R_RST(SYNC_UART_SCAN_RST),
.R_INC(Busy_PULSE),                                
.RD_DATA(FIFO_RD_DATA),
.EMPTY(FIFO_EMPTY)
);




// SYS_CTRL
SYS_CTRL U0_SYS_CTRL (
.CLK(REF_SCAN_CLK),
.RST(REF_RST1),
.SYNC_DATA(SYS_CTRL_DATA),
.SYNC_PULSE(SYS_CTRL_PULSE),
.FIFO_FULL(FIFO_FULL),
.RD_DATA(REGF_RD_DATA),
.RD_DATA_VLD(REGF_RD_DATA_VLD),
.ALU_OUT(ALU_OUT),
.ALU_OUT_VLD(ALU_OUT_VLD),            
.WR_EN(Wr_En),
.RD_EN(Rd_En),
.ADDR(REG_ADDR),
.REG_WR_DATA(REGF_WR_DATA),
.ALU_FUN(ALU_FUN),
.ALU_EN(ALU_EN),
.CLKGATE_EN(CLKGATE_EN),
.FIFO_WR_DATA(FIFO_WR_DATA),                   
.WR_INC(WR_INC)
);




// REGFILE
REGFILE U0_REGFILE (
.CLK(REF_SCAN_CLK),
.RST(REF_RST1),
.WrEn(Wr_En),
.RdEn(Rd_En),
.ADDR(REG_ADDR),
.WR_DATA(REGF_WR_DATA),
.REG0(OP_A),
.REG1(OP_B),
.REG2(UART_Config),
.REG3(TX_Div_Ratio),
.RD_DATA(REGF_RD_DATA),
.RD_DATA_VLD(REGF_RD_DATA_VLD)
);




// ALU
ALU U0_ALU (
.CLK(ALU_CLK),
.RST(REF_RST2),
.EN(ALU_EN),
.A(OP_A), 
.B(OP_B),
.ALU_FUN(ALU_FUN),
.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_OUT_VLD)
);



endmodule

