module DataPath #(parameter WIDTH = 32) (
    input       wire                        clk, rst,
    input       wire        [WIDTH-1:0]     Inst,               // IMEM
    input       wire        [WIDTH-1:0]     DMEM_Data,          // DMEM
    input       wire        [3:0]           ALUSel,
    input       wire        [2:0]           ImmSel,
    input       wire        [1:0]           WBSel,
    input       wire                        RF_WrEn_W,
    input       wire        [1:0]           ASel_Hz, BSel_Hz,
    input       wire                        StallD, StallF,
    input       wire                        PCSel,
    // input       wire                        ASel, BSel,
    input       wire                        BrUn,

    output      wire                        BrLT, BrEQ, BrEQ_PPM,
    output      wire        [WIDTH-1:0]     PC_Out, DataB_PPM, ALU_Out_PPM,
    output      wire        [8:0]           Inst_Ctrl_PPX, Inst_Ctrl_PPM, Inst_Ctrl_PPW,
    output      wire        [4:0]           rs1_PPX, rs2_PPX, rd_PPM, rd_PPW,           
    output      wire        [4:0]           rs1_PPD, rs2_PPD, rd_PPX            
);
    
//// Internal Signals \\\\

// RegFile Pipelined Outputs
    wire        [WIDTH-1:0]      DataA;    
    wire        [WIDTH-1:0]      DataA_PPX;    

    wire        [WIDTH-1:0]      DataB;    
    wire        [WIDTH-1:0]      DataB_PPX;    
//---------------------------------------------------------


// ASel Mux Outputs
    wire        [WIDTH-1:0]      OP_A;    
//---------------------------------------------------------


// BSel Mux Outputs
    wire        [WIDTH-1:0]      OP_B;    
//---------------------------------------------------------

// ALU Outputs
    wire        [WIDTH-1:0]      ALU_Out;    
    wire        [WIDTH-1:0]      ALU_Out_PPW;    
//---------------------------------------------------------

// DMEM Pipelined Outputs
    wire        [WIDTH-1:0]      DMEM_Data_PPW;         
//---------------------------------------------------------

// WB_Out Mux Pipelined Outputs
    wire        [WIDTH-1:0]      WB_Out;         
//---------------------------------------------------------


// PC Mux Outputs
    wire        [WIDTH-1:0]      PC_In;    
//---------------------------------------------------------


// PC Pipelined Outputs
    wire        [WIDTH-1:0]      PC_Out_PPD;    
    wire        [WIDTH-1:0]      PC_Out_PPX;    
    wire        [WIDTH-1:0]      PC_Out_PPM;    
    wire        [WIDTH-1:0]      PC_Out_PPW;    
//------------------------------------------------------------------------------


// ImmGen Outputs
    wire        [WIDTH-1:0]     ImmOut;    
//----------------------------------------------------------------------------------


// Inst Pipelined
    wire        [WIDTH-1:0]     Inst_PPD;                   // Inst     -> Inst_PPX, AddrA, AddrB
    wire        [WIDTH-1:0]     Inst_PPX;                   // Inst_PPD -> Inst_PPM, Imm_Gen
    wire        [WIDTH-1:0]     Inst_PPM;                   // Inst_PPX -> Inst_PPW
    wire        [WIDTH-1:0]     Inst_PPW;                   // Inst_PPM -> AddrD
//__________________________________________________________________________________________




// Inst_Ctrl Pipelined
assign Inst_Ctrl_PPX = {Inst_PPX[30], Inst_PPX[14:12], Inst_PPX[6:2]};
assign Inst_Ctrl_PPM = {Inst_PPM[30], Inst_PPM[14:12], Inst_PPM[6:2]};
assign Inst_Ctrl_PPW = {Inst_PPW[30], Inst_PPW[14:12], Inst_PPW[6:2]};
//----------------------------------------------------------------------------------



// PC Mux Instantiation
mux2x1 #(.WIDTH(WIDTH)) PC_Mux (
    .in0((PC_Out+4)), 
    .in1(ALU_Out_PPM), 
    .sel(PCSel),
    .out(PC_In)
);
//-----------------------------------------------------------------------------------



// PC Instantiation
DFF_EN #(.WIDTH(WIDTH)) PC_Out_Pipelined_F (
    .clk(clk), 
    .rst(rst),
    .EN(!StallF),
    .din(PC_In),
    .qout(PC_Out)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) PC_Out_Pipelined_D (
    .clk(clk),
    .rst(rst),
    .din(PC_Out),
    .qout(PC_Out_PPD)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) PC_Out_Pipelined_X (
    .clk(clk),
    .rst(rst),
    .din(PC_Out_PPD),
    .qout(PC_Out_PPX)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) PC_Out_Pipelined_M (
    .clk(clk),
    .rst(rst),
    .din(PC_Out_PPX),
    .qout(PC_Out_PPM)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) PC_Out_Pipelined_W (
    .clk(clk),
    .rst(rst),
    .din(PC_Out_PPM),
    .qout(PC_Out_PPW)
);
//-----------------------------------------------------------------------------------



// ImmGen Instantiation
ImmGen #(.WIDTH(WIDTH)) ImmGen_Inst (
    .Inst(Inst_PPX),
    .ImmSel(ImmSel),
    .ImmOut(ImmOut)
);
//-----------------------------------------------------------------------------------



// IMEM Pipelining
DFF_EN #(.WIDTH(WIDTH)) Inst_Pipelined_D (
    .clk(clk),
    .rst(rst),
    .EN(!StallD),
    .din(Inst),
    .qout(Inst_PPD)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) Inst_Pipelined_X (
    .clk(clk),
    .rst(rst),
    .din(Inst_PPD),
    .qout(Inst_PPX)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) Inst_Pipelined_M (
    .clk(clk),
    .rst(rst),
    .din(Inst_PPX),
    .qout(Inst_PPM)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) Inst_Pipelined_W (
    .clk(clk),
    .rst(rst),
    .din(Inst_PPM),
    .qout(Inst_PPW)
);
//-----------------------------------------------------------------------------------



