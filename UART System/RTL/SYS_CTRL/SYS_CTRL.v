
module SYS_CTRL #(parameter DATA_WD = 8, ADDR_WD = 4) (
  input       wire                            CLK, RST,
  input       wire        [DATA_WD-1:0]       SYNC_DATA,
  input       wire                            SYNC_PULSE,
  input       wire                            FIFO_FULL,
  input       wire        [DATA_WD-1:0]       RD_DATA,
  input       wire                            RD_DATA_VLD,
  input       wire        [2*DATA_WD-1:0]     ALU_OUT,
  input       wire                            ALU_OUT_VLD,            
  output      reg                             WR_EN, RD_EN,
  output      reg         [ADDR_WD-1:0]       ADDR,
  output      reg         [DATA_WD-1:0]       REG_WR_DATA,
  output      reg         [3:0]               ALU_FUN,
  output      reg                             ALU_EN, CLKGATE_EN,
  output      reg         [DATA_WD-1:0]       FIFO_WR_DATA,                   
  output      reg                             WR_INC                          
);


  
  
  localparam    [3:0]     IDLE         = 4'b0000,
                          WAIT_WR_ADDR = 4'b0001,
                          WAIT_RD_ADDR = 4'b0011,
                          WAIT_DATA    = 4'b0010,
                          RD_REG_DATAF = 4'b0110,
                          WR_REG_DATAF = 4'b0111,
                          WR_REGF_FIFO = 4'b0101,
                          WAIT_OP_A    = 4'b0100,
                          WAIT_OP_B    = 4'b1100,
                          WAIT_ALU_FUN = 4'b1000,
                          ALU_OPER     = 4'b1001,
                          WR_ALU1_FIFO = 4'b1011,
                          WR_ALU2_FIFO = 4'b1111;       
  
  
  
  
  reg           [3:0]             CU, NXT;


  
  

  reg                              REG_EN;
  reg           [DATA_WD-1:0]      REG_ADDR;



// State Transition
always@ (posedge CLK or negedge RST)
  begin
    if (~RST)             // Active Low Reset
      CU <= IDLE;
    else
      CU <= NXT;
  end





// Next State logic
always@ (*)
  begin
    case (CU)
      IDLE        : begin
                      if(SYNC_PULSE && SYNC_DATA == 'hAA)
                        NXT = WAIT_WR_ADDR;
                      else if(SYNC_PULSE && SYNC_DATA == 'hBB)
                        NXT = WAIT_RD_ADDR;
                      else if(SYNC_PULSE && SYNC_DATA == 'hCC)
                        NXT = WAIT_OP_A;
                      else if(SYNC_PULSE && SYNC_DATA == 'hDD)
                        NXT = WAIT_ALU_FUN;
                      else
                        NXT = IDLE;    
                    end
      
      WAIT_WR_ADDR: begin
                      if(SYNC_PULSE)
                        NXT = WAIT_DATA;
                      else
                        NXT = WAIT_WR_ADDR;
                    end
                    
      WAIT_RD_ADDR: begin
                      if(SYNC_PULSE)
                        NXT = RD_REG_DATAF;
                      else
                        NXT = WAIT_RD_ADDR;
                    end
                    
      WAIT_DATA   : begin
                      if(SYNC_PULSE)
                        NXT = WR_REG_DATAF;
                      else
                        NXT = WAIT_DATA;
                    end
                    
      RD_REG_DATAF: begin
                      if(RD_DATA_VLD)
                        NXT = WR_REGF_FIFO;
                      else
                        NXT = RD_REG_DATAF;
                    end
                    
      WR_REG_DATAF: begin
                        NXT = IDLE;
                    end
                    
      WR_REGF_FIFO: begin
                      if(FIFO_FULL)
                        NXT = WR_REGF_FIFO;
                      else
                        NXT = IDLE;
                    end
                    
      WAIT_OP_A   : begin
                      if(SYNC_PULSE)
                        NXT = WAIT_OP_B;
                      else
                        NXT = WAIT_OP_A;
                    end
                    
      WAIT_OP_B   : begin
                      if(SYNC_PULSE)
                        NXT = WAIT_ALU_FUN;
                      else
                        NXT = WAIT_OP_B;
                    end
                    
      WAIT_ALU_FUN: begin
                      if(SYNC_PULSE)
                        NXT = ALU_OPER;
                      else
                        NXT = WAIT_ALU_FUN;
                    end
                    
      ALU_OPER    : begin
                      if(ALU_OUT_VLD)
                        NXT = WR_ALU1_FIFO;
                      else
                        NXT = ALU_OPER;
                    end
                    
                    
      WR_ALU1_FIFO: begin
                      if(FIFO_FULL)
                        NXT = WR_ALU1_FIFO;
                      else
                        NXT = WR_ALU2_FIFO;
                    end
                    
                    
      WR_ALU2_FIFO: begin
                      if(FIFO_FULL)
                        NXT = WR_ALU2_FIFO;
                      else
                        NXT = IDLE;
                    end
   
      default     :     NXT = IDLE;
    endcase
  end





// Output Logic
always@ (*)
  begin
    WR_EN        = 1'b0;
    RD_EN        = 1'b0;
    ALU_EN       = 1'b0;
    CLKGATE_EN   = 1'b0;
    WR_INC       = 1'b0;
    ADDR         =  'b0;
    REG_WR_DATA  =  'b0;
    FIFO_WR_DATA =  'b0;
    ALU_FUN      =  'b0;
    
    REG_EN       = 1'b0;
    case (CU)
      IDLE        : begin
                      WR_EN      = 1'b0;
                      RD_EN      = 1'b0;
                      ALU_EN     = 1'b0;
                      CLKGATE_EN = 1'b0;
                      WR_INC     = 1'b0;
                    end
      
      WAIT_WR_ADDR: begin
                      WR_EN      = 1'b0;
                      RD_EN      = 1'b0;
                      ALU_EN     = 1'b0;
                      CLKGATE_EN = 1'b0;
                      WR_INC     = 1'b0;
                      
                      REG_EN     = 1'b1;
                    end
                    
      WAIT_RD_ADDR: begin
                      WR_EN      = 1'b0;
                      RD_EN      = 1'b0;
                      ALU_EN     = 1'b0;
                      CLKGATE_EN = 1'b0;
                      WR_INC     = 1'b0;
                    end
                    
      WAIT_DATA   : begin
                      ADDR = REG_ADDR;
                    end
                    
      RD_REG_DATAF: begin
                      ADDR  = SYNC_DATA;
                      RD_EN = 1'b1;
                    end
                    
      WR_REG_DATAF: begin
                      WR_EN = 1'b1;
                      ADDR = REG_ADDR;
                      REG_WR_DATA = SYNC_DATA; 
                    end
                    
      WR_REGF_FIFO: begin
                      if(~FIFO_FULL)
                        begin
                          WR_INC = 1'b1;
                          FIFO_WR_DATA = RD_DATA;
                        end
                      else
                        begin
                          WR_INC = 1'b0;
                          FIFO_WR_DATA = 'b0;
                        end
                    end
                    
      WAIT_OP_A   : begin
                      WR_EN      = 1'b0;
                      RD_EN      = 1'b0;
                      ALU_EN     = 1'b0;
                      CLKGATE_EN = 1'b0;
                      WR_INC     = 1'b0;
                    end
                    
      WAIT_OP_B   : begin                // have Value of A
                      ADDR  =  'h0;      // REG0 -> A
                      if(~SYNC_PULSE)
                        WR_EN = 1'b1;
                      else
                        WR_EN = 1'b0;
                      REG_WR_DATA = SYNC_DATA;
                    end
                    
      WAIT_ALU_FUN: begin                // have Value of B
                      ADDR  =  'h1;      // REG1 -> B
                      if(~SYNC_PULSE)
                        WR_EN = 1'b1;
                      else
                        WR_EN = 1'b0;
                        
                      CLKGATE_EN  = 1'b1;
                      REG_WR_DATA = SYNC_DATA;
                    end
                    
      ALU_OPER    : begin                // have Value of ALU_FUN
                      CLKGATE_EN = 1'b1;
                      ALU_EN     = 1'b1;
                      ALU_FUN    = SYNC_DATA;
                    end
                    
                    
      WR_ALU1_FIFO: begin
                      if(~FIFO_FULL)
                        begin
                          WR_INC = 1'b1;
                          FIFO_WR_DATA = ALU_OUT[7:0];
                        end
                      else
                        begin
                          WR_INC = 1'b0;
                          FIFO_WR_DATA = 'b0;
                        end
                    end
                    
                    
      WR_ALU2_FIFO: begin
                      if(~FIFO_FULL)
                        begin
                          WR_INC = 1'b1;
                          FIFO_WR_DATA = ALU_OUT[15:8];
                        end
                      else
                        begin
                          WR_INC = 1'b0;
                          FIFO_WR_DATA = 'b0;
                        end
                    end
                    
      default     : begin
                      WR_EN        = 1'b0;
                      RD_EN        = 1'b0;
                      ALU_EN       = 1'b0;
                      CLKGATE_EN   = 1'b0;
                      WR_INC       = 1'b0;
                      ADDR         =  'b0;
                      REG_WR_DATA  =  'b0;
                      FIFO_WR_DATA =  'b0;
                      ALU_FUN      =  'b0;
                      REG_EN       = 1'b0;
                    end
    endcase
  end

always@ (posedge CLK or negedge RST)
  if(~RST)
    begin
      REG_ADDR <= 'b0;
    end
  else if (REG_EN)
    begin
      REG_ADDR <= SYNC_DATA;
    end



endmodule

