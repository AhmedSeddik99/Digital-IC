
module UART_MUX #(parameter idle_bit = 1'b1, start_bit = 1'b0, stop_bit = 1'b1) (
  input     wire      [2:0]      mux_sel,
  input     wire                 ser_data, par_bit,
  output    reg                  TX_OUT
);


reg out;






always@ (*)
  begin
    case (mux_sel)
      3'b000 : TX_OUT = idle_bit ;  
      3'b001 : TX_OUT = start_bit;
      3'b011 : TX_OUT = ser_data ;
      3'b010 : TX_OUT = par_bit  ;
      3'b110 : TX_OUT = stop_bit ;
      default: TX_OUT = 1'b0;
    endcase
  end

  
endmodule