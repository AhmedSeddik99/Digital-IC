
module Parity_Check (
  input       wire                    CLK, RST, 
  input       wire        [7:0]       P_DATA,  
  input       wire                    PAR_TYP,
  input       wire                    par_chk_en,       
  input       wire                    sampled_bit,
  output      reg                     par_err
);



  wire                    par_check; 
  reg                     par_bit;
  
  
  
assign par_check = ^P_DATA;



always@ (posedge CLK or negedge RST)
  begin
    if(~RST)
      begin
        par_err <= 1'b0;
      end         
    else if(par_chk_en)
      begin
        if(sampled_bit == par_bit)
          par_err <= 1'b0;               
        else
          par_err <= 1'b1;      
      end
  end
  
  
always@ (*)
  begin
    if (PAR_TYP == 1'b1)                    // Odd Parity
      begin
        if (par_check == 1)                 // 1's: odd
          par_bit <= 1'b0;
        else                                // 1's: even
          par_bit <= 1'b1;
      end
    
    else if (PAR_TYP == 1'b0)               // Even Parity
      begin
        if (par_check == 1)                 // 1's: odd
          par_bit <= 1'b1;
        else                                // 1's: even
          par_bit <= 1'b0;
      end
      
    else
      begin
        par_bit <= 1'b0;
      end
  end
  



endmodule
