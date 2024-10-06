
module UART_TX (
  input     wire    [7:0]     P_DATA,
  input     wire              CLK, RST, 
  input     wire              PAR_EN, PAR_TYP, DATA_VALID,
  output    wire              TX_OUT, Busy    
);

  
  
// Internal Signals
  wire                 ser_done, ser_en;
  wire                 ser_data, par_en, par_bit;
  wire      [2:0]      mux_sel; 
  
  
  

// UART_FSM Instantaition
  UART_FSM UART_FSM_Instance (
  .CLK(CLK),
  .RST(RST),
  .DATA_VALID(DATA_VALID),
  .PAR_EN(PAR_EN),
  .ser_done(ser_done),
  .ser_en(ser_en),
  .par_en(par_en),
  .mux_sel(mux_sel),
  .Busy(Busy)
  );




// Serializer Instantaition
  Serializer Serializer_Instance (
  .CLK(CLK),
  .RST(RST),
  .P_DATA(P_DATA),
  .ser_en(ser_en),
  .ser_done(ser_done),
  .ser_data(ser_data)
  );




// Parity_Calc Instantaition
  Parity_Calc Parity_Calc_Instance (
  .CLK(CLK),
  .RST(RST),
  .P_DATA(P_DATA),
  .PAR_TYP(PAR_TYP),
  .par_en(par_en),
  .par_bit(par_bit)
  );




// UART_MUX Instantaition
  UART_MUX UART_MUX_Instance (
  .ser_data(ser_data),
  .par_bit(par_bit),
  .mux_sel(mux_sel),
  .TX_OUT(TX_OUT)
  );  




endmodule
