
module ClkDiv # (parameter width = 8) (
  input        wire                           i_ref_clk, i_rst_n,
  input        wire                           i_clk_en,
  input        wire         [width-1:0]       i_div_ratio,
  output       wire                           o_div_clk
);


wire      [width-2:0]       half_ratio;
reg       [width-2:0]       counter;
reg                         even_num, odd_num;
reg                         half_div, div;



assign half_ratio = i_div_ratio >> 1;



always@ (posedge i_ref_clk or negedge i_rst_n)
  begin
    if(~i_rst_n)
      begin
        counter <= 'b0;
        div <= 1'b0;
      end
      
    else if(i_clk_en && i_div_ratio > 'd1)
      begin 
        if (counter == 'b0)
          begin
            div      <= ~div;
            half_div <= 1'b0;
            counter  <= counter + 1'b1;
          end
              
        else if((counter == half_ratio) && even_num && ~half_div)
          begin
            div      <= ~div;
            half_div <= 1'b1;
            counter  <= counter - 1'b1;
          end
        
        else if((counter == half_ratio) && odd_num && ~half_div)
          begin
            div      <= ~div;
            half_div <= 1'b1;
          end  
              
        else if(half_div)
          begin
            counter <= counter - 1'b1;          
          end
              
        else
          begin
            counter <= counter + 1'b1;         
          end
                    
      end         
      
  end             



always@ (*)
  begin
    odd_num  = 1'b0;
    even_num = 1'b0;
    
    if(i_div_ratio[0] == 1'b1)             // even number
      odd_num  = 1'b1;
    else                                   // odd  number
      even_num = 1'b1;  
  end


assign o_div_clk = (i_clk_en && i_div_ratio > 'd1) ? div : i_ref_clk;


endmodule

