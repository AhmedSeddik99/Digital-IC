
module UART_RX (
  input       wire                    RX_IN,
  input       wire                    CLK, RST,
  input       wire        [5:0]       Prescale,
  input       wire                    PAR_EN, PAR_TYP, 
  output      wire        [7:0]       P_DATA,
  output      wire                    PAR_Err, Frame_Err,
  output      wire                    Data_Valid

);





  wire                    edge_cnt_en, data_samp_en, deser_en; 
  wire                    strt_chk_en, par_chk_en, stp_chk_en;
  wire                    strt_glitch;
  wire                    sampled_bit, bit_ready;
  
  wire        [4:0]       edge_cnt;      // 0 -> 7 or 15 or 31   
  wire        [3:0]       bit_cnt;       // 0 -> 10 or 11 bits 





// UART_RX_FSM Instantiation
UART_RX_FSM UART_RX_FSM_Instance (
  .CLK(CLK),
  .RST(RST),
  .RX_IN(RX_IN),
  .PAR_EN(PAR_EN),
  .Prescale(Prescale),
  .edge_cnt(edge_cnt),
  .bit_cnt(bit_cnt),
  .strt_glitch(strt_glitch),
  .edge_cnt_en(edge_cnt_en),
  .data_samp_en(data_samp_en),
  .deser_en(deser_en),
  .strt_chk_en(strt_chk_en),
  .par_chk_en(par_chk_en),
  .stp_chk_en(stp_chk_en),
  .par_err(PAR_Err),
  .stp_err(Frame_Err),
  .Data_Valid(Data_Valid)
);




// edge_bit_counter Instantiation
edge_bit_counter edge_bit_counter_Instance (
  .CLK(CLK),
  .RST(RST),
  .Prescale(Prescale),
  .edge_cnt_en(edge_cnt_en),
  .edge_cnt(edge_cnt),
  .bit_cnt(bit_cnt)  
);



// data_sampling Instantiation
data_sampling data_sampling_Instance (
  .CLK(CLK),
  .RST(RST),
  .RX_IN(RX_IN),
  .Prescale(Prescale),
  .data_samp_en(data_samp_en),
  .edge_cnt(edge_cnt),
  .sampled_bit(sampled_bit),
  .bit_ready(bit_ready)
);



// deserializer Instantiation
deserializer deserializer_Instance (
  .CLK(CLK),
  .RST(RST),
  .deser_en(deser_en),
  .sampled_bit(sampled_bit),
  .bit_ready(bit_ready),
  .bit_cnt(bit_cnt),
  .P_DATA(P_DATA)
);



// Start_Check Instantiation
Start_Check Start_Check_Instance (
  .strt_chk_en(strt_chk_en),
  .sampled_bit(sampled_bit),
  .strt_glitch(strt_glitch)
);
  
  

// Parity_Check Instantiation
Parity_Check Parity_Check_Instance (
  .CLK(CLK),
  .RST(RST),
  .PAR_TYP(PAR_TYP),
  .par_chk_en(par_chk_en),
  .sampled_bit(sampled_bit),
  .P_DATA(P_DATA),
  .par_err(PAR_Err)
);




// Stop_Check Instantiation
Stop_Check Stop_Check_Instance (
  .CLK(CLK),
  .RST(RST),
  .stp_chk_en(stp_chk_en),
  .sampled_bit(sampled_bit),
  .stp_err(Frame_Err)
);
  
  


endmodule