
module DF_SYNC #(parameter PTR_WD = 4) (
  input       wire                            CLK, RST,
  input       wire        [PTR_WD-1:0]        ASYNC_PTR,
  output      reg         [PTR_WD-1:0]        SYNC_PTR
);



  reg       [1:0]        multi_flops        [PTR_WD-1:0];        
  
  integer i;
  
  
  

always@ (posedge CLK or negedge RST)
  begin
    if(~RST)
      begin
        for(i=0 ; i<PTR_WD ; i=i+1)
          begin
            multi_flops[i] <= 'b0;
          end
      end
      
    else
      begin
        for(i=0 ; i<PTR_WD ; i=i+1)
          begin
            multi_flops[i][0] <= ASYNC_PTR[i];
            SYNC_PTR[i] <= multi_flops[i][0];
          end      
      end     
  end


//always@ (*)
//  begin
//    for(i=0 ; i<PTR_WD ; i=i+1)
//      begin
//        SYNC_PTR[i] <= multi_flops[i][1];
//      end
//  end


endmodule
