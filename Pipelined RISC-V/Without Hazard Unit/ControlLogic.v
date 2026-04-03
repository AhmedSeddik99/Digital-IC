module ControlLogic (
    input       wire        [8:0]       InstSel_PPX, InstSel_PPM, InstSel_PPW,
    input       wire                    BrLT, BrEQ, BrEQ_PPM,
    output      wire        [3:0]       ALUSel,
    output      wire        [2:0]       ImmSel,
    output      wire        [1:0]       WBSel,
    output      wire                    RF_WrEn, DMem_RW,
    output      wire                    PCSel, ASel, BSel,
    output      wire                    BrUn
);



    // wire            BrEQ_PPM;

// // Control Logic in Fetch Stage
// ControlLogic_PPF ControlLogic_PPF_inst (    
//     .InstSel_PPF(InstSel_PPF),
//     .PCSel(PCSel)
// ); 


// // Control Logic in Decode Stage
// ControlLogic_PPD ControlLogic_PPD_inst (    
//     .InstSel_PPD(InstSel_PPD),
//     .ImmSel(ImmSel)
// ); 


// Control Logic in Execute Stage
ControlLogic_PPX ControlLogic_PPX_inst (
    .InstSel_PPX(InstSel_PPX),
    .BrLT(BrLT), 
    .BrEQ(BrEQ),
    .ALUSel(ALUSel),
    .ImmSel(ImmSel),
    .ASel(ASel), 
    .BSel(BSel),
    .BrUn(BrUn)
);


// Control Logic in Memory Stage
ControlLogic_PPM ControlLogic_PPM_inst (
    .InstSel_PPM(InstSel_PPM),
    .BrLT(BrLT), 
    .BrEQ_PPM(BrEQ_PPM),
    .PCSel(PCSel),
    .DMem_RW(DMem_RW)
);


// Control Logic in Write Back Stage
ControlLogic_PPW ControlLogic_PPW_inst (
    .InstSel_PPW(InstSel_PPW),
    .WBSel(WBSel),
    .RF_WrEn(RF_WrEn)
);

endmodule