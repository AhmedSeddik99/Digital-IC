
module FIFO_WR #(parameter PTR_WD = 4) (
  input       wire                            W_CLK, W_RST,
  input       wire                            W_INC,     
  input       wire        [PTR_WD-1:0]        r2w_ptr,
  output      reg         [PTR_WD-1:0]        gray_wr_ptr,
  output      wire        [PTR_WD-2:0]        wr_addr,
  output      reg                             FULL  
);

  
  
  reg       [PTR_WD-1:0]        wr_ptr;
  
  
  
assign wr_addr = wr_ptr[PTR_WD-2:0];

  
  
always@ (posedge W_CLK or negedge W_RST)
  begin
    if(~W_RST)
      begin
        wr_ptr <= 'b0;
      end
    else if(~FULL && W_INC)
      begin
        wr_ptr <= wr_ptr + 1'b1;
      end
  end  
  
  
always@ (*)
  begin
    case(wr_ptr)
      4'd0 :  gray_wr_ptr = 4'b0000;
      4'd1 :  gray_wr_ptr = 4'b0001;
      4'd2 :  gray_wr_ptr = 4'b0011;
      4'd3 :  gray_wr_ptr = 4'b0010;
      4'd4 :  gray_wr_ptr = 4'b0110;
      4'd5 :  gray_wr_ptr = 4'b0111;
      4'd6 :  gray_wr_ptr = 4'b0101;
      4'd7 :  gray_wr_ptr = 4'b0100;
      4'd8 :  gray_wr_ptr = 4'b1100;
      4'd9 :  gray_wr_ptr = 4'b1101;
      4'd10:  gray_wr_ptr = 4'b1111;
      4'd11:  gray_wr_ptr = 4'b1110;
      4'd12:  gray_wr_ptr = 4'b1010;
      4'd13:  gray_wr_ptr = 4'b1011;
      4'd14:  gray_wr_ptr = 4'b1001;
      4'd15:  gray_wr_ptr = 4'b1000;
    endcase
  end  
           
always@ (*)
  begin
    if((gray_wr_ptr[PTR_WD-1:PTR_WD-2] != r2w_ptr[PTR_WD-1:PTR_WD-2]) && (gray_wr_ptr[PTR_WD-3:0] == r2w_ptr[PTR_WD-3:0]))
      FULL = 1'b1;
    else
      FULL = 1'b0;
  end
            

  
endmodule
