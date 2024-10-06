
module edge_bit_counter (
  input       wire                    CLK, RST,
  input       wire        [5:0]       Prescale,        
  input       wire                    edge_cnt_en,
  output      reg         [4:0]       edge_cnt,         
  output      reg         [3:0]       bit_cnt
);




  reg         [4:0]       e_count;         
  reg         [3:0]       b_count;





always@ (posedge CLK or negedge RST)
  begin
    if(~RST)
      begin
        e_count  <= 5'b0;
        b_count  <= 4'b0;
      end
      
    else if(edge_cnt_en && e_count == (Prescale - 1'b1) && b_count == 4'd10)
      begin
        e_count <= 5'b0;
        b_count <= 4'b0;
      end
      
    else if(edge_cnt_en && e_count == (Prescale - 1'b1))
      begin
        e_count <= 5'b0;
        b_count <= b_count + 1'b1;
      end
      
    else if(edge_cnt_en && e_count < (Prescale - 1'b1))
      begin
        e_count  <= e_count + 1'b1;  
      end  
      
    
    else            // ~edge_cnt_en
      begin
        e_count  <= 5'b0;
        b_count  <= 4'b0;
      end               
    
  end
  
    
  
always@ (*)
  begin
    edge_cnt = e_count;
    bit_cnt  = b_count;
  end  


endmodule