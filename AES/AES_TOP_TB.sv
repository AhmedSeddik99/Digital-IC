`timescale 1ns / 1ns
module AES_TOP_TB;

    bit                         clk, rst;
    logic                       KeyValid;
    logic       [0:127]         InTxt;
    logic       [0:127]         ShiftRows_Out;
    logic       [0:127]         MixColumns_Out;
    logic       [0:255]         Key;
    logic       [3:0]           Nk;         
    logic       [3:0]           Nr;         
    wire        [0:127]         OutTxt;
    wire                        EncFinish;
    wire                        DecFinish;


    parameter clk_period = 20;

    
    reg     [0:127]     ExpecEnc4   [0:10];
    reg     [0:127]     ExpecDec4   [0:10];
    
    reg     [0:127]     ExpecEnc6   [0:12];
    reg     [0:127]     ExpecDec6   [0:12];
    
    reg     [0:127]     ExpecEnc8   [0:14];
    reg     [0:127]     ExpecDec8   [0:14];


AES_TOP DUT (.*);

always #(clk_period/2) clk = ~clk;    


// always @(posedge DUT.KeyReady) begin    
//     if (!EncFinish) begin
//         #(clk_period)    
//         CheckKey(ExpecEnc4[DUT.Round], DUT.Round);        
//     end
//     else if (!DecFinish) begin
//         #(clk_period)    
//         CheckKey(ExpecDec4[DUT.Round], DUT.Round);                
//     end
// end

initial begin
    $dumpfile("AES_ENC.vcd");
    $dumpvars;

    $readmemh("Enc_Nk4.txt", ExpecEnc4);
    $readmemh("Dec_Nk4.txt", ExpecDec4);
    
    $readmemh("Enc_Nk6.txt", ExpecEnc6);
    $readmemh("Dec_Nk6.txt", ExpecDec6);
    
    $readmemh("Enc_Nk8.txt", ExpecEnc8);
    $readmemh("Dec_Nk8.txt", ExpecDec8);

    Initialize();
    Reset();


// AES-128 Test
    InTxt = 'h00112233445566778899aabbccddeeff;
    Key[0:127] = 'h000102030405060708090a0b0c0d0e0f;
    Nk    = 'd4;
    Nr    = 'd10;
    KeyValid = 1'b1;
    #(clk_period)
    KeyValid = 1'b0;        

    $display("\n\n\tAES-128 Encryption");
    for (int i = 0; i <= Nr; i++) begin
        @(negedge DUT.KeyReady)
            CheckKey(ExpecEnc4[i], i);                        
    end


    $display("\n\n\tAES-128 Decryption");
    for (int i = 0; i <= Nr; i++) begin
        @(negedge DUT.KeyReady)
            CheckKey(ExpecDec4[i], i);                        
    end


    #(3*clk_period)


// AES-192 Test
    InTxt = 'h00112233445566778899aabbccddeeff;
    Key[0:191] = 'h000102030405060708090a0b0c0d0e0f1011121314151617;
    Nk    = 'd6;
    Nr    = 'd12;
    KeyValid = 1'b1;
    #(clk_period)
    KeyValid = 1'b0;        

    $display("\n\n\tAES-192 Encryption");
    for (int i = 0; i <= Nr; i++) begin
        @(negedge DUT.KeyReady)
            CheckKey(ExpecEnc6[i], i);                        
    end


    $display("\n\n\tAES-192 Decryption");
    for (int i = 0; i <= Nr; i++) begin
        @(negedge DUT.KeyReady)
            CheckKey(ExpecDec6[i], i);                        
    end
    
    
    #(3*clk_period)


// AES-256 Test
    InTxt = 'h00112233445566778899aabbccddeeff;
    Key = 'h000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f;
    Nk    = 'd8;
    Nr    = 'd14;
    KeyValid = 1'b1;
    #(clk_period)
    KeyValid = 1'b0;        

    $display("\n\n\tAES-256 Encryption");
    for (int i = 0; i <= Nr; i++) begin
        @(negedge DUT.KeyReady)
            CheckKey(ExpecEnc8[i], i);                        
    end


    $display("\n\n\tAES-256 Decryption");
    for (int i = 0; i <= Nr; i++) begin
        @(negedge DUT.KeyReady)
            CheckKey(ExpecDec8[i], i);                        
    end




   #(5*clk_period);
    $stop;
end





task Initialize();
    KeyValid = 1'b0;
    Key = 'b0;
    Nk = 'b0;           
    Nr = 'b0;           
    InTxt = 'b0;             
endtask 


task Reset();    
    #(clk_period);
    rst = 1'b1;    
    #(clk_period);
endtask




// task CheckKey;
//     input   reg     [0:127]     ExpecOut;    
//     input   reg     [3:0]       Round;

//     begin
//         @(negedge clk)
//         $timeformat(-9, 0, " ns");
//         if (DUT.AddRoundKey_Out == ExpecOut) begin
//             $display("Test Passed for Round: %2d at %0t",  Round, $realtime);
//         end
//         else begin
//             $display("Test Failed for Round: %2d, Actual = %x & Expec = %x at %0t",  Round, DUT.AddRoundKey_Out, ExpecOut, $realtime);
//         end
//     end
// endtask 



task CheckKey;
    input   reg     [0:127]     ExpecOut;    
    input   reg     [3:0]       Round;

    begin
        // #(clk_period)
        // @(negedge clk)
            $timeformat(-9, 0, " ns");
            if (DUT.AddRoundKey_Out == ExpecOut) begin
                $display("Test Passed for Round: %2d at %0t",  Round, $realtime);
            end
            else begin
                $display("Test Failed for Round: %2d, Actual = %x & Expec = %x at %0t",  Round, DUT.AddRoundKey_Out, ExpecOut, $realtime);
            end
    end
endtask


endmodule