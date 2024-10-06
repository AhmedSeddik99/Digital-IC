
module SYS_TOP #(parameter DATA_WD = 8, ADDR_WD = 4) (
  input       wire        REF_CLK, UART_CLK,
  input       wire        RST,
  input       wire        SYS_RX_IN,
  output      wire        PAR_Err, Frame_Err,     
  output      wire        SYS_TX_OUT
);




  wire                            REF_RST1, REF_RST2, UART_RST;

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





// RST_SYNC Domain(1)
RST_SYNC RST_SYNC_1 (
.CLK(REF_CLK),
.RST(RST),
.SYNC_RST(REF_RST1)
);     

RST_SYNC RST_SYNC_2 (
.CLK(REF_CLK),
.RST(RST),
.SYNC_RST(REF_RST2)
);


// RST_SYNC Domain(2)
RST_SYNC RST_SYNC_3 (
.CLK(UART_CLK),
.RST(RST),
.SYNC_RST(UART_RST)
);



// TX_ClkDiv 
ClkDiv TX_ClkDiv (
.i_ref_clk(UART_CLK),
.i_rst_n(UART_RST),
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
.i_ref_clk(UART_CLK),
.i_rst_n(UART_RST),
.i_clk_en(1'b1),
.i_div_ratio(RX_Div_Ratio),
.o_div_clk(SYS_RX_CLK)
);




// CLK_GATE for ALU_CLK
CLK_GATE ALU_CLK_GATE (
.CLK(REF_CLK),
.CLK_EN(CLKGATE_EN),
.GATED_CLK(ALU_CLK)
);




// PULSE_GEN for TX_Busy
PULSE_GEN BUSY_PULSE_GEN (
.CLK(SYS_TX_CLK),
.RST(UART_RST),
.LVL_SIG(Busy_SIG),
.PULSE_SIG(Busy_PULSE)
);




// DATA_SYNC bet UART & SYS_CTRL
DATA_SYNC #(.NUM_STAGES(2), .BUS_WIDTH(8)) U0_DATA_SYNC (
.CLK(REF_CLK),
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
.RST(UART_RST),                  
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
.W_CLK(REF_CLK),
.W_RST(REF_RST1),
.W_INC(WR_INC),
.WR_DATA(FIFO_WR_DATA),
.FULL(FIFO_FULL),
.R_CLK(SYS_TX_CLK),
.R_RST(UART_RST),
.R_INC(Busy_PULSE),                                
.RD_DATA(FIFO_RD_DATA),
.EMPTY(FIFO_EMPTY)
);




// SYS_CTRL
SYS_CTRL U0_SYS_CTRL (
.CLK(REF_CLK),
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
.CLK(REF_CLK),
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

