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

// Fibo Test
    while (1) begin
        if (Inst_tb == 'h007EA023) begin        // sw machine code
            #(4*clk_period)                     // 3 pipeline + sw
            address = DUT.DataPath_Inst.RegFile_Inst.MEM[29];
            fibo_num = DMEM_inst.DataMEM[address[9:2]];
            $display("Fibonacci number = %0d", fibo_num);
        end
        if (Inst_tb == 'h00000073) begin 
            #(3*clk_period)                                 
            a1 = DUT.DataPath_Inst.RegFile_Inst.MEM[11];         
            $display("Fibo of (%0d) = %0d", fibo_num, a1);
            $stop;                                        
        end            
        #(clk_period);
    end

    #(5*clk_period);
    $stop;
end

endmodule