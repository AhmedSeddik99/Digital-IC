module CORDIC_TB;

    parameter WIDTH = 16;
    parameter CLK_PERIOD = 20;
    parameter PI = 3.1416;
    parameter kn = 1.6467;

    bit                                     clk, rst_n;
    logic                                   normal_core_enable;
    logic                                   linear_core_enable;
    logic                                   hyperbolic_core_enable;
    logic       signed      [WIDTH-1:0]     x_in, y_in, z_in;
    logic       signed      [WIDTH-1:0]     x_out, y_out, z_out;
    logic                                   out_ready;    

CORDIC DUT(.*);    
    
always #(CLK_PERIOD/2) clk = ~clk;

initial begin
    #(CLK_PERIOD);
    rst_n = 1;

// Sin(60), Cos(60)
    x_in = 19898;       // 1/kn * hw_scale
    y_in = 0;
    z_in = 10923;      // ((pi/3)/pi) * hw_scale
    normal_core_enable = 1;

    $display("theta = %1.3f*pi", z_in*$pow(2, -15));

    @(negedge out_ready)
        $display("cos(%1.3f*pi) = %1.3f", z_in*$pow(2, -15), x_out*$pow(2, -15));
        $display("sin(%1.3f*pi) = %1.3f", z_in*$pow(2, -15), y_out*$pow(2, -15));

    normal_core_enable = 0;    
    #(2*CLK_PERIOD);

// Sin(-60), Cos(-60)
    x_in = 19898;       // 1/kn * hw_scale
    y_in = 0;
    z_in = -10923;      // ((-pi/3)/pi) * hw_scale
    normal_core_enable = 1;

    $display("theta = %1.3f*pi", z_in*$pow(2, -15));

    @(negedge out_ready)
        $display("cos(%1.3f*pi) = %1.3f", z_in*$pow(2, -15), x_out*$pow(2, -15));
        $display("sin(%1.3f*pi) = %1.3f", z_in*$pow(2, -15), y_out*$pow(2, -15));
    
    normal_core_enable = 0;    
    #(2*CLK_PERIOD);

// Sin(120), Cos(120)
    x_in = 19898;       // 1/kn * hw_scale
    y_in = 0;
    z_in = 10923;      // ((2*pi/3)/pi) * hw_scale
    normal_core_enable = 1;

    $display("theta = %1.3f*pi", z_in*$pow(2, -15));

    @(negedge out_ready)
        $display("cos(%1.3f*pi) = %1.3f", z_in*$pow(2, -15), x_out*$pow(2, -15));
        $display("sin(%1.3f*pi) = %1.3f", z_in*$pow(2, -15), y_out*$pow(2, -15));

    normal_core_enable = 0;    
    #(2*CLK_PERIOD);

// Sin(240), Cos(240)
    x_in = 19898;       // 1/kn * hw_scale
    y_in = 0;
    z_in = -10923;      // ((-2*pi/3)/pi) * hw_scale
    normal_core_enable = 1;

    $display("theta = %1.3f*pi", z_in*$pow(2, -15));

    @(negedge out_ready)
        $display("cos(%1.3f*pi) = %1.3f", z_in*$pow(2, -15), x_out*$pow(2, -15));
        $display("sin(%1.3f*pi) = %1.3f", z_in*$pow(2, -15), y_out*$pow(2, -15));
    
    normal_core_enable = 0;    
    #(2*CLK_PERIOD);


// // Polar(3, 4)
//     x_in = 233;         // ((3/kn) / (norm_scale * safety_scale)) * hw_scale
//     y_in = 311;         // ((4/kn) / (norm_scale * safety_scale)) * hw_scale
//     z_in = 0;      
//     normal_core_enable = 1;

//     $display("x = %0.2f", x_in*kn*$pow(2, 8)*$pow(2, -15));
//     $display("y = %0.2f", y_in*kn*$pow(2, 8)*$pow(2, -15));

//     @(negedge out_ready)
//         $display("mag = %0.2f", x_out*$pow(2, -15)*$pow(2, 8));
//         $display("theta = %0.4f", z_out*$pow(2, -15)*PI);
    
//     normal_core_enable = 0;
//     #(2*CLK_PERIOD);

// // Polar(-3, 4)
//     x_in = -233;         // ((-3/kn) / (norm_scale * safety_scale)) * hw_scale
//     y_in = 311;         // ((4/kn) / (norm_scale * safety_scale)) * hw_scale
//     z_in = 0;      
//     normal_core_enable = 1;

//     $display("x = %0.2f", x_in*kn*$pow(2, 8)*$pow(2, -15));
//     $display("y = %0.2f", y_in*kn*$pow(2, 8)*$pow(2, -15));

//     @(negedge out_ready)
//         $display("mag = %0.2f", x_out*$pow(2, -15)*$pow(2, 8));
//         $display("theta = %0.4f", z_out*$pow(2, -15)*PI);
    
