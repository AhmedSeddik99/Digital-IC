
module Parity_Calc (
  input     wire      [7:0]     P_DATA,
  input     wire                CLK, RST,
  input     wire                par_en,   
  input     wire                PAR_TYP,       //PAR_TYP = 1 -> odd, else -> even   
  output    reg                 par_bit                   
);


  wire                par_check;
  reg       [7:0]     par_reg;
  
  
      
always@ (posedge CLK or negedge RST)
  begin
    if (~RST)
      begin
        par_reg  <= 8'b0;
      end
      
    else if (par_en == 1'b1)                   
      begin
        par_reg <= P_DATA;  
      end 
      
    else
        par_reg <= par_reg; 
          
  end
  
  
assign par_check = ^par_reg;                // 1's: odd -> par_check = 1 , even -> par_check = 0  
  
  
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
