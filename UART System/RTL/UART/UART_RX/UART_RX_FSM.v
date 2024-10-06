
module UART_RX_FSM (
  input       wire                    CLK, RST,
  input       wire                    RX_IN, PAR_EN,
  input       wire                    strt_glitch, par_err, stp_err,           
  input       wire        [3:0]       bit_cnt, 
  input       wire        [4:0]       edge_cnt,
  input       wire        [5:0]       Prescale,
  output      reg                     edge_cnt_en, data_samp_en, deser_en,                     
  output      reg                     strt_chk_en, par_chk_en, stp_chk_en,
  output      reg                     Data_Valid

);




  localparam     [2:0]      IDLE  = 3'b000,
                            START = 3'b001,
                            DESER = 3'b011,
                            PAR   = 3'b010,
                            STOP  = 3'b110,
                            CHECK = 3'b100;
                            
                                      
                                                      
                            
  reg            [2:0]      CU, NXT;                          




always@ (posedge CLK or negedge RST)
  begin
    if(~RST)
      CU <= IDLE;
    else
      CU <= NXT;
  end




// Next State Logic
always@ (*)
  begin
    case (CU)
      IDLE   : begin
                 if(bit_cnt == 4'd0 && RX_IN == 1'b0)
                   NXT = START;
                 else
                   NXT = IDLE;
               end
              
      START  : begin
                 if(bit_cnt == 4'd1 && strt_glitch == 1'b1)
                   NXT = IDLE;
                 else if(bit_cnt == 4'd1 && strt_glitch == 1'b0)
                   NXT = DESER;
                 else               // bit_cnt = 0
                   NXT = START;
               end
      
      DESER  : begin
                 if(bit_cnt == 4'd9 && PAR_EN == 1'b1)
                   NXT = PAR;
                 else if(bit_cnt == 4'd9 && PAR_EN == 1'b0)
                   NXT = STOP;
                 else               // bit_cnt = 1 -> 8
                   NXT = DESER;
               end
              
      
      PAR    : begin
                 if(bit_cnt == 4'd10)
                   NXT = STOP;
                 //else if(bit_cnt == 4'd10 && par_err)
//                   NXT = IDLE;
                 else               // bit_cnt = 9
                   NXT = PAR;
               end

      STOP   : begin
                 if((edge_cnt == Prescale - 2'd2) && ((PAR_EN == 1'b1 && bit_cnt == 4'd10) || (PAR_EN == 1'b0 && bit_cnt == 4'd9))) 
                   NXT = CHECK;
                 else                 
                   NXT = STOP;  
               end
      
      CHECK  : begin
                 if(RX_IN == 1'b0)
                   NXT = START;
                 else
                   NXT = IDLE; 
               end                                 
      
      default: begin
                   NXT = IDLE;
               end 
                               
    endcase
  end                  





// Output Logic
always@ (*)
  begin
    edge_cnt_en  = 1'b0;
    data_samp_en = 1'b0;
    deser_en     = 1'b0;
    strt_chk_en  = 1'b0;
    par_chk_en   = 1'b0;
    stp_chk_en   = 1'b0;
    Data_Valid   = 1'b0;
    case (CU)
      IDLE   : begin
                 edge_cnt_en  = 1'b0;		// reset edge_cnt & bit_cnt
                 data_samp_en = 1'b0;
                 deser_en     = 1'b0;
                 strt_chk_en  = 1'b0;
                 par_chk_en   = 1'b0;
                 stp_chk_en   = 1'b0;
                 Data_Valid   = 1'b0;         
               end
              
      START  : begin
                 edge_cnt_en  = 1'b1;
                 data_samp_en = 1'b1;
                 strt_chk_en  = 1'b1;
                 Data_Valid   = 1'b0;
               end
      
      DESER  : begin
                 edge_cnt_en  = 1'b1;
                 data_samp_en = 1'b1;
                 strt_chk_en  = 1'b0;
                 deser_en     = 1'b1;
               end
              
      
      PAR    : begin
                 edge_cnt_en  = 1'b1;
                 data_samp_en = 1'b1;
                 deser_en     = 1'b0;
                 par_chk_en   = 1'b1;              
               end
           
      
      STOP   : begin
                 edge_cnt_en  = 1'b1;
                 data_samp_en = 1'b1;
                 par_chk_en   = 1'b0;
                 stp_chk_en   = 1'b1;               
               end
      
      CHECK  : begin
                 edge_cnt_en  = 1'b0;      
                 data_samp_en = 1'b0;
                 par_chk_en   = 1'b0;
                 stp_chk_en   = 1'b1;
                 if(~stp_err && ~par_err)
                   Data_Valid = 1'b1;
                 else                 
                   Data_Valid = 1'b0;
               end                                 
      
      default: begin
                 edge_cnt_en  = 1'b0;
                 data_samp_en = 1'b0;
                 deser_en     = 1'b0;
                 strt_chk_en  = 1'b0;
                 par_chk_en   = 1'b0;
                 stp_chk_en   = 1'b0;
                 Data_Valid   = 1'b0;
               end 
                               
    endcase
  end                  



endmodule