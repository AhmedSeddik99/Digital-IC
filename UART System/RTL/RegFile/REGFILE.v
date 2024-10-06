
module REGFILE #(parameter DATA_WD = 8, REGF_MEM_DP = 16, ADDR_WD = 4 ) (
	input    wire                  CLK,
	input    wire                  RST,
	input    wire                  WrEn,
	input    wire                  RdEn,
	input    wire   [ADDR_WD-1:0]  ADDR,
	input    wire   [DATA_WD-1:0]  WR_DATA,
	output   wire   [DATA_WD-1:0]  REG0, REG1, REG2, REG3,
	output   reg    [DATA_WD-1:0]  RD_DATA,
	output   reg                   RD_DATA_VLD
);

integer i ; 
  
reg [DATA_WD-1:0] REGF_MEM [REGF_MEM_DP-1:0] ;    

always @(posedge CLK or negedge RST)
 begin
   if(!RST)  
    begin
	 RD_DATA_VLD <= 1'b0;
	 RD_DATA     <= 1'b0;
      for (i=0 ; i<REGF_MEM_DP ; i=i+1)
        begin
		 if(i==2)
          REGF_MEM[i] <= 'b10000001;
		 else if (i==3) 
          REGF_MEM[i] <= 'b00100000;
         else
          REGF_MEM[i] <= 'b0;		 
        end
     end
   else if (WrEn && !RdEn) 
     begin
      REGF_MEM[ADDR] <= WR_DATA;
     end
   else if (RdEn && !WrEn) 
     begin    
       RD_DATA <= REGF_MEM[ADDR];
	   RD_DATA_VLD <= 1'b1;
     end  
   else
     begin
	   RD_DATA <= 'b0;
	   RD_DATA_VLD <= 1'b0;
     end	 
  end

assign REG0 = REGF_MEM[0];
assign REG1 = REGF_MEM[1]; 
assign REG2 = REGF_MEM[2];
assign REG3 = REGF_MEM[3];


endmodule