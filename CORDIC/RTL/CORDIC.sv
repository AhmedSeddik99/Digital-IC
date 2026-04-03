module CORDIC #(
    parameter WIDTH = 16,
    parameter N_ITERS = 16
) (
    input       wire                                clk, rst_n,
    input       wire                                normal_core_enable,
    input       wire                                linear_core_enable,
    input       wire                                hyperbolic_core_enable,
    input       wire    signed      [WIDTH-1:0]     x_in, y_in, z_in,    
    output      wire    signed      [WIDTH-1:0]     x_out, y_out, z_out,
    output      wire                                out_ready
);
    

    wire     signed     [WIDTH-1:0]     atan2_lut   [0:N_ITERS-1];
    wire     signed     [WIDTH-1:0]     x_i         [0:N_ITERS-1];
    wire     signed     [WIDTH-1:0]     y_i         [0:N_ITERS-1];
    wire     signed     [WIDTH-1:0]     z_i         [0:N_ITERS-1];
    
    wire                [1:0]           quad;

    reg      signed     [WIDTH-1:0]     z_out_reg;

    reg                 [3:0]           iter_cnt;


assign quad = {x_in[WIDTH-1], y_in[WIDTH-1]};


// (atan(pow(2, -i)) / pi) * pow(2, 15)
assign atan2_lut[0]  = 16'h2000;
assign atan2_lut[1]  = 16'h12E4;
assign atan2_lut[2]  = 16'h09FB;
assign atan2_lut[3]  = 16'h0511;
assign atan2_lut[4]  = 16'h028B;
assign atan2_lut[5]  = 16'h0146;
assign atan2_lut[6]  = 16'h00A3;
assign atan2_lut[7]  = 16'h0051;
assign atan2_lut[8]  = 16'h0029;
assign atan2_lut[9]  = 16'h0014;
assign atan2_lut[10] = 16'h000A;
assign atan2_lut[11] = 16'h0005;
assign atan2_lut[12] = 16'h0003;
assign atan2_lut[13] = 16'h0001;
assign atan2_lut[14] = 16'h0001;
assign atan2_lut[15] = 16'h0000;


assign x_i[0] = (x_in[WIDTH-1])? -x_in : x_in;      // CORDIC works correctly in R.H plane only
// assign y_i[0] = (y_in[WIDTH-1])? -y_in : y_in;      // CORDIC works correctly in R.H plane only
assign y_i[0] = y_in;
assign z_i[0] = z_in;




genvar i;
generate
    for (i = 0; i < N_ITERS-1; i++) begin        
        normalCore normalCore_inst (
            .clk(clk), 
            .rst_n(rst_n),
            .enable(normal_core_enable),
            // .mode(mode),
            .x_in(x_i[i]), 
            .y_in(y_i[i]), 
            .z_in(z_i[i]),
            .atan2_value(atan2_lut[i]),
            .iter_num(i[3:0]),
            .x_out(x_i[i+1]), 
            .y_out(y_i[i+1]), 
            .z_out(z_i[i+1])
        );
    end
endgenerate

// delay till last iteration 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin        
        iter_cnt <= 4'b0;
    end 
    else if (normal_core_enable | linear_core_enable | hyperbolic_core_enable) begin
        iter_cnt <= iter_cnt + 1'b1;
    end    
end

assign out_ready = (iter_cnt == 4'd15)? 1'b1 : 1'b0;


always @(*) begin
    if (out_ready) begin
        case (quad)
            2'b00: z_out_reg = z_i[15];             // 1st quad
            2'b10: z_out_reg = 32768 - z_i[15];     // 2nd quad
            2'b11: z_out_reg = -(z_i[15] + 32768);  // 3rd quad
            2'b01: z_out_reg = z_i[15];             // 4th quad            
        endcase
    end
    else begin
        z_out_reg = {WIDTH{1'b0}};
    end
end


assign x_out = x_i[15];
assign y_out = y_i[15];
assign z_out = z_out_reg;

endmodule