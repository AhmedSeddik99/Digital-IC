
module RST_SYNC #(parameter NUM_STAGES = 2) (
  input       wire        CLK, RST,
  output      reg         SYNC_RST
);



  reg         [1:0]       counter;
  
  
  
always@ (posedge CLK or negedge RST)
  begin
    if(~RST)
      begin
        SYNC_RST <= 1'b0;
        counter  <= 2'b0;  
      end
      
    else if(counter == NUM_STAGES - 1'b1)
      begin
        SYNC_RST <= 1'b1;      
      end
      
    else
      begin
        counter  <= counter + 1'b1;
      end
  end
  
  
  
endmodule  