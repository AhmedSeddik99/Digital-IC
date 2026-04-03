module IMEM #(parameter WIDTH = 32) (
    input       [7:0]           addr,
    output      [WIDTH-1:0]     inst
);


    reg     [WIDTH-1:0]      InstMEM     [0:255];


initial begin    
    $readmemh("Hazard_Inst.out", InstMEM);    
end


assign inst = InstMEM[addr];
    

endmodule