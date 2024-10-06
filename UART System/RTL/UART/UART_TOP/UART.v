
module UART (
  input       wire                    RST,                // both
  input       wire                    TX_CLK, RX_CLK,     // both 
  input       wire                    RX_IN,              // RX
  input       wire        [5:0]       Prescale,           // RX
  input       wire                    PAR_EN, PAR_TYP,    // both
  input       wire        [7:0]       TX_P_DATA,          // TX
  input       wire                    TX_DATA_VALID,      // TX
  output      wire        [7:0]       RX_P_DATA,          // RX
  output      wire                    RX_DATA_VALID,      // RX
  output      wire                    PAR_Err, Frame_Err, // RX
  output      wire                    TX_OUT, Busy        // TX
);



UART_TX U0_UART_TX (
.RST(RST),
.CLK(TX_CLK),
.PAR_EN(PAR_EN),
.PAR_TYP(PAR_TYP),
.P_DATA(TX_P_DATA),
.DATA_VALID(TX_DATA_VALID),
.TX_OUT(TX_OUT),
.Busy(Busy)
);




UART_RX U0_UART_RX (
.RST(RST),
.CLK(RX_CLK),
.PAR_EN(PAR_EN),
.PAR_TYP(PAR_TYP),
.RX_IN(RX_IN),
.Prescale(Prescale),
.P_DATA(RX_P_DATA),
.PAR_Err(PAR_Err),
.Frame_Err(Frame_Err),
.Data_Valid(RX_DATA_VALID)
);



endmodule