
module data_sampling (
  input       wire                    RX_IN,
  input       wire                    CLK, RST,
  input       wire        [5:0]       Prescale,
  input       wire                    data_samp_en,
  input       wire        [4:0]       edge_cnt,            
  output      reg                     sampled_bit, bit_ready    
);
  
  
  
  
  wire        [4:0]       test_edge;       // 0 -> 16 {Presclae/2} 
  reg         [2:0]       check_bits;      // 3 sampled bits
  reg                     checked_bit; 
  
  
  assign test_edge = Prescale >> 1;  
  
  
   
  
  
always@ (posedge CLK or negedge RST)
  begin
    if(~RST)
      begin
        sampled_bit <= 1'b0;
        check_bits  <= 3'b0;
      end
      
    else if(data_samp_en && edge_cnt == (test_edge - 1'b1))
      begin
        check_bits[0] <= RX_IN; 
      end
      
    else if(data_samp_en && edge_cnt == test_edge)
      begin
        check_bits[1] <= RX_IN; 
      end
      
    else if(data_samp_en && edge_cnt == (test_edge + 1'b1))
      begin
        check_bits[2] <= RX_IN;
        sampled_bit   <= checked_bit;
        bit_ready     <= 1'b1; 
      end
      
    //else if(data_samp_en && edge_cnt == (test_edge + 2'd2))     // or Prescale - 2
//      begin     
//        sampled_bit <= checked_bit;
//        bit_ready   <= 1'b1;
//      end  
    
    else            // ~data_samp_en || (data_samp_en && edge_cnt ~= prev. edges)
      begin
        sampled_bit <= checked_bit;     // to not change sampled_bit 
        bit_ready   <= 1'b0;            // to prevent deser from taking a bit here
        check_bits  <= check_bits;      // to not change sampled_bit
      end
  
  end    




always@ (*)
  begin     
    case(check_bits)
      3'b000 : checked_bit = 1'b0;
      3'b001 : checked_bit = 1'b0;      
      3'b010 : checked_bit = 1'b0;
      3'b011 : checked_bit = 1'b1;
      3'b100 : checked_bit = 1'b0;
      3'b101 : checked_bit = 1'b1;
      3'b110 : checked_bit = 1'b1;
      3'b111 : checked_bit = 1'b1;
      default: checked_bit = 1'b0;
    endcase          
  end                 
    


endmodule