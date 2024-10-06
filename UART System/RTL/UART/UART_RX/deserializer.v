
module deserializer (
  input       wire                    CLK, RST,
  input       wire                    deser_en,
  input       wire        [3:0]       bit_cnt, 
  input       wire                    bit_ready,
  input       wire                    sampled_bit,                
  output      reg         [7:0]       P_DATA
);



  reg       [2:0]       index;
  reg       [7:0]       data;
  




always@ (posedge CLK or negedge RST)
  begin
    if(~RST)
      begin
        data  <= 8'b0; 
        index <= 3'b0;      
      end
       
    else if(deser_en && bit_ready && index == (bit_cnt - 1'b1))          
      begin
        data[index] <= sampled_bit;
        index <= index + 1'b1;
      end

    else          // (~deser_en) || ~bit_ready || index ~= bit_cnt - 1'b1
      begin
        data  <= data;
        index <= index;
      end
  
  end
  

always@ (*)
  begin
    P_DATA = data;
  end

 


endmodule