//     normal_core_enable = 0;
//     #(2*CLK_PERIOD);
    
// // Polar(-3, -4)
//     x_in = -233;         // ((-3/kn) / (norm_scale * safety_scale)) * hw_scale
//     y_in = -311;         // ((-4/kn) / (norm_scale * safety_scale)) * hw_scale
//     z_in = 0;      
//     normal_core_enable = 1;

//     $display("x = %0.2f", x_in*kn*$pow(2, 8)*$pow(2, -15));
//     $display("y = %0.2f", y_in*kn*$pow(2, 8)*$pow(2, -15));

//     @(negedge out_ready)
//         $display("mag = %0.2f", x_out*$pow(2, -15)*$pow(2, 8));
//         $display("theta = %0.4f", z_out*$pow(2, -15)*PI);
    
//     normal_core_enable = 0;
//     #(2*CLK_PERIOD);

// // Polar(3, -4)
//     x_in = 233;         // ((3/kn) / (norm_scale * safety_scale)) * hw_scale
//     y_in = -311;         // ((-4/kn) / (norm_scale * safety_scale)) * hw_scale
//     z_in = 0;      
//     normal_core_enable = 1;

//     $display("x = %0.2f", x_in*kn*$pow(2, 8)*$pow(2, -15));
//     $display("y = %0.2f", y_in*kn*$pow(2, 8)*$pow(2, -15));

//     @(negedge out_ready)
//         $display("mag = %0.2f", x_out*$pow(2, -15)*$pow(2, 8));
//         $display("theta = %0.4f", z_out*$pow(2, -15)*PI);
    
//     normal_core_enable = 0;
//     #(2*CLK_PERIOD);

// // Polar(0, 1)
//     x_in = 0;         // ((0/kn) / (norm_scale * safety_scale)) * hw_scale
//     y_in = 78;         // ((1/kn) / (norm_scale * safety_scale)) * hw_scale
//     z_in = 0;      
//     normal_core_enable = 1;

//     $display("x = %0.2f", x_in*kn*$pow(2, 8)*$pow(2, -15));
//     $display("y = %0.2f", y_in*kn*$pow(2, 8)*$pow(2, -15));

//     @(negedge out_ready)
//         $display("mag = %0.2f", x_out*$pow(2, -15)*$pow(2, 8));
//         $display("theta = %0.4f", z_out*$pow(2, -15)*PI);
    
//     normal_core_enable = 0;
//     #(2*CLK_PERIOD);
    
// // Polar(1, 0)
//     x_in = 78;         // ((1/kn) / (norm_scale * safety_scale)) * hw_scale
//     y_in = 0;         // ((0/kn) / (norm_scale * safety_scale)) * hw_scale
//     z_in = 0;      
//     normal_core_enable = 1;

//     $display("x = %0.2f", x_in*kn*$pow(2, 8)*$pow(2, -15));
//     $display("y = %0.2f", y_in*kn*$pow(2, 8)*$pow(2, -15));

//     @(negedge out_ready)
//         $display("mag = %0.2f", x_out*$pow(2, -15)*$pow(2, 8));
//         $display("theta = %0.4f", z_out*$pow(2, -15)*PI);
    
//     normal_core_enable = 0;
//     #(2*CLK_PERIOD);
    
// // Polar(0, -1)
//     x_in = 0;         // ((0/kn) / (norm_scale * safety_scale)) * hw_scale
//     y_in = -78;         // ((-1/kn) / (norm_scale * safety_scale)) * hw_scale
//     z_in = 0;      
//     normal_core_enable = 1;

//     $display("x = %0.2f", x_in*kn*$pow(2, 8)*$pow(2, -15));
//     $display("y = %0.2f", y_in*kn*$pow(2, 8)*$pow(2, -15));

//     @(negedge out_ready)
//         $display("mag = %0.2f", x_out*$pow(2, -15)*$pow(2, 8));
//         $display("theta = %0.4f", z_out*$pow(2, -15)*PI);
    
//     normal_core_enable = 0;
//     #(2*CLK_PERIOD);

// // Polar(-1, 0)
//     x_in = -78;         // ((-1/kn) / (norm_scale * safety_scale)) * hw_scale
//     y_in = 0;         // ((0/kn) / (norm_scale * safety_scale)) * hw_scale
//     z_in = 0;      
//     normal_core_enable = 1;

//     $display("x = %0.2f", x_in*kn*$pow(2, 8)*$pow(2, -15));
//     $display("y = %0.2f", y_in*kn*$pow(2, 8)*$pow(2, -15));

//     @(negedge out_ready)
//         $display("mag = %0.2f", x_out*$pow(2, -15)*$pow(2, 8));
//         $display("theta = %0.4f", z_out*$pow(2, -15)*PI);
    
//     normal_core_enable = 0;
//     #(2*CLK_PERIOD);

    $stop;
end

endmodule