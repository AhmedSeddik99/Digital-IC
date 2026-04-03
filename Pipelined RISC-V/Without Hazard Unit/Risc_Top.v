module Risc_Top #(parameter WIDTH = 32) (
    input       wire                        clk, rst,
    input       wire        [WIDTH-1:0]     Inst,               // IMEM
    input       wire        [WIDTH-1:0]     DMEM_Data,          // DMEM
    output      wire                        DMem_RW,            // DMEM
    output      wire        [WIDTH-1:0]     PC_Out, DataB_PPM, ALU_Out_PPM
);
    


//// Internal Signals \\\\

// DataPath Outputs
    wire    BrLT, BrEQ;        
//--------------------------------------------


// Control Logic Outputs
    wire        [3:0]       ALUSel;
    wire        [2:0]       ImmSel;
    wire        [1:0]       WBSel;
    wire                    RF_WrEn;
    wire                    PCSel, ASel, BSel;
    wire                    BrUn;
//---------------------------------------------

    // wire        [8:0]       Inst_Ctrl_PPF;
    wire        [8:0]       Inst_Ctrl_PPX;
    wire        [8:0]       Inst_Ctrl_PPM;
    wire        [8:0]       Inst_Ctrl_PPW;

//________________________________________________________________



// DataPath Instantiation
DataPath #(.WIDTH(WIDTH)) DataPath_Inst (
    .clk(clk),                          // Input Ports 
    .rst(rst),                          // Input Ports
    .Inst(Inst),                        // From IMEM {Input Ports}          
    .DMEM_Data(DMEM_Data),              // From DMEM {Input Ports}
    .ALUSel(ALUSel),                    // From CtrlLogic                  
    .ImmSel(ImmSel),                    // From CtrlLogic     
    .WBSel(WBSel),                      // From CtrlLogic     
    .RF_WrEn(RF_WrEn),                  // From CtrlLogic     
    .PCSel(PCSel),                      // From CtrlLogic 
    .ASel(ASel),                        // From CtrlLogic 
    .BSel(BSel),                        // From CtrlLogic     
    .BrUn(BrUn),                        // From CtrlLogic 
    .BrLT(BrLT),                        // To   CtrlLogic   
    .BrEQ(BrEQ),                        // To   CtrlLogic
    .BrEQ_PPM(BrEQ_PPM),                // To   CtrlLogic
    .Inst_Ctrl_PPX(Inst_Ctrl_PPX),      // To   CtrlLogic
    .Inst_Ctrl_PPM(Inst_Ctrl_PPM),      // To   CtrlLogic
    .Inst_Ctrl_PPW(Inst_Ctrl_PPW),      // To   CtrlLogic
    .PC_Out(PC_Out),                    // To   IMEM {Output Ports}    
    .DataB_PPM(DataB_PPM),              // To   DMEM {Output Ports}    
    .ALU_Out_PPM(ALU_Out_PPM)           // To   DMEM {Output Ports}    
);
//_____________________________________________________



// assign Inst_Ctrl_PPF = {Inst_PPF[30], Inst_PPF[14:12], Inst_PPF[6:2]};
// assign Inst_Ctrl_PPD = {Inst_PPD[30], Inst_PPD[14:12], Inst_PPD[6:2]};
// assign Inst_Ctrl_PPX = {Inst_PPX[30], Inst_PPX[14:12], Inst_PPX[6:2]};
// assign Inst_Ctrl_PPM = {Inst_PPM[30], Inst_PPM[14:12], Inst_PPM[6:2]};
// assign Inst_Ctrl_PPW = {Inst_PPW[30], Inst_PPW[14:12], Inst_PPW[6:2]};



// Control Logic Instantiation
ControlLogic ControlLogic_Inst (
    // .InstSel_PPF(Inst_Ctrl_PPF),        // From DataPath 
    .InstSel_PPX(Inst_Ctrl_PPX),        // From DataPath 
    .InstSel_PPM(Inst_Ctrl_PPM),        // From DataPath 
    .InstSel_PPW(Inst_Ctrl_PPW),        // From DataPath 
    .BrLT(BrLT),                        // From DataPath
    .BrEQ(BrEQ),                        // From DataPath
    .BrEQ_PPM(BrEQ_PPM),                // From DataPath
    .ALUSel(ALUSel),                    // To   DataPath
    .ImmSel(ImmSel),                    // To   DataPath
    .WBSel(WBSel),                      // To   DataPath
    .RF_WrEn(RF_WrEn),                  // To   DataPath
    .DMem_RW(DMem_RW),                  // To   DataPath
    .PCSel(PCSel),                      // To   DataPath
    .ASel(ASel),                        // To   DataPath
    .BSel(BSel),                        // To   DataPath
    .BrUn(BrUn)                         // To   DataPath
);
//_____________________________________________________

endmodule