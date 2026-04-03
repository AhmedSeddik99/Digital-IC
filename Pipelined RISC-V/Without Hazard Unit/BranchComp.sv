module BranchComp #(parameter WIDTH = 32) (
    input       wire        [WIDTH-1:0]     OP_A, OP_B,
    input       wire                        BrUn,           // BrUn = 1 -> Unsigned, BrUn = 0 -> Signed
    output      reg                         BrLT, BrEQ
);


always @(*) begin   
    BrEQ = 1'b0; 
    BrLT = 1'b0; 

    if (OP_A == OP_B) begin
        BrEQ = 1'b1;                   
    end
    else if (BrUn && (OP_A < OP_B)) begin                             // UnSigned Comparison
        BrLT = 1'b1;    
    end 
    // else if (!BrUn && ($Signed(OP_A) < $Signed(OP_B))) begin          // Signed Comparison
    //     BrLT= 1'b1;
    // end
    else begin          // A > B
        BrEQ = 1'b0;
        BrLT = 1'b0;
    end
end

    
endmodule