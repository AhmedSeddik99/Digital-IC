
module UART_FSM (
  input     wire              DATA_VALID, PAR_EN, ser_done,
  input     wire              CLK, RST,
  output    reg               ser_en, par_en, Busy,
  output    reg     [2:0]     mux_sel     
);




// States Declaration
  localparam    [2:0]     IDLE   = 3'b000,
                          START  = 3'b001,
                          S_DATA = 3'b011,
                          PARITY = 3'b010,
                          STOP   = 3'b110;




  reg           [2:0]     CU, NXT;
  
  
  
  
  
// State Transition
always@ (posedge CLK or negedge RST)
  begin
    if (~RST)             // Active Low Reset
      CU <= IDLE;
    else
      CU <= NXT;
  end
 
 
 
 

// Next State logic
always@ (*)
  begin
    case (CU)
      IDLE:    begin
                 if (DATA_VALID == 1'b1)
                   NXT = START;
                 else
                   NXT = IDLE;
               end
            
      START:   begin
                   NXT = S_DATA;  
               end
              
      S_DATA:  begin
                 if (ser_done == 1'b1 && PAR_EN == 1'b1)        // Parity bit
                   NXT = PARITY;
                 else if (ser_done == 1'b1 && PAR_EN == 1'b0)   // No Parity bit
                   NXT = STOP;
                 else 
                   NXT = S_DATA;
               end
              
      PARITY:  begin
                   NXT = STOP;
               end
              
      STOP:    begin
                 /* if (DATA_VALID == 1'b1)
                   NXT = START;
                 else */
                   NXT = IDLE;   
               end
              
      default:     NXT = IDLE; 
       
    endcase                                
  end
  
  
  
   
  
  
// Output Logic
always@ (*)
  begin
    ser_en  = 1'b0;
    par_en  = 1'b0;
    Busy    = 1'b0;
    mux_sel = 3'b0;
    
    case (CU)
      IDLE:    begin
                 Busy    = 1'b0;
                 mux_sel = 3'b000;        // TX_OUT = idle_bit
               end
      
      START:   begin
                 ser_en  = 1'b1;
                 par_en  = 1'b1;
                 Busy    = 1'b1;
                 mux_sel = 3'b001;        // TX_OUT = start_bit
               end

      S_DATA:  begin
                 ser_en  = 1'b1;
                 Busy    = 1'b1;
                 mux_sel = 3'b011;        // TX_OUT = ser_data
               end

      PARITY:  begin
                 Busy    = 1'b1;
                 mux_sel = 3'b010;        // TX_OUT = par_bit if exists
               end
            
      STOP:    begin
                 Busy    = 1'b1;
                 mux_sel = 3'b110;        // TX_OUT = stop_bit
               end
          
      default: begin
                 ser_en  = 1'b0;
                 Busy    = 1'b0;
                 mux_sel = 3'b0;
               end                  
    
    endcase 
  end  

endmodule