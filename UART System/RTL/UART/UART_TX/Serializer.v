
module Serializer (
  input     wire      [7:0]     P_DATA,
  input     wire                CLK, RST,
  input     wire                ser_en,
  output    reg                 ser_done, ser_data
);


reg               DATA_ready;
reg     [3:0]     counter;    				// count: 0 -> 8
reg     [7:0]     ser_reg; 




always@ (posedge CLK or negedge RST)
  begin
    if (~RST)
      begin
        ser_data   <= 1'b0;  
        counter    <= 4'b0;
        ser_reg    <= 8'b0;
        DATA_ready <= 1'b1;
      end
      
    else if (ser_en && counter < 4'd8)
      begin
        ser_data   <= ser_reg[counter];
        counter    <= counter + 1'b1; 
        DATA_ready <= 1'b0;
      end
      
    else if (DATA_ready == 1'b1)
      begin
        ser_reg   <= P_DATA; 
      end
      
    else if (ser_en && counter == 4'd8)
      begin
        counter    <= 4'b0;
        DATA_ready <= 1'b1;  
      end
  
    else         				
      begin
        ser_data   <= 1'b0;
        counter    <= 4'b0;
	ser_reg    <= 8'b0; 				
        DATA_ready <= 1'b1;				
      end
 
  end
  


always@ (*)
  begin
    if (counter == 8)
      begin
        ser_done = 1'b1;
      end
    
    else
      begin
        ser_done = 1'b0;
      end
    
  end



endmodule
