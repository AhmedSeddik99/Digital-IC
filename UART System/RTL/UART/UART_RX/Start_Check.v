
module Start_Check(
  //input       wire        CLK, RST,
  input       wire        strt_chk_en,       
  input       wire        sampled_bit,
  output      reg         strt_glitch
);






always@ (*)
  begin
    if(strt_chk_en)
      begin
        if(sampled_bit == 1'b1)       
          strt_glitch = 1'b1;         // start bit = 0
        else
          strt_glitch = 1'b0;      
      end
      
    else
      begin
        strt_glitch = 1'b0;
      end
      
  end


endmodule