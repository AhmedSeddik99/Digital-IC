`timescale 1ps/1ps
module Risc_Top_TB;
    
    parameter clk_period = 1000;                    // 1 ns
    parameter WIDTH = 32;

    bit                         clk_tb, rst_tb;
    wire        [WIDTH-1:0]     Inst_tb;            // From IMEM   
    wire        [WIDTH-1:0]     DMEM_Data_tb;       // From DMEM
    wire        [WIDTH-1:0]     PC_Out_tb;          // To   IMEM
    wire                        DMem_RW_tb;         // To   DMEM
    wire        [WIDTH-1:0]     DataB_PPM_tb;       // To   DMEM
    wire        [WIDTH-1:0]     ALU_Out_PPM_tb;     // To   DMEM


            


IMEM #(.WIDTH(WIDTH)) IMEM_inst (
    .addr((PC_Out_tb[9:2])),            // 8 bits from (PC_Out/4) to read line by line from .txt
    .inst(Inst_tb)
);


Risc_Top #(.WIDTH(WIDTH)) DUT (
    .clk(clk_tb), 
    .rst(rst_tb),
    .Inst(Inst_tb),                     // From IMEM
    .DMEM_Data(DMEM_Data_tb),           // From DMEM
    .DMem_RW(DMem_RW_tb),               // To   DMEM
    .PC_Out(PC_Out_tb),                 // To   IMEM
    .DataB_PPM(DataB_PPM_tb),           // To   DMEM
    .ALU_Out_PPM(ALU_Out_PPM_tb)        // To   DMEM
);


DMEM #(.WIDTH(WIDTH)) DMEM_inst (
    .clk(clk_tb),
    .MemRW(DMem_RW_tb),                 // From Control Logic
    .addr(ALU_Out_PPM_tb[9:2]),         // 8 bits from ALU_Out
    .DataWr(DataB_PPM_tb),              // OP_B 
    .DataRd(DMEM_Data_tb)               // To WB Mux
);





always #(clk_period/2) clk_tb = !clk_tb;

bit                     end_code;

int a1;
int fibo_num;
int address;

initial begin
    $dumpfile("Risc.vcd");
    $dumpvars;
    
    #(clk_period)
    rst_tb = 1;


// Hazard Test
    while (1) begin
        if (Inst_tb == 'h73) begin  
            #(5*clk_period)
            $display("x1 = %0d & x2 = %0d", DUT.DataPath_Inst.RegFile_Inst.MEM[1], DUT.DataPath_Inst.RegFile_Inst.MEM[2]);            
            $display("x3 = x1 + x2 = %2d & Expected = 15" , DUT.DataPath_Inst.RegFile_Inst.MEM[3]);            
            $display("x4 = x3 - x1 = %2d & Expected = 10" , DUT.DataPath_Inst.RegFile_Inst.MEM[4]);            
            $display("x5 = x4 & x2 = %2d & Expected = 10" , DUT.DataPath_Inst.RegFile_Inst.MEM[5]);            
            $display("x6 = x1 | x5 = %2d & Expected = 15" , DUT.DataPath_Inst.RegFile_Inst.MEM[6]);                       
            $display("x28 (value stored in DMEM) = %0d & x29 (Address in DMEM) = %0d", DUT.DataPath_Inst.RegFile_Inst.MEM[28], DUT.DataPath_Inst.RegFile_Inst.MEM[29]);            
            $display("x12 (value loaded from DMEM) = %0d", DUT.DataPath_Inst.RegFile_Inst.MEM[12]);            
            $stop;
        end        
        #(clk_period);
    end
    

    #(5*clk_period);
    $stop;
end

endmodule