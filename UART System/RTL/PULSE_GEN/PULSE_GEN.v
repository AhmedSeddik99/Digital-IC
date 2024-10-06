
module PULSE_GEN (
  input       wire        CLK, RST,
  input       wire        LVL_SIG,
  output      wire        PULSE_SIG
);



  reg        [1:0]        DFF;
  
  
always@ (posedge CLK or negedge RST)
  begin
    if(~RST)
      begin
        DFF <= 2'b0;
      end
      
    else
      begin
        DFF[0] <= LVL_SIG;
        DFF[1] <= DFF[0];
      end
  end         

assign PULSE_SIG = DFF[0] && ~DFF[1];

endmodule