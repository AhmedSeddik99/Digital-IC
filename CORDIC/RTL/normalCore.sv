module normalCore #(
    parameter WIDTH = 16        // S.15 inputs & outputs
    ) (
    input       wire                                clk, rst_n,
    input       wire                                enable,
    // input       wire                                mode,       // 0 -> Polar, 1 -> Sin/Cos
    input       wire    signed      [WIDTH-1:0]     x_in, y_in, z_in,
    input       wire    signed      [WIDTH-1:0]     atan2_value,
    input       wire                [3:0]           iter_num,
    output      wire    signed      [WIDTH-1:0]     x_out, y_out, z_out
);


    reg     signed      [WIDTH+1:0]         x_guard, y_guard, z_guard;      // 2-bits guard for internal computation
    reg     signed      [WIDTH+1:0]         x_extend, y_extend, z_extend;   // sign extended signals
    reg     signed      [WIDTH+1:0]         x_shift, y_shift;               // shifted signals

assign x_extend = {{2{x_in[WIDTH-1]}}, x_in};
assign y_extend = {{2{y_in[WIDTH-1]}}, y_in};
assign z_extend = {{2{z_in[WIDTH-1]}}, z_in};

assign x_shift = x_extend >>> iter_num;
assign y_shift = y_extend >>> iter_num;


always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        x_guard <= {WIDTH+2{1'b0}};
        y_guard <= {WIDTH+2{1'b0}};
        z_guard <= {WIDTH+2{1'b0}};
    end 
    // else if (enable /*&& !mode*/) begin     // Polar Form Mode
    //     if (y_in[WIDTH-1]) begin        // if y_in is -ve                       
    //         x_guard <= x_extend - y_shift;        
    //         y_guard <= y_extend + x_shift;
    //         z_guard <= {{2{z_in[WIDTH-1]}}, z_in} - {{2{atan2_value[WIDTH-1]}}, atan2_value};
    //     end 
    //     else begin                      // if y_in is +ve            
    //         x_guard <= x_extend + y_shift;
    //         y_guard <= y_extend - x_shift;
    //         z_guard <= {{2{z_in[WIDTH-1]}}, z_in} + {{2{atan2_value[WIDTH-1]}}, atan2_value};
    //     end        
    // end
    else if (enable /*&& mode*/) begin      // Sin/Cos Mode
        if (!z_in[WIDTH-1]) begin       // if z_in is +ve                       
            x_guard <= x_extend - y_shift;        
            y_guard <= y_extend + x_shift;
            z_guard <= {{2{z_in[WIDTH-1]}}, z_in} - {{2{atan2_value[WIDTH-1]}}, atan2_value};
        end 
        else begin                      // if z_in is -ve            
            x_guard <= x_extend + y_shift;
            y_guard <= y_extend - x_shift;
            z_guard <= {{2{z_in[WIDTH-1]}}, z_in} + {{2{atan2_value[WIDTH-1]}}, atan2_value};
        end        
    end    
end


assign x_out = x_guard[WIDTH-1:0];
assign y_out = y_guard[WIDTH-1:0];
assign z_out = z_guard[WIDTH-1:0];


endmodule