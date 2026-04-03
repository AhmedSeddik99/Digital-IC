module Risc_Top #(parameter WIDTH = 32) (
    input       wire                        clk, rst,
    input       wire        [WIDTH-1:0]     Inst,               // IMEM
    input       wire        [WIDTH-1:0]     DMEM_Data,          // DMEM
    output      wire                        DMem_RW,            // DMEM
    output      wire        [WIDTH-1:0]     PC_Out, DataB_PPM, ALU_Out_PPM
);
    


//// Internal Signals \\\\

// DataPath Outputs
    // wire        [8:0]       Inst_Ctrl_PPF;
    wire        [8:0]           Inst_Ctrl_PPX;
    wire        [8:0]           Inst_Ctrl_PPM;
    wire        [8:0]           Inst_Ctrl_PPW;    
    wire                        BrLT, BrEQ, BrEQ_PPM;
    wire        [4:0]           rs1_PPX, rs2_PPX, rd_PPM, rd_PPW;       // Forward
    wire        [4:0]           rs1_PPD, rs2_PPD, rd_PPX;               // Stall
//--------------------------------------------


// Control Logic Outputs
    wire        [3:0]           ALUSel;
    wire        [2:0]           ImmSel;
    wire        [1:0]           WBSel;
    wire                        RF_WrEn_M, RF_WrEn_W;
    wire        [1:0]           ASel_Hz, BSel_Hz;
    // wire                        ASel, BSel;
    wire                        PCSel;
    wire                        BrUn;
//---------------------------------------------


// Hazard Unit Outputs    
    wire        [1:0]           FwA, FwB;    
    wire                        StallD, StallF;
//---------------------------------------------

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
    .RF_WrEn_W(RF_WrEn_W),              // From CtrlLogic     
    .PCSel(PCSel),                      // From CtrlLogic     
    .ASel_Hz(ASel_Hz),                  // From CtrlLogic 
    .BSel_Hz(BSel_Hz),                  // From CtrlLogic     
    .StallD(StallD),                    // From Hazard Unit
    .StallF(StallF),                    // From Hazard Unit     
    // .ASel(ASel),                        // From CtrlLogic 
    // .BSel(BSel),                        // From CtrlLogic     
    .BrUn(BrUn),                        // From CtrlLogic 
    .BrLT(BrLT),                        // To   CtrlLogic   
    .BrEQ(BrEQ),                        // To   CtrlLogic
    .BrEQ_PPM(BrEQ_PPM),                // To   CtrlLogic
    .Inst_Ctrl_PPX(Inst_Ctrl_PPX),      // To   CtrlLogic
    .Inst_Ctrl_PPM(Inst_Ctrl_PPM),      // To   CtrlLogic
    .Inst_Ctrl_PPW(Inst_Ctrl_PPW),      // To   CtrlLogic
    .rs1_PPX(rs1_PPX),                  // To   Hazard Unit
    .rs2_PPX(rs2_PPX),                  // To   Hazard Unit
    .rd_PPM(rd_PPM),                    // To   Hazard Unit
    .rd_PPW(rd_PPW),                    // To   Hazard Unit
    .rs1_PPD(rs1_PPD),                  // To   Hazard Unit
    .rs2_PPD(rs2_PPD),                  // To   Hazard Unit
    .rd_PPX(rd_PPX),                    // To   Hazard Unit
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
    .FwA(FwA),                          // From Hazard Unit
    .FwB(FwB),                          // From Hazard Unit
    .ALUSel(ALUSel),                    // To   DataPath
    .ImmSel(ImmSel),                    // To   DataPath
    .WBSel(WBSel),                      // To   DataPath
    .RF_WrEn_M(RF_WrEn_M),              // To   Hazard Unit
    .RF_WrEn_W(RF_WrEn_W),              // To   DataPath & Hazard Unit
    .DMem_RW(DMem_RW),                  // To   DataPath
    .PCSel(PCSel),                      // To   DataPath        
    .ASel_Hz(ASel_Hz),                  // To   DataPath
    .BSel_Hz(BSel_Hz),                  // To   DataPath
    // .ASel(ASel),                        // To   DataPath
    // .BSel(BSel),                        // To   DataPath
    .lwInst(lwInst),                    // To   DataPath
    .BrUn(BrUn)                         // To   DataPath
);
//_____________________________________________________


// Hazard Unit Instantiation
Hazard_Unit Hazard_Unit_Inst (
    .rs1_PPX(rs1_PPX),                  // From DataPath
    .rs2_PPX(rs2_PPX),                  // From DataPath
    .rd_PPM(rd_PPM),                    // From DataPath
    .rd_PPW(rd_PPW),                    // From DataPath
    .rs1_PPD(rs1_PPD),                  // From DataPath
    .rs2_PPD(rs2_PPD),                  // From DataPath
    .rd_PPX(rd_PPX),                    // From DataPath        
    .RF_WrEn_M(RF_WrEn_M),              // From CtrlLogic     
    .RF_WrEn_W(RF_WrEn_W),              // From CtrlLogic
    .lwInst(lwInst),                    // From CtrlLogic
    .FwA(FwA),                          // To   CtrlLogic
    .FwB(FwB),                          // To   CtrlLogic
    .StallD(StallD),                    // To   DataPath
    .StallF(StallF)                     // To   DataPath
);
//_____________________________________________________


endmodule