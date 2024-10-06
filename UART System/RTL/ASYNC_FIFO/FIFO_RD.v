module FIFO_RD #(parameter PTR_WD = 4) (
  input       wire                            R_CLK, R_RST,
  input       wire                            R_INC,     
  input       wire        [PTR_WD-1:0]        w2r_ptr,
  output      reg         [PTR_WD-1:0]        gray_rd_ptr,
  output      wire        [PTR_WD-2:0]        rd_addr,
  output      reg                             EMPTY  
);

  
  
  reg       [PTR_WD-1:0]        rd_ptr;
  
  
  
assign rd_addr = rd_ptr[PTR_WD-2:0];

  
  
always@ (posedge R_CLK or negedge R_RST)
  begin
    if(~R_RST)
      begin
        rd_ptr <= 'b0;
      end
    else if(~EMPTY && R_INC)
      begin
        rd_ptr <= rd_ptr + 1'b1;
      end
  end  
  
  
always@ (*)
  begin
    case(rd_ptr)
      4'd0 :  gray_rd_ptr = 4'b0000;
      4'd1 :  gray_rd_ptr = 4'b0001;
      4'd2 :  gray_rd_ptr = 4'b0011;
      4'd3 :  gray_rd_ptr = 4'b0010;
      4'd4 :  gray_rd_ptr = 4'b0110;
      4'd5 :  gray_rd_ptr = 4'b0111;
      4'd6 :  gray_rd_ptr = 4'b0101;
      4'd7 :  gray_rd_ptr = 4'b0100;
      4'd8 :  gray_rd_ptr = 4'b1100;
      4'd9 :  gray_rd_ptr = 4'b1101;
      4'd10:  gray_rd_ptr = 4'b1111;
      4'd11:  gray_rd_ptr = 4'b1110;
      4'd12:  gray_rd_ptr = 4'b1010;
      4'd13:  gray_rd_ptr = 4'b1011;
      4'd14:  gray_rd_ptr = 4'b1001;
      4'd15:  gray_rd_ptr = 4'b1000;
    endcase
  end  
           
always@ (*)
  begin
    if(gray_rd_ptr == w2r_ptr)
      EMPTY = 1'b1;
    else
      EMPTY = 1'b0;
  end
            

  
endmodule