// RegFile Instantiation
RegFile #(.WIDTH(WIDTH), .ADDR(5), .DEPTH(32)) RegFile_Inst (
    .clk(clk),
    .WrEn(RF_WrEn_W),
    .AddrA(Inst_PPD[19:15]),
    .AddrB(Inst_PPD[24:20]),
    .AddrD(Inst_PPW[11:7]),
    .DataD(WB_Out),
    .DataA(DataA), 
    .DataB(DataB)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) DataA_Pipelined_X (
    .clk(clk),
    .rst(rst),
    .din(DataA),
    .qout(DataA_PPX)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) DataB_Pipelined_X (
    .clk(clk),
    .rst(rst),
    .din(DataB),
    .qout(DataB_PPX)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) DataB_Pipelined_M (
    .clk(clk),
    .rst(rst),
    .din(DataB_PPX),
    .qout(DataB_PPM)
);
//-----------------------------------------------------------------------------------



// BranchComp Instantiation
BranchComp #(.WIDTH(WIDTH)) BranchComp_Inst (
    .OP_A(DataA_PPX),  
    .OP_B(DataB_PPX),
    .BrUn(BrUn),       
    .BrLT(BrLT), 
    .BrEQ(BrEQ)
);

//______________________________________________
DFF #(.WIDTH(1)) BrRes_Pipelined_M (
    .clk(clk),
    .rst(rst),
    .din(BrEQ),
    .qout(BrEQ_PPM)
);
//-----------------------------------------------------------------------------------



// // ASel Mux Instantiation
// mux2x1 #(.WIDTH(WIDTH)) mux2x1_ASel (
//     .in0(DataA_PPX), 
//     .in1(PC_Out_PPX),
//     .sel(ASel),
//     .out(OP_A)
// );
// //-----------------------------------------------------------------------------------



// // BSel Mux Instantiation
// mux2x1 #(.WIDTH(WIDTH)) mux2x1_BSel (
//     .in0(DataB_PPX), 
//     .in1(ImmOut),
//     .sel(BSel),
//     .out(OP_B)
// );
// //-----------------------------------------------------------------------------------




// ASel Hazard Mux Instantiation
mux4x1 #(.WIDTH(WIDTH)) mux4x1_ASel_Hazard (
    .in0(DataA_PPX), 
    .in1(PC_Out_PPX),
    .in2(WB_Out),
    .in3(ALU_Out_PPM),
    .sel(ASel_Hz),
    .out(OP_A)
);
//-----------------------------------------------------------------------------------



// BSel Hazard Mux Instantiation
mux4x1 #(.WIDTH(WIDTH)) mux4x1_BSel_Hazard (
    .in0(DataB_PPX), 
    .in1(ImmOut),
    .in2(WB_Out),
    .in3(ALU_Out_PPM),
    .sel(BSel_Hz),
    .out(OP_B)
);
//-----------------------------------------------------------------------------------



// ALU Instantiation
ALU #(.WIDTH(WIDTH)) ALU_Inst (
    .OP_A(OP_A), 
    .OP_B(OP_B),
    .ALUSel(ALUSel),     
    .ALU_Out(ALU_Out)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) ALU_Pipelined_M (
    .clk(clk),
    .rst(rst),
    .din(ALU_Out),
    .qout(ALU_Out_PPM)
);

//______________________________________________________________
DFF #(.WIDTH(WIDTH)) ALU_Pipelined_W (
    .clk(clk),
    .rst(rst),
    .din(ALU_Out_PPM),
    .qout(ALU_Out_PPW)
);
//-----------------------------------------------------------------------------------



// DMEM Pipelined
DFF #(.WIDTH(WIDTH)) DMEM_Pipelined_W (
    .clk(clk),
    .rst(rst),
    .din(DMEM_Data),
    .qout(DMEM_Data_PPW)
);




// WB Mux Instantiation
// DFF #(.WIDTH(WIDTH)) WBMEM_Pipelined_W (
//     .clk(clk),
//     .rst(rst),
//     .din(DMEM_Data),
//     .qout(DMEM_Data_PPW)
// );

// //______________________________________________________________
// DFF #(.WIDTH(WIDTH)) WBALU_Pipelined_W (
//     .clk(clk),
//     .rst(rst),
//     .din(ALU_Out_PPM),
//     .qout(ALU_Out_PPW)
// );

// //______________________________________________________________
// DFF #(.WIDTH(WIDTH)) WBPC4_Pipelined_W (
//     .clk(clk),
//     .rst(rst),
//     .din(PC_Out_PPM),
//     .qout(PC_Out_PPW)
// );

// //______________________________________________________________
mux4x1 #(.WIDTH(WIDTH)) WB_Mux (
    .in0(DMEM_Data_PPW), 
    .in1(ALU_Out_PPW), 
    .in2((PC_Out_PPW + 4)), 
    .in3({WIDTH{1'bz}}), 
    .sel(WBSel),
    .out(WB_Out)
);
//-----------------------------------------------------------------------------------


assign rs1_PPX = Inst_PPX[19:15];
assign rs2_PPX = Inst_PPX[24:20];
assign rd_PPM  = Inst_PPM[11:7];
assign rd_PPW  = Inst_PPW[11:7]; 

assign rs1_PPD = Inst_PPD[19:15]; 
assign rs2_PPD = Inst_PPD[24:20]; 
assign rd_PPX  = Inst_PPX[11:7]; 





endmodule