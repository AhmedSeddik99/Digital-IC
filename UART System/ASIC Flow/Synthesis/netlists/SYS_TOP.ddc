/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Thu Sep 21 06:57:37 2023
/////////////////////////////////////////////////////////////


module RST_SYNC_0 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \counter[0] , n1;

  DFFRQX2M \counter_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\counter[0] )
         );
  DFFRQX2M SYNC_RST_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  OR2X2M U3 ( .A(SYNC_RST), .B(\counter[0] ), .Y(n1) );
endmodule


module RST_SYNC_2 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \counter[0] , n4;

  DFFRQX2M \counter_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\counter[0] )
         );
  DFFRQX2M SYNC_RST_reg ( .D(n4), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  OR2X2M U3 ( .A(SYNC_RST), .B(\counter[0] ), .Y(n4) );
endmodule


module RST_SYNC_1 ( CLK, RST, SYNC_RST );
  input CLK, RST;
  output SYNC_RST;
  wire   \counter[0] , n4;

  DFFRQX2M \counter_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\counter[0] )
         );
  DFFRQX2M SYNC_RST_reg ( .D(n4), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  OR2X2M U3 ( .A(SYNC_RST), .B(\counter[0] ), .Y(n4) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_0 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N2, div, half_div, N19, N20, N21, N22, N23, N24, N25, N27, N28, N29,
         N30, N31, N32, N33, n10, n11, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n1, n2, n3, n4, n5, n6, n7, n8, n9, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n39, n40,
         n41, n42, n43, n44, n45, n46, n47;
  wire   [6:0] counter;

  ClkDiv_0_DW01_inc_0 r73 ( .A(counter), .SUM({N25, N24, N23, N22, N21, N20, 
        N19}) );
  DFFRQX2M div_reg ( .D(n30), .CK(i_ref_clk), .RN(i_rst_n), .Q(div) );
  DFFRQX2M \counter_reg[6]  ( .D(n37), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[3]  ( .D(n34), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[5]  ( .D(n32), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(n33), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFX1M half_div_reg ( .D(n31), .CK(i_ref_clk), .Q(half_div), .QN(n21) );
  DFFRX1M \counter_reg[2]  ( .D(n35), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]), .QN(n10) );
  DFFRX1M \counter_reg[1]  ( .D(n36), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]), .QN(n11) );
  DFFRX1M \counter_reg[0]  ( .D(n38), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]), .QN(N27) );
  OA21X2M U3 ( .A0(n20), .A1(n19), .B0(N2), .Y(n7) );
  MX2X2M U4 ( .A(i_ref_clk), .B(div), .S0(N2), .Y(o_div_clk) );
  OR2X2M U5 ( .A(counter[1]), .B(counter[0]), .Y(n1) );
  INVX2M U6 ( .A(counter[4]), .Y(n6) );
  OAI2BB1X1M U7 ( .A0N(counter[0]), .A1N(counter[1]), .B0(n1), .Y(N28) );
  OR2X1M U8 ( .A(n1), .B(counter[2]), .Y(n2) );
  OAI2BB1X1M U9 ( .A0N(n1), .A1N(counter[2]), .B0(n2), .Y(N29) );
  NOR2X1M U10 ( .A(n2), .B(counter[3]), .Y(n3) );
  AO21XLM U11 ( .A0(n2), .A1(counter[3]), .B0(n3), .Y(N30) );
  CLKNAND2X2M U12 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U13 ( .A0(n3), .A1(n6), .B0(n4), .Y(N31) );
  XNOR2X1M U14 ( .A(counter[5]), .B(n4), .Y(N32) );
  NOR2X1M U15 ( .A(counter[5]), .B(n4), .Y(n5) );
  CLKXOR2X2M U16 ( .A(counter[6]), .B(n5), .Y(N33) );
  OAI21X1M U17 ( .A0(N27), .A1(n7), .B0(n8), .Y(n38) );
  AOI22X1M U18 ( .A0(N27), .A1(n9), .B0(N19), .B1(n12), .Y(n8) );
  OAI2B1X1M U19 ( .A1N(counter[6]), .A0(n7), .B0(n13), .Y(n37) );
  AOI22X1M U20 ( .A0(N33), .A1(n9), .B0(N25), .B1(n12), .Y(n13) );
  OAI21X1M U21 ( .A0(n11), .A1(n7), .B0(n14), .Y(n36) );
  AOI22X1M U22 ( .A0(N28), .A1(n9), .B0(N20), .B1(n12), .Y(n14) );
  OAI21X1M U23 ( .A0(n10), .A1(n7), .B0(n15), .Y(n35) );
  AOI22X1M U24 ( .A0(N29), .A1(n9), .B0(N21), .B1(n12), .Y(n15) );
  OAI2B1X1M U25 ( .A1N(counter[3]), .A0(n7), .B0(n16), .Y(n34) );
  AOI22X1M U26 ( .A0(N30), .A1(n9), .B0(N22), .B1(n12), .Y(n16) );
  OAI2B1X1M U27 ( .A1N(counter[4]), .A0(n7), .B0(n17), .Y(n33) );
  AOI22X1M U28 ( .A0(N31), .A1(n9), .B0(N23), .B1(n12), .Y(n17) );
  OAI2B1X1M U29 ( .A1N(counter[5]), .A0(n7), .B0(n18), .Y(n32) );
  AOI22X1M U30 ( .A0(N32), .A1(n9), .B0(N24), .B1(n12), .Y(n18) );
  AND2X1M U31 ( .A(n7), .B(n19), .Y(n12) );
  AND2X1M U32 ( .A(n20), .B(n7), .Y(n9) );
  AO21XLM U33 ( .A0(n21), .A1(n22), .B0(n23), .Y(n19) );
  AOI2BB1X1M U34 ( .A0N(n24), .A1N(half_div), .B0(n23), .Y(n20) );
  NOR2X1M U35 ( .A(i_div_ratio[0]), .B(n22), .Y(n24) );
  MXI2X1M U36 ( .A(n21), .B(n23), .S0(n25), .Y(n31) );
  AND2X1M U37 ( .A(i_rst_n), .B(n26), .Y(n25) );
  CLKXOR2X2M U38 ( .A(div), .B(n26), .Y(n30) );
  OA21X1M U39 ( .A0(n27), .A1(n23), .B0(N2), .Y(n26) );
  AND4X1M U40 ( .A(n11), .B(n10), .C(N27), .D(n28), .Y(n23) );
  NOR4X1M U41 ( .A(counter[6]), .B(counter[5]), .C(counter[4]), .D(counter[3]), 
        .Y(n28) );
  NOR2X1M U42 ( .A(half_div), .B(n22), .Y(n27) );
  NAND4X1M U43 ( .A(n29), .B(n39), .C(n40), .D(n41), .Y(n22) );
  NOR4X1M U44 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n41) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[7]), .B(counter[6]), .Y(n45) );
  XNOR2X1M U46 ( .A(i_div_ratio[3]), .B(n10), .Y(n44) );
  XNOR2X1M U47 ( .A(i_div_ratio[2]), .B(n11), .Y(n43) );
  XNOR2X1M U48 ( .A(i_div_ratio[1]), .B(N27), .Y(n42) );
  XNOR2X1M U49 ( .A(counter[4]), .B(i_div_ratio[5]), .Y(n40) );
  XNOR2X1M U50 ( .A(counter[3]), .B(i_div_ratio[4]), .Y(n39) );
  XNOR2X1M U51 ( .A(counter[5]), .B(i_div_ratio[6]), .Y(n29) );
  OA21X1M U52 ( .A0(n46), .A1(n47), .B0(i_clk_en), .Y(N2) );
  OR3X1M U53 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n47) );
  OR4X1M U54 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n46) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  INVX2M U3 ( .A(1'b1), .Y(OUT[4]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[7]) );
  OAI211X2M U11 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NAND2X2M U12 ( .A(n7), .B(n6), .Y(n9) );
  NAND4BX1M U13 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U14 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR4X1M U15 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  NOR4X1M U16 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U17 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  NOR3X2M U18 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  NOR3X2M U19 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  INVX2M U20 ( .A(IN[2]), .Y(n15) );
  INVX2M U21 ( .A(IN[1]), .Y(n16) );
  INVX2M U22 ( .A(IN[0]), .Y(n17) );
  INVX2M U23 ( .A(IN[5]), .Y(n14) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CLKXOR2X2M U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module ClkDiv_1 ( i_ref_clk, i_rst_n, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst_n, i_clk_en;
  output o_div_clk;
  wire   N2, div, half_div, N19, N20, N21, N22, N23, N24, N25, N27, N28, N29,
         N30, N31, N32, N33, n1, n2, n3, n4, n5, n6, n7, n8, n9, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58;
  wire   [6:0] counter;

  ClkDiv_1_DW01_inc_0 r73 ( .A(counter), .SUM({N25, N24, N23, N22, N21, N20, 
        N19}) );
  DFFRQX2M div_reg ( .D(n56), .CK(i_ref_clk), .RN(i_rst_n), .Q(div) );
  DFFRQX2M \counter_reg[6]  ( .D(n49), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[6]) );
  DFFRQX2M \counter_reg[3]  ( .D(n52), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[3]) );
  DFFRQX2M \counter_reg[5]  ( .D(n54), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[5]) );
  DFFRQX2M \counter_reg[4]  ( .D(n53), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[4]) );
  DFFX1M half_div_reg ( .D(n55), .CK(i_ref_clk), .Q(half_div), .QN(n21) );
  DFFRX1M \counter_reg[2]  ( .D(n51), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[2]), .QN(n58) );
  DFFRX1M \counter_reg[1]  ( .D(n50), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[1]), .QN(n57) );
  DFFRX1M \counter_reg[0]  ( .D(n48), .CK(i_ref_clk), .RN(i_rst_n), .Q(
        counter[0]), .QN(N27) );
  OA21X2M U3 ( .A0(n20), .A1(n19), .B0(N2), .Y(n7) );
  MX2X2M U4 ( .A(i_ref_clk), .B(div), .S0(N2), .Y(o_div_clk) );
  OR2X2M U5 ( .A(counter[1]), .B(counter[0]), .Y(n1) );
  INVX2M U6 ( .A(counter[4]), .Y(n6) );
  OAI2BB1X1M U7 ( .A0N(counter[0]), .A1N(counter[1]), .B0(n1), .Y(N28) );
  OR2X1M U8 ( .A(n1), .B(counter[2]), .Y(n2) );
  OAI2BB1X1M U9 ( .A0N(n1), .A1N(counter[2]), .B0(n2), .Y(N29) );
  NOR2X1M U10 ( .A(n2), .B(counter[3]), .Y(n3) );
  AO21XLM U11 ( .A0(n2), .A1(counter[3]), .B0(n3), .Y(N30) );
  CLKNAND2X2M U12 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U13 ( .A0(n3), .A1(n6), .B0(n4), .Y(N31) );
  XNOR2X1M U14 ( .A(counter[5]), .B(n4), .Y(N32) );
  NOR2X1M U15 ( .A(counter[5]), .B(n4), .Y(n5) );
  CLKXOR2X2M U16 ( .A(counter[6]), .B(n5), .Y(N33) );
  OAI21X1M U17 ( .A0(N27), .A1(n7), .B0(n8), .Y(n48) );
  AOI22X1M U18 ( .A0(N27), .A1(n9), .B0(N19), .B1(n12), .Y(n8) );
  OAI2B1X1M U19 ( .A1N(counter[6]), .A0(n7), .B0(n13), .Y(n49) );
  AOI22X1M U20 ( .A0(N33), .A1(n9), .B0(N25), .B1(n12), .Y(n13) );
  OAI21X1M U21 ( .A0(n57), .A1(n7), .B0(n14), .Y(n50) );
  AOI22X1M U22 ( .A0(N28), .A1(n9), .B0(N20), .B1(n12), .Y(n14) );
  OAI21X1M U23 ( .A0(n58), .A1(n7), .B0(n15), .Y(n51) );
  AOI22X1M U24 ( .A0(N29), .A1(n9), .B0(N21), .B1(n12), .Y(n15) );
  OAI2B1X1M U25 ( .A1N(counter[3]), .A0(n7), .B0(n16), .Y(n52) );
  AOI22X1M U26 ( .A0(N30), .A1(n9), .B0(N22), .B1(n12), .Y(n16) );
  OAI2B1X1M U27 ( .A1N(counter[4]), .A0(n7), .B0(n17), .Y(n53) );
  AOI22X1M U28 ( .A0(N31), .A1(n9), .B0(N23), .B1(n12), .Y(n17) );
  OAI2B1X1M U29 ( .A1N(counter[5]), .A0(n7), .B0(n18), .Y(n54) );
  AOI22X1M U30 ( .A0(N32), .A1(n9), .B0(N24), .B1(n12), .Y(n18) );
  AND2X1M U31 ( .A(n7), .B(n19), .Y(n12) );
  AND2X1M U32 ( .A(n20), .B(n7), .Y(n9) );
  AO21XLM U33 ( .A0(n21), .A1(n22), .B0(n23), .Y(n19) );
  AOI2BB1X1M U34 ( .A0N(n24), .A1N(half_div), .B0(n23), .Y(n20) );
  NOR2X1M U35 ( .A(i_div_ratio[0]), .B(n22), .Y(n24) );
  MXI2X1M U36 ( .A(n21), .B(n23), .S0(n25), .Y(n55) );
  AND2X1M U37 ( .A(i_rst_n), .B(n26), .Y(n25) );
  CLKXOR2X2M U38 ( .A(div), .B(n26), .Y(n56) );
  OA21X1M U39 ( .A0(n27), .A1(n23), .B0(N2), .Y(n26) );
  AND4X1M U40 ( .A(n57), .B(n58), .C(N27), .D(n28), .Y(n23) );
  NOR4X1M U41 ( .A(counter[6]), .B(counter[5]), .C(counter[4]), .D(counter[3]), 
        .Y(n28) );
  NOR2X1M U42 ( .A(half_div), .B(n22), .Y(n27) );
  NAND4X1M U43 ( .A(n29), .B(n39), .C(n40), .D(n41), .Y(n22) );
  NOR4X1M U44 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n41) );
  CLKXOR2X2M U45 ( .A(i_div_ratio[7]), .B(counter[6]), .Y(n45) );
  XNOR2X1M U46 ( .A(i_div_ratio[3]), .B(n58), .Y(n44) );
  XNOR2X1M U47 ( .A(i_div_ratio[2]), .B(n57), .Y(n43) );
  XNOR2X1M U48 ( .A(i_div_ratio[1]), .B(N27), .Y(n42) );
  XNOR2X1M U49 ( .A(counter[4]), .B(i_div_ratio[5]), .Y(n40) );
  XNOR2X1M U50 ( .A(counter[3]), .B(i_div_ratio[4]), .Y(n39) );
  XNOR2X1M U51 ( .A(counter[5]), .B(i_div_ratio[6]), .Y(n29) );
  OA21X1M U52 ( .A0(n46), .A1(n47), .B0(i_clk_en), .Y(N2) );
  OR3X1M U53 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n47) );
  OR4X1M U54 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n46) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module PULSE_GEN ( CLK, RST, LVL_SIG, PULSE_SIG );
  input CLK, RST, LVL_SIG;
  output PULSE_SIG;

  wire   [1:0] DFF;

  DFFRQX2M \DFF_reg[0]  ( .D(LVL_SIG), .CK(CLK), .RN(RST), .Q(DFF[0]) );
  DFFRQX2M \DFF_reg[1]  ( .D(DFF[0]), .CK(CLK), .RN(RST), .Q(DFF[1]) );
  NOR2BX2M U3 ( .AN(DFF[0]), .B(DFF[1]), .Y(PULSE_SIG) );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, unsync_bus, bus_enable, 
        sync_bus, enable_pulse_d );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse_d;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M enable_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        enable_flop) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M enable_pulse_d_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse_d) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U5 ( .A0(unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module INV ( SIG, NOT_SIG );
  input SIG;
  output NOT_SIG;


  INVX2M U1 ( .A(SIG), .Y(NOT_SIG) );
endmodule


module UART_FSM ( DATA_VALID, PAR_EN, ser_done, CLK, RST, ser_en, par_en, Busy, 
        mux_sel );
  output [2:0] mux_sel;
  input DATA_VALID, PAR_EN, ser_done, CLK, RST;
  output ser_en, par_en, Busy;
  wire   n4, n5, n6, n7, n2, n3, n8;
  wire   [2:0] CU;
  wire   [2:0] NXT;

  DFFRQX2M \CU_reg[1]  ( .D(NXT[1]), .CK(CLK), .RN(RST), .Q(CU[1]) );
  DFFRQX2M \CU_reg[0]  ( .D(NXT[0]), .CK(CLK), .RN(RST), .Q(CU[0]) );
  DFFRQX2M \CU_reg[2]  ( .D(NXT[2]), .CK(CLK), .RN(RST), .Q(CU[2]) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  OAI21X2M U4 ( .A0(CU[0]), .A1(n8), .B0(n3), .Y(mux_sel[1]) );
  NOR3BX2M U5 ( .AN(CU[2]), .B(CU[0]), .C(n8), .Y(mux_sel[2]) );
  NOR2X2M U6 ( .A(n8), .B(CU[2]), .Y(n4) );
  INVX2M U7 ( .A(CU[0]), .Y(n2) );
  INVX2M U8 ( .A(CU[1]), .Y(n8) );
  AOI21X2M U9 ( .A0(n6), .A1(n7), .B0(CU[2]), .Y(NXT[0]) );
  NAND2BX2M U10 ( .AN(ser_done), .B(CU[0]), .Y(n6) );
  OAI21X2M U11 ( .A0(CU[0]), .A1(DATA_VALID), .B0(n8), .Y(n7) );
  AO21XLM U12 ( .A0(n2), .A1(CU[1]), .B0(mux_sel[0]), .Y(Busy) );
  NOR3X2M U13 ( .A(n2), .B(CU[2]), .C(n4), .Y(par_en) );
  OAI21X2M U14 ( .A0(CU[2]), .A1(n2), .B0(n3), .Y(NXT[1]) );
  NOR2X2M U15 ( .A(n5), .B(n3), .Y(NXT[2]) );
  AOI2B1X1M U16 ( .A1N(PAR_EN), .A0(ser_done), .B0(n2), .Y(n5) );
  BUFX2M U17 ( .A(mux_sel[0]), .Y(ser_en) );
  NOR2X2M U18 ( .A(n2), .B(CU[2]), .Y(mux_sel[0]) );
endmodule


module Serializer ( P_DATA, CLK, RST, ser_en, ser_done, ser_data );
  input [7:0] P_DATA;
  input CLK, RST, ser_en;
  output ser_done, ser_data;
  wire   N1, N2, N3, DATA_ready, N11, n3, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n1, n2, n4, n5, n29, n30;
  wire   [7:0] ser_reg;

  DFFRQX2M \ser_reg_reg[5]  ( .D(n21), .CK(CLK), .RN(RST), .Q(ser_reg[5]) );
  DFFRQX2M \ser_reg_reg[1]  ( .D(n17), .CK(CLK), .RN(RST), .Q(ser_reg[1]) );
  DFFRQX2M \ser_reg_reg[7]  ( .D(n23), .CK(CLK), .RN(RST), .Q(ser_reg[7]) );
  DFFRQX2M \ser_reg_reg[3]  ( .D(n19), .CK(CLK), .RN(RST), .Q(ser_reg[3]) );
  DFFRQX2M \ser_reg_reg[6]  ( .D(n22), .CK(CLK), .RN(RST), .Q(ser_reg[6]) );
  DFFRQX2M \ser_reg_reg[2]  ( .D(n18), .CK(CLK), .RN(RST), .Q(ser_reg[2]) );
  DFFRQX2M \ser_reg_reg[4]  ( .D(n20), .CK(CLK), .RN(RST), .Q(ser_reg[4]) );
  DFFRQX2M \ser_reg_reg[0]  ( .D(n16), .CK(CLK), .RN(RST), .Q(ser_reg[0]) );
  DFFSQX2M DATA_ready_reg ( .D(n28), .CK(CLK), .SN(RST), .Q(DATA_ready) );
  DFFRQX2M \counter_reg[2]  ( .D(n24), .CK(CLK), .RN(RST), .Q(N3) );
  DFFRQX2M \counter_reg[1]  ( .D(n25), .CK(CLK), .RN(RST), .Q(N2) );
  DFFRQX2M \counter_reg[0]  ( .D(n26), .CK(CLK), .RN(RST), .Q(N1) );
  DFFRX1M \counter_reg[3]  ( .D(n27), .CK(CLK), .RN(RST), .QN(n3) );
  DFFRQX2M ser_data_reg ( .D(n4), .CK(CLK), .RN(RST), .Q(ser_data) );
  NOR2BX2M U3 ( .AN(DATA_ready), .B(n5), .Y(n10) );
  NOR2BX2M U4 ( .AN(n7), .B(n10), .Y(n9) );
  AOI21BX2M U5 ( .A0(n29), .A1(n5), .B0N(n13), .Y(n12) );
  NAND2X2M U6 ( .A(ser_done), .B(ser_en), .Y(n15) );
  INVX2M U7 ( .A(n8), .Y(n5) );
  NAND3X2M U8 ( .A(n7), .B(n15), .C(n14), .Y(n28) );
  OAI32X1M U9 ( .A0(n30), .A1(n11), .A2(n29), .B0(n12), .B1(n3), .Y(n27) );
  NAND3BX2M U10 ( .AN(DATA_ready), .B(n8), .C(n15), .Y(n7) );
  NAND2X2M U11 ( .A(ser_en), .B(n3), .Y(n8) );
  OA21X2M U12 ( .A0(N1), .A1(n8), .B0(n14), .Y(n13) );
  AO22X1M U13 ( .A0(ser_reg[0]), .A1(n9), .B0(P_DATA[0]), .B1(n10), .Y(n16) );
  AO22X1M U14 ( .A0(ser_reg[1]), .A1(n9), .B0(P_DATA[1]), .B1(n10), .Y(n17) );
  AO22X1M U15 ( .A0(ser_reg[2]), .A1(n9), .B0(P_DATA[2]), .B1(n10), .Y(n18) );
  AO22X1M U16 ( .A0(ser_reg[3]), .A1(n9), .B0(P_DATA[3]), .B1(n10), .Y(n19) );
  AO22X1M U17 ( .A0(ser_reg[4]), .A1(n9), .B0(P_DATA[4]), .B1(n10), .Y(n20) );
  AO22X1M U18 ( .A0(ser_reg[5]), .A1(n9), .B0(P_DATA[5]), .B1(n10), .Y(n21) );
  AO22X1M U19 ( .A0(ser_reg[6]), .A1(n9), .B0(P_DATA[6]), .B1(n10), .Y(n22) );
  AO22X1M U20 ( .A0(ser_reg[7]), .A1(n9), .B0(P_DATA[7]), .B1(n10), .Y(n23) );
  OAI32X1M U21 ( .A0(n29), .A1(N3), .A2(n11), .B0(n12), .B1(n30), .Y(n24) );
  NOR4X1M U22 ( .A(n3), .B(N1), .C(N2), .D(N3), .Y(ser_done) );
  OAI2B2X1M U23 ( .A1N(N1), .A0(n14), .B0(N1), .B1(n8), .Y(n26) );
  OAI22X1M U24 ( .A0(n13), .A1(n29), .B0(N2), .B1(n11), .Y(n25) );
  NAND2X2M U25 ( .A(N1), .B(n5), .Y(n11) );
  NAND2X2M U26 ( .A(DATA_ready), .B(n8), .Y(n14) );
  MX4X1M U27 ( .A(ser_reg[0]), .B(ser_reg[1]), .C(ser_reg[2]), .D(ser_reg[3]), 
        .S0(N1), .S1(N2), .Y(n2) );
  INVX2M U28 ( .A(n6), .Y(n4) );
  AOI32X1M U29 ( .A0(n7), .A1(n8), .A2(ser_data), .B0(N11), .B1(n5), .Y(n6) );
  MX2X2M U30 ( .A(n2), .B(n1), .S0(N3), .Y(N11) );
  MX4X1M U31 ( .A(ser_reg[4]), .B(ser_reg[5]), .C(ser_reg[6]), .D(ser_reg[7]), 
        .S0(N1), .S1(N2), .Y(n1) );
  INVX2M U32 ( .A(N2), .Y(n29) );
  INVX2M U33 ( .A(N3), .Y(n30) );
endmodule


module Parity_Calc ( P_DATA, CLK, RST, par_en, PAR_TYP, par_bit );
  input [7:0] P_DATA;
  input CLK, RST, par_en, PAR_TYP;
  output par_bit;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [7:0] par_reg;

  DFFRQX2M \par_reg_reg[5]  ( .D(n10), .CK(CLK), .RN(RST), .Q(par_reg[5]) );
  DFFRQX2M \par_reg_reg[1]  ( .D(n6), .CK(CLK), .RN(RST), .Q(par_reg[1]) );
  DFFRQX2M \par_reg_reg[4]  ( .D(n9), .CK(CLK), .RN(RST), .Q(par_reg[4]) );
  DFFRQX2M \par_reg_reg[0]  ( .D(n5), .CK(CLK), .RN(RST), .Q(par_reg[0]) );
  DFFRQX2M \par_reg_reg[6]  ( .D(n11), .CK(CLK), .RN(RST), .Q(par_reg[6]) );
  DFFRQX2M \par_reg_reg[2]  ( .D(n7), .CK(CLK), .RN(RST), .Q(par_reg[2]) );
  DFFRQX2M \par_reg_reg[7]  ( .D(n12), .CK(CLK), .RN(RST), .Q(par_reg[7]) );
  DFFRQX2M \par_reg_reg[3]  ( .D(n8), .CK(CLK), .RN(RST), .Q(par_reg[3]) );
  XOR3XLM U2 ( .A(n1), .B(n2), .C(PAR_TYP), .Y(par_bit) );
  XOR3XLM U3 ( .A(par_reg[5]), .B(par_reg[4]), .C(n4), .Y(n1) );
  XOR3XLM U4 ( .A(par_reg[1]), .B(par_reg[0]), .C(n3), .Y(n2) );
  CLKXOR2X2M U5 ( .A(par_reg[3]), .B(par_reg[2]), .Y(n3) );
  CLKXOR2X2M U6 ( .A(par_reg[7]), .B(par_reg[6]), .Y(n4) );
  AO2B2X2M U7 ( .B0(P_DATA[1]), .B1(par_en), .A0(par_reg[1]), .A1N(par_en), 
        .Y(n6) );
  AO2B2X2M U8 ( .B0(P_DATA[2]), .B1(par_en), .A0(par_reg[2]), .A1N(par_en), 
        .Y(n7) );
  AO2B2X2M U9 ( .B0(P_DATA[3]), .B1(par_en), .A0(par_reg[3]), .A1N(par_en), 
        .Y(n8) );
  AO2B2X2M U10 ( .B0(P_DATA[4]), .B1(par_en), .A0(par_reg[4]), .A1N(par_en), 
        .Y(n9) );
  AO2B2X2M U11 ( .B0(P_DATA[5]), .B1(par_en), .A0(par_reg[5]), .A1N(par_en), 
        .Y(n10) );
  AO2B2X2M U12 ( .B0(P_DATA[6]), .B1(par_en), .A0(par_reg[6]), .A1N(par_en), 
        .Y(n11) );
  AO2B2X2M U13 ( .B0(P_DATA[7]), .B1(par_en), .A0(par_reg[7]), .A1N(par_en), 
        .Y(n12) );
  AO2B2X2M U14 ( .B0(par_en), .B1(P_DATA[0]), .A0(par_reg[0]), .A1N(par_en), 
        .Y(n5) );
endmodule


module UART_MUX ( mux_sel, ser_data, par_bit, TX_OUT );
  input [2:0] mux_sel;
  input ser_data, par_bit;
  output TX_OUT;
  wire   n7, n4, n5, n2, n3, n6;

  CLKBUFX8M U3 ( .A(n7), .Y(TX_OUT) );
  OAI32X1M U4 ( .A0(mux_sel[0]), .A1(mux_sel[2]), .A2(mux_sel[1]), .B0(n4), 
        .B1(n3), .Y(n7) );
  INVX2M U5 ( .A(mux_sel[2]), .Y(n6) );
  INVX2M U6 ( .A(mux_sel[0]), .Y(n2) );
  INVX2M U7 ( .A(mux_sel[1]), .Y(n3) );
  AOI32X1M U8 ( .A0(mux_sel[0]), .A1(n6), .A2(ser_data), .B0(n5), .B1(n2), .Y(
        n4) );
  NAND2BX2M U9 ( .AN(par_bit), .B(n6), .Y(n5) );
endmodule


module UART_TX ( P_DATA, CLK, RST, PAR_EN, PAR_TYP, DATA_VALID, TX_OUT, Busy
 );
  input [7:0] P_DATA;
  input CLK, RST, PAR_EN, PAR_TYP, DATA_VALID;
  output TX_OUT, Busy;
  wire   ser_done, ser_en, par_en, ser_data, par_bit, n1, n2;
  wire   [2:0] mux_sel;

  UART_FSM UART_FSM_Instance ( .DATA_VALID(DATA_VALID), .PAR_EN(PAR_EN), 
        .ser_done(ser_done), .CLK(CLK), .RST(n1), .ser_en(ser_en), .par_en(
        par_en), .Busy(Busy), .mux_sel(mux_sel) );
  Serializer Serializer_Instance ( .P_DATA(P_DATA), .CLK(CLK), .RST(n1), 
        .ser_en(ser_en), .ser_done(ser_done), .ser_data(ser_data) );
  Parity_Calc Parity_Calc_Instance ( .P_DATA(P_DATA), .CLK(CLK), .RST(n1), 
        .par_en(par_en), .PAR_TYP(PAR_TYP), .par_bit(par_bit) );
  UART_MUX UART_MUX_Instance ( .mux_sel(mux_sel), .ser_data(ser_data), 
        .par_bit(par_bit), .TX_OUT(TX_OUT) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_RX_FSM ( CLK, RST, RX_IN, PAR_EN, strt_glitch, par_err, stp_err, 
        bit_cnt, edge_cnt, Prescale, edge_cnt_en, data_samp_en, deser_en, 
        strt_chk_en, par_chk_en, stp_chk_en, Data_Valid );
  input [3:0] bit_cnt;
  input [4:0] edge_cnt;
  input [5:0] Prescale;
  input CLK, RST, RX_IN, PAR_EN, strt_glitch, par_err, stp_err;
  output edge_cnt_en, data_samp_en, deser_en, strt_chk_en, par_chk_en,
         stp_chk_en, Data_Valid;
  wire   N53, N54, N55, N56, N57, N58, N59, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, \sub_84/carry[5] ,
         \sub_84/carry[4] , \sub_84/carry[3] , n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n27, n29, n30, n31;
  wire   [2:0] CU;
  wire   [2:0] NXT;
  assign N53 = Prescale[0];

  DFFRQX2M \CU_reg[0]  ( .D(NXT[0]), .CK(CLK), .RN(RST), .Q(CU[0]) );
  DFFRQX2M \CU_reg[2]  ( .D(NXT[2]), .CK(CLK), .RN(RST), .Q(CU[2]) );
  DFFRQX2M \CU_reg[1]  ( .D(NXT[1]), .CK(CLK), .RN(RST), .Q(CU[1]) );
  NOR4XLM U3 ( .A(stp_err), .B(par_err), .C(CU[1]), .D(n15), .Y(Data_Valid) );
  OAI21X2M U4 ( .A0(n30), .A1(n15), .B0(n16), .Y(NXT[2]) );
  AOI32X1M U5 ( .A0(n17), .A1(n31), .A2(deser_en), .B0(n18), .B1(n13), .Y(n16)
         );
  NOR2X2M U6 ( .A(n11), .B(n23), .Y(n17) );
  NOR2X2M U7 ( .A(n12), .B(n29), .Y(deser_en) );
  INVX2M U8 ( .A(n15), .Y(stp_chk_en) );
  AO2B2X2M U9 ( .B0(n22), .B1(n30), .A0(deser_en), .A1N(n17), .Y(NXT[0]) );
  OAI21X2M U10 ( .A0(RX_IN), .A1(n24), .B0(n25), .Y(n22) );
  AOI31X2M U11 ( .A0(n29), .A1(n27), .A2(n26), .B0(stp_chk_en), .Y(n24) );
  OAI31X1M U12 ( .A0(n23), .A1(bit_cnt[3]), .A2(n21), .B0(n14), .Y(n25) );
  NOR4BX1M U13 ( .AN(bit_cnt[1]), .B(n11), .C(bit_cnt[0]), .D(bit_cnt[2]), .Y(
        n18) );
  NAND2X2M U14 ( .A(CU[2]), .B(n29), .Y(n15) );
  NOR3X2M U15 ( .A(bit_cnt[1]), .B(bit_cnt[3]), .C(bit_cnt[2]), .Y(n26) );
  OAI2B11X2M U16 ( .A1N(n14), .A0(n10), .B0(n19), .C0(n12), .Y(NXT[1]) );
  INVX2M U17 ( .A(n21), .Y(n10) );
  NAND2X2M U18 ( .A(n13), .B(n20), .Y(n19) );
  OAI221X1M U19 ( .A0(n18), .A1(n31), .B0(PAR_EN), .B1(n17), .C0(N59), .Y(n20)
         );
  NOR2X2M U20 ( .A(n30), .B(CU[0]), .Y(n13) );
  NOR2X2M U21 ( .A(CU[0]), .B(n12), .Y(par_chk_en) );
  INVX2M U22 ( .A(CU[0]), .Y(n29) );
  OR3X2M U23 ( .A(bit_cnt[1]), .B(bit_cnt[2]), .C(n27), .Y(n23) );
  NOR2X2M U24 ( .A(n29), .B(CU[2]), .Y(n14) );
  OR2X2M U25 ( .A(CU[2]), .B(n30), .Y(n12) );
  INVX2M U26 ( .A(CU[1]), .Y(n30) );
  INVX2M U27 ( .A(bit_cnt[3]), .Y(n11) );
  INVX2M U28 ( .A(bit_cnt[0]), .Y(n27) );
  NOR3X2M U29 ( .A(strt_glitch), .B(bit_cnt[3]), .C(n23), .Y(n21) );
  NOR3X2M U30 ( .A(n29), .B(CU[2]), .C(CU[1]), .Y(strt_chk_en) );
  INVX2M U31 ( .A(Prescale[1]), .Y(N54) );
  INVX2M U32 ( .A(PAR_EN), .Y(n31) );
  BUFX2M U33 ( .A(edge_cnt_en), .Y(data_samp_en) );
  OR2X2M U34 ( .A(n13), .B(n14), .Y(edge_cnt_en) );
  XNOR2X1M U35 ( .A(Prescale[5]), .B(\sub_84/carry[5] ), .Y(N58) );
  OR2X1M U36 ( .A(Prescale[4]), .B(\sub_84/carry[4] ), .Y(\sub_84/carry[5] )
         );
  XNOR2X1M U37 ( .A(\sub_84/carry[4] ), .B(Prescale[4]), .Y(N57) );
  OR2X1M U38 ( .A(Prescale[3]), .B(\sub_84/carry[3] ), .Y(\sub_84/carry[4] )
         );
  XNOR2X1M U39 ( .A(\sub_84/carry[3] ), .B(Prescale[3]), .Y(N56) );
  OR2X1M U40 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\sub_84/carry[3] ) );
  XNOR2X1M U41 ( .A(Prescale[1]), .B(Prescale[2]), .Y(N55) );
  NOR2BX1M U42 ( .AN(N53), .B(edge_cnt[0]), .Y(n2) );
  OAI2B2X1M U43 ( .A1N(edge_cnt[1]), .A0(n2), .B0(N54), .B1(n2), .Y(n5) );
  NOR2BX1M U44 ( .AN(edge_cnt[0]), .B(N53), .Y(n3) );
  OAI2B2X1M U45 ( .A1N(N54), .A0(n3), .B0(edge_cnt[1]), .B1(n3), .Y(n4) );
  NAND3BX1M U46 ( .AN(N58), .B(n5), .C(n4), .Y(n9) );
  CLKXOR2X2M U47 ( .A(N57), .B(edge_cnt[4]), .Y(n8) );
  CLKXOR2X2M U48 ( .A(N55), .B(edge_cnt[2]), .Y(n7) );
  CLKXOR2X2M U49 ( .A(N56), .B(edge_cnt[3]), .Y(n6) );
  NOR4X1M U50 ( .A(n9), .B(n8), .C(n7), .D(n6), .Y(N59) );
endmodule


module edge_bit_counter ( CLK, RST, Prescale, edge_cnt_en, edge_cnt, bit_cnt
 );
  input [5:0] Prescale;
  output [4:0] edge_cnt;
  output [3:0] bit_cnt;
  input CLK, RST, edge_cnt_en;
  wire   N3, N4, N5, N6, N8, N9, N13, N25, N26, N27, N29, N30, N31, N32, N33,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         \add_42/carry[4] , \add_42/carry[3] , \add_42/carry[2] , n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38;

  DFFRQX2M \b_count_reg[2]  ( .D(n19), .CK(CLK), .RN(RST), .Q(bit_cnt[2]) );
  DFFRQX2M \b_count_reg[3]  ( .D(n22), .CK(CLK), .RN(RST), .Q(bit_cnt[3]) );
  DFFRQX2M \b_count_reg[1]  ( .D(n20), .CK(CLK), .RN(RST), .Q(bit_cnt[1]) );
  DFFRQX2M \b_count_reg[0]  ( .D(n21), .CK(CLK), .RN(RST), .Q(bit_cnt[0]) );
  DFFRQX2M \e_count_reg[4]  ( .D(N33), .CK(CLK), .RN(RST), .Q(edge_cnt[4]) );
  DFFRQX2M \e_count_reg[0]  ( .D(N29), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  DFFRQX2M \e_count_reg[1]  ( .D(N30), .CK(CLK), .RN(RST), .Q(edge_cnt[1]) );
  DFFRQX2M \e_count_reg[3]  ( .D(N32), .CK(CLK), .RN(RST), .Q(edge_cnt[3]) );
  DFFRQX2M \e_count_reg[2]  ( .D(N31), .CK(CLK), .RN(RST), .Q(edge_cnt[2]) );
  NAND3X2M U3 ( .A(edge_cnt_en), .B(n11), .C(N13), .Y(n13) );
  NAND2X2M U4 ( .A(edge_cnt_en), .B(N9), .Y(n11) );
  NOR2BX2M U5 ( .AN(N25), .B(n13), .Y(N30) );
  NOR2BX2M U6 ( .AN(N26), .B(n13), .Y(N31) );
  NOR2BX2M U7 ( .AN(N27), .B(n13), .Y(N32) );
  OAI32X1M U8 ( .A0(n10), .A1(bit_cnt[2]), .A2(n11), .B0(n12), .B1(n38), .Y(
        n19) );
  AOI32X1M U9 ( .A0(edge_cnt_en), .A1(n34), .A2(N13), .B0(n35), .B1(n10), .Y(
        n12) );
  INVX2M U10 ( .A(N9), .Y(n34) );
  INVX2M U11 ( .A(n11), .Y(n35) );
  OAI2B2X1M U12 ( .A1N(bit_cnt[0]), .A0(n13), .B0(bit_cnt[0]), .B1(n36), .Y(
        n21) );
  OAI2B2X1M U13 ( .A1N(bit_cnt[3]), .A0(n13), .B0(n16), .B1(n36), .Y(n22) );
  XNOR2X2M U14 ( .A(bit_cnt[3]), .B(n18), .Y(n16) );
  NOR2X2M U15 ( .A(n10), .B(n38), .Y(n18) );
  OAI22X1M U16 ( .A0(n37), .A1(n13), .B0(n14), .B1(n36), .Y(n20) );
  AOI21X2M U17 ( .A0(bit_cnt[0]), .A1(n37), .B0(n15), .Y(n14) );
  NOR2X2M U18 ( .A(n1), .B(n13), .Y(N33) );
  XNOR2X2M U19 ( .A(\add_42/carry[4] ), .B(edge_cnt[4]), .Y(n1) );
  NOR2X2M U20 ( .A(edge_cnt[0]), .B(n13), .Y(N29) );
  INVX2M U21 ( .A(n17), .Y(n36) );
  AOI31X2M U22 ( .A0(bit_cnt[3]), .A1(n38), .A2(n15), .B0(n11), .Y(n17) );
  INVX2M U23 ( .A(edge_cnt[2]), .Y(n32) );
  INVX2M U24 ( .A(edge_cnt[3]), .Y(n33) );
  NAND2X2M U25 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .Y(n10) );
  NOR2X2M U26 ( .A(n37), .B(bit_cnt[0]), .Y(n15) );
  INVX2M U27 ( .A(bit_cnt[1]), .Y(n37) );
  INVX2M U28 ( .A(bit_cnt[2]), .Y(n38) );
  ADDHX1M U29 ( .A(edge_cnt[2]), .B(\add_42/carry[2] ), .CO(\add_42/carry[3] ), 
        .S(N26) );
  ADDHX1M U30 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_42/carry[2] ), .S(
        N25) );
  ADDHX1M U31 ( .A(edge_cnt[3]), .B(\add_42/carry[3] ), .CO(\add_42/carry[4] ), 
        .S(N27) );
  OR2X2M U32 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n3) );
  CLKXOR2X2M U33 ( .A(Prescale[4]), .B(n5), .Y(n2) );
  INVX2M U34 ( .A(Prescale[3]), .Y(n7) );
  CLKINVX1M U35 ( .A(Prescale[0]), .Y(N3) );
  OAI2BB1X1M U36 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n3), .Y(N4) );
  NOR2X1M U37 ( .A(n3), .B(Prescale[2]), .Y(n4) );
  AO21XLM U38 ( .A0(n3), .A1(Prescale[2]), .B0(n4), .Y(N5) );
  CLKNAND2X2M U39 ( .A(n4), .B(n7), .Y(n5) );
  OAI21X1M U40 ( .A0(n4), .A1(n7), .B0(n5), .Y(N6) );
  NOR2X1M U41 ( .A(Prescale[4]), .B(n5), .Y(n6) );
  CLKXOR2X2M U42 ( .A(Prescale[5]), .B(n6), .Y(N8) );
  NOR2BX1M U43 ( .AN(edge_cnt[0]), .B(N3), .Y(n8) );
  OAI2B2X1M U44 ( .A1N(N4), .A0(n8), .B0(edge_cnt[1]), .B1(n8), .Y(n9) );
  OAI2BB1X1M U45 ( .A0N(n2), .A1N(edge_cnt[4]), .B0(n9), .Y(n31) );
  NOR2X1M U46 ( .A(n33), .B(N6), .Y(n30) );
  NAND2BX1M U47 ( .AN(edge_cnt[0]), .B(N3), .Y(n24) );
  NOR2X1M U48 ( .A(n32), .B(N5), .Y(n29) );
  AOI2BB1X1M U49 ( .A0N(n24), .A1N(edge_cnt[1]), .B0(N4), .Y(n23) );
  AOI211X1M U50 ( .A0(edge_cnt[1]), .A1(n24), .B0(n29), .C0(n23), .Y(n25) );
  AOI221XLM U51 ( .A0(N6), .A1(n33), .B0(N5), .B1(n32), .C0(n25), .Y(n26) );
  AOI211X1M U52 ( .A0(edge_cnt[4]), .A1(n2), .B0(n30), .C0(n26), .Y(n27) );
  NOR2X1M U53 ( .A(N8), .B(n27), .Y(n28) );
  OAI21X1M U54 ( .A0(edge_cnt[4]), .A1(n2), .B0(n28), .Y(N13) );
  NOR4X1M U55 ( .A(n31), .B(n30), .C(N13), .D(n29), .Y(N9) );
endmodule


module data_sampling ( RX_IN, CLK, RST, Prescale, data_samp_en, edge_cnt, 
        sampled_bit, bit_ready );
  input [5:0] Prescale;
  input [4:0] edge_cnt;
  input RX_IN, CLK, RST, data_samp_en;
  output sampled_bit, bit_ready;
  wire   N10, N11, N12, N13, N14, N20, N21, N22, N23, n7, n22, n23, n24, n25,
         n26, \add_43/carry[4] , \add_43/carry[3] , \add_43/carry[2] , n1, n2,
         n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45;
  wire   [2:0] check_bits;

  DFFRQX2M \check_bits_reg[2]  ( .D(n26), .CK(CLK), .RN(RST), .Q(check_bits[2]) );
  DFFRQX2M \check_bits_reg[1]  ( .D(n25), .CK(CLK), .RN(RST), .Q(check_bits[1]) );
  DFFRQX2M \check_bits_reg[0]  ( .D(n24), .CK(CLK), .RN(RST), .Q(check_bits[0]) );
  DFFQX2M bit_ready_reg ( .D(n22), .CK(CLK), .Q(bit_ready) );
  DFFRX1M sampled_bit_reg ( .D(n23), .CK(CLK), .RN(RST), .Q(sampled_bit), .QN(
        n7) );
  INVX2M U3 ( .A(RST), .Y(n1) );
  INVX2M U4 ( .A(Prescale[3]), .Y(n5) );
  ADDHX1M U5 ( .A(Prescale[3]), .B(\add_43/carry[2] ), .CO(\add_43/carry[3] ), 
        .S(N21) );
  ADDHX1M U6 ( .A(Prescale[2]), .B(Prescale[1]), .CO(\add_43/carry[2] ), .S(
        N20) );
  ADDHX1M U7 ( .A(Prescale[4]), .B(\add_43/carry[3] ), .CO(\add_43/carry[4] ), 
        .S(N22) );
  CLKINVX1M U8 ( .A(Prescale[1]), .Y(N10) );
  NOR2X1M U9 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n2) );
  AO21XLM U10 ( .A0(Prescale[1]), .A1(Prescale[2]), .B0(n2), .Y(N11) );
  CLKNAND2X2M U11 ( .A(n2), .B(n5), .Y(n3) );
  OAI21X1M U12 ( .A0(n2), .A1(n5), .B0(n3), .Y(N12) );
  XNOR2X1M U13 ( .A(Prescale[4]), .B(n3), .Y(N13) );
  NOR2X1M U14 ( .A(Prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U15 ( .A(Prescale[5]), .B(n4), .Y(N14) );
  CLKXOR2X2M U16 ( .A(\add_43/carry[4] ), .B(Prescale[5]), .Y(N23) );
  MXI2X1M U17 ( .A(n6), .B(n8), .S0(n9), .Y(n26) );
  NOR2X1M U18 ( .A(n10), .B(n11), .Y(n9) );
  MXI2X1M U19 ( .A(n12), .B(n8), .S0(n13), .Y(n25) );
  NOR3BX1M U20 ( .AN(n14), .B(n15), .C(n16), .Y(n13) );
  MXI2X1M U21 ( .A(n17), .B(n8), .S0(n18), .Y(n24) );
  NOR2X1M U22 ( .A(n16), .B(n14), .Y(n18) );
  CLKINVX1M U23 ( .A(RX_IN), .Y(n8) );
  MXI2X1M U24 ( .A(n19), .B(n7), .S0(n20), .Y(n23) );
  AOI21X1M U25 ( .A0(check_bits[0]), .A1(check_bits[1]), .B0(n21), .Y(n19) );
  AOI21X1M U26 ( .A0(n12), .A1(n17), .B0(n6), .Y(n21) );
  CLKINVX1M U27 ( .A(check_bits[2]), .Y(n6) );
  CLKINVX1M U28 ( .A(check_bits[0]), .Y(n17) );
  CLKINVX1M U29 ( .A(check_bits[1]), .Y(n12) );
  OAI31X1M U30 ( .A0(n1), .A1(n10), .A2(n11), .B0(n27), .Y(n22) );
  OAI21X1M U31 ( .A0(n20), .A1(n1), .B0(bit_ready), .Y(n27) );
  NOR2BX1M U32 ( .AN(n11), .B(n16), .Y(n20) );
  CLKINVX1M U33 ( .A(data_samp_en), .Y(n16) );
  CLKNAND2X2M U34 ( .A(n15), .B(n14), .Y(n11) );
  NAND4X1M U35 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(n14) );
  XNOR2X1M U36 ( .A(edge_cnt[0]), .B(N10), .Y(n31) );
  NOR2X1M U37 ( .A(n32), .B(n33), .Y(n30) );
  CLKXOR2X2M U38 ( .A(edge_cnt[2]), .B(N12), .Y(n33) );
  CLKXOR2X2M U39 ( .A(edge_cnt[1]), .B(N11), .Y(n32) );
  XNOR2X1M U40 ( .A(edge_cnt[3]), .B(N13), .Y(n29) );
  XNOR2X1M U41 ( .A(edge_cnt[4]), .B(N14), .Y(n28) );
  NAND4X1M U42 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n15) );
  XNOR2X1M U43 ( .A(edge_cnt[0]), .B(Prescale[1]), .Y(n37) );
  NOR2X1M U44 ( .A(n38), .B(n39), .Y(n36) );
  CLKXOR2X2M U45 ( .A(edge_cnt[2]), .B(Prescale[3]), .Y(n39) );
  CLKXOR2X2M U46 ( .A(edge_cnt[1]), .B(Prescale[2]), .Y(n38) );
  XNOR2X1M U47 ( .A(edge_cnt[3]), .B(Prescale[4]), .Y(n35) );
  XNOR2X1M U48 ( .A(edge_cnt[4]), .B(Prescale[5]), .Y(n34) );
  NAND4X1M U49 ( .A(n40), .B(data_samp_en), .C(n41), .D(n42), .Y(n10) );
  NOR3X1M U50 ( .A(n43), .B(n44), .C(n45), .Y(n42) );
  CLKXOR2X2M U51 ( .A(edge_cnt[2]), .B(N21), .Y(n45) );
  CLKXOR2X2M U52 ( .A(edge_cnt[4]), .B(N23), .Y(n44) );
  CLKXOR2X2M U53 ( .A(edge_cnt[3]), .B(N22), .Y(n43) );
  XNOR2X1M U54 ( .A(edge_cnt[0]), .B(N10), .Y(n41) );
  XNOR2X1M U55 ( .A(edge_cnt[1]), .B(N20), .Y(n40) );
endmodule


module deserializer ( CLK, RST, deser_en, bit_cnt, bit_ready, sampled_bit, 
        P_DATA );
  input [3:0] bit_cnt;
  output [7:0] P_DATA;
  input CLK, RST, deser_en, bit_ready, sampled_bit;
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n1, n2, n3, n4;
  wire   [2:0] index;

  DFFRQX2M \data_reg[1]  ( .D(n38), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M \data_reg[5]  ( .D(n34), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M \data_reg[0]  ( .D(n39), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M \data_reg[4]  ( .D(n35), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M \data_reg[3]  ( .D(n36), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M \data_reg[7]  ( .D(n32), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M \data_reg[2]  ( .D(n37), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  DFFRQX2M \data_reg[6]  ( .D(n33), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M \index_reg[0]  ( .D(n42), .CK(CLK), .RN(RST), .Q(index[0]) );
  DFFRQX2M \index_reg[2]  ( .D(n40), .CK(CLK), .RN(RST), .Q(index[2]) );
  DFFRQX2M \index_reg[1]  ( .D(n41), .CK(CLK), .RN(RST), .Q(index[1]) );
  OAI221X1M U3 ( .A0(n10), .A1(n17), .B0(n1), .B1(n4), .C0(n14), .Y(n40) );
  NAND2X2M U4 ( .A(n23), .B(n2), .Y(n13) );
  OAI21X2M U5 ( .A0(n23), .A1(n2), .B0(n13), .Y(n42) );
  INVX2M U6 ( .A(n10), .Y(n1) );
  NAND2X2M U7 ( .A(n4), .B(n3), .Y(n20) );
  NAND2X2M U8 ( .A(n23), .B(index[0]), .Y(n10) );
  NOR2X2M U9 ( .A(bit_cnt[1]), .B(bit_cnt[0]), .Y(n29) );
  XNOR2X2M U10 ( .A(index[1]), .B(n10), .Y(n41) );
  AND4X2M U11 ( .A(n24), .B(n25), .C(bit_ready), .D(n26), .Y(n23) );
  XNOR2X2M U12 ( .A(n2), .B(bit_cnt[0]), .Y(n24) );
  XNOR2X2M U13 ( .A(n3), .B(n31), .Y(n25) );
  AND3X2M U14 ( .A(n27), .B(deser_en), .C(n28), .Y(n26) );
  NAND2X2M U15 ( .A(sampled_bit), .B(n1), .Y(n8) );
  AOI21X2M U16 ( .A0(bit_cnt[1]), .A1(bit_cnt[0]), .B0(n29), .Y(n31) );
  XOR3XLM U17 ( .A(n4), .B(bit_cnt[2]), .C(n29), .Y(n28) );
  NAND2BX2M U18 ( .AN(n13), .B(sampled_bit), .Y(n11) );
  OAI21X2M U19 ( .A0(n8), .A1(n14), .B0(n15), .Y(n34) );
  OAI21X2M U20 ( .A0(n10), .A1(n14), .B0(P_DATA[5]), .Y(n15) );
  OAI21X2M U21 ( .A0(n8), .A1(n20), .B0(n21), .Y(n38) );
  OAI21X2M U22 ( .A0(n10), .A1(n20), .B0(P_DATA[1]), .Y(n21) );
  OAI21X2M U23 ( .A0(n8), .A1(n17), .B0(n18), .Y(n36) );
  OAI21X2M U24 ( .A0(n10), .A1(n17), .B0(P_DATA[3]), .Y(n18) );
  OAI21X2M U25 ( .A0(n7), .A1(n8), .B0(n9), .Y(n32) );
  OAI21X2M U26 ( .A0(n10), .A1(n7), .B0(P_DATA[7]), .Y(n9) );
  OAI21X2M U27 ( .A0(n11), .A1(n17), .B0(n19), .Y(n37) );
  OAI21X2M U28 ( .A0(n13), .A1(n17), .B0(P_DATA[2]), .Y(n19) );
  OAI21X2M U29 ( .A0(n11), .A1(n14), .B0(n16), .Y(n35) );
  OAI21X2M U30 ( .A0(n13), .A1(n14), .B0(P_DATA[4]), .Y(n16) );
  OAI21X2M U31 ( .A0(n7), .A1(n11), .B0(n12), .Y(n33) );
  OAI21X2M U32 ( .A0(n7), .A1(n13), .B0(P_DATA[6]), .Y(n12) );
  OAI21X2M U33 ( .A0(n11), .A1(n20), .B0(n22), .Y(n39) );
  OAI21X2M U34 ( .A0(n13), .A1(n20), .B0(P_DATA[0]), .Y(n22) );
  INVX2M U35 ( .A(index[1]), .Y(n3) );
  INVX2M U36 ( .A(index[2]), .Y(n4) );
  INVX2M U37 ( .A(index[0]), .Y(n2) );
  CLKXOR2X2M U38 ( .A(n30), .B(bit_cnt[3]), .Y(n27) );
  NAND2BX2M U39 ( .AN(bit_cnt[2]), .B(n29), .Y(n30) );
  NAND2X2M U40 ( .A(index[1]), .B(n4), .Y(n17) );
  NAND2X2M U41 ( .A(index[2]), .B(n3), .Y(n14) );
  NAND2X2M U42 ( .A(index[2]), .B(index[1]), .Y(n7) );
endmodule


module Start_Check ( strt_chk_en, sampled_bit, strt_glitch );
  input strt_chk_en, sampled_bit;
  output strt_glitch;


  AND2X2M U2 ( .A(strt_chk_en), .B(sampled_bit), .Y(strt_glitch) );
endmodule


module Parity_Check ( CLK, RST, P_DATA, PAR_TYP, par_chk_en, sampled_bit, 
        par_err );
  input [7:0] P_DATA;
  input CLK, RST, PAR_TYP, par_chk_en, sampled_bit;
  output par_err;
  wire   n1, n3, n4, n5, n6, n7, n8, n2;

  DFFRHQX8M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(par_err) );
  XNOR2X2M U2 ( .A(sampled_bit), .B(PAR_TYP), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U5 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U6 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
  OAI2BB2X1M U7 ( .B0(n1), .B1(n2), .A0N(par_err), .A1N(n2), .Y(n8) );
  INVX2M U8 ( .A(par_chk_en), .Y(n2) );
  XOR3XLM U9 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
endmodule


module Stop_Check ( CLK, RST, stp_chk_en, sampled_bit, stp_err );
  input CLK, RST, stp_chk_en, sampled_bit;
  output stp_err;
  wire   n2, n1;

  DFFRHQX8M stp_err_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_err) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  INVX2M U3 ( .A(stp_chk_en), .Y(n1) );
endmodule


module UART_RX ( RX_IN, CLK, RST, Prescale, PAR_EN, PAR_TYP, P_DATA, PAR_Err, 
        Frame_Err, Data_Valid );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input RX_IN, CLK, RST, PAR_EN, PAR_TYP;
  output PAR_Err, Frame_Err, Data_Valid;
  wire   strt_glitch, edge_cnt_en, data_samp_en, deser_en, strt_chk_en,
         par_chk_en, stp_chk_en, sampled_bit, bit_ready, n1, n2;
  wire   [4:0] edge_cnt;
  wire   [3:0] bit_cnt;

  UART_RX_FSM UART_RX_FSM_Instance ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), 
        .PAR_EN(PAR_EN), .strt_glitch(strt_glitch), .par_err(PAR_Err), 
        .stp_err(Frame_Err), .bit_cnt(bit_cnt), .edge_cnt(edge_cnt), 
        .Prescale(Prescale), .edge_cnt_en(edge_cnt_en), .data_samp_en(
        data_samp_en), .deser_en(deser_en), .strt_chk_en(strt_chk_en), 
        .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .Data_Valid(
        Data_Valid) );
  edge_bit_counter edge_bit_counter_Instance ( .CLK(CLK), .RST(n1), .Prescale(
        Prescale), .edge_cnt_en(edge_cnt_en), .edge_cnt(edge_cnt), .bit_cnt(
        bit_cnt) );
  data_sampling data_sampling_Instance ( .RX_IN(RX_IN), .CLK(CLK), .RST(n1), 
        .Prescale(Prescale), .data_samp_en(data_samp_en), .edge_cnt(edge_cnt), 
        .sampled_bit(sampled_bit), .bit_ready(bit_ready) );
  deserializer deserializer_Instance ( .CLK(CLK), .RST(n1), .deser_en(deser_en), .bit_cnt(bit_cnt), .bit_ready(bit_ready), .sampled_bit(sampled_bit), 
        .P_DATA(P_DATA) );
  Start_Check Start_Check_Instance ( .strt_chk_en(strt_chk_en), .sampled_bit(
        sampled_bit), .strt_glitch(strt_glitch) );
  Parity_Check Parity_Check_Instance ( .CLK(CLK), .RST(n1), .P_DATA(P_DATA), 
        .PAR_TYP(PAR_TYP), .par_chk_en(par_chk_en), .sampled_bit(sampled_bit), 
        .par_err(PAR_Err) );
  Stop_Check Stop_Check_Instance ( .CLK(CLK), .RST(n1), .stp_chk_en(stp_chk_en), .sampled_bit(sampled_bit), .stp_err(Frame_Err) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART ( RST, TX_CLK, RX_CLK, RX_IN, Prescale, PAR_EN, PAR_TYP, TX_P_DATA, 
        TX_DATA_VALID, RX_P_DATA, RX_DATA_VALID, PAR_Err, Frame_Err, TX_OUT, 
        Busy );
  input [5:0] Prescale;
  input [7:0] TX_P_DATA;
  output [7:0] RX_P_DATA;
  input RST, TX_CLK, RX_CLK, RX_IN, PAR_EN, PAR_TYP, TX_DATA_VALID;
  output RX_DATA_VALID, PAR_Err, Frame_Err, TX_OUT, Busy;
  wire   n1, n2;

  UART_TX U0_UART_TX ( .P_DATA(TX_P_DATA), .CLK(TX_CLK), .RST(n1), .PAR_EN(
        PAR_EN), .PAR_TYP(PAR_TYP), .DATA_VALID(TX_DATA_VALID), .TX_OUT(TX_OUT), .Busy(Busy) );
  UART_RX U0_UART_RX ( .RX_IN(RX_IN), .CLK(RX_CLK), .RST(n1), .Prescale(
        Prescale), .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .P_DATA(RX_P_DATA), 
        .PAR_Err(PAR_Err), .Frame_Err(Frame_Err), .Data_Valid(RX_DATA_VALID)
         );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module FIFO_MEM_PTR_WD4_DATA_WD8_FIFO_DP8 ( WR_DATA, W_CLK, W_RST, W_INC, FULL, 
        wr_addr, rd_addr, RD_DATA );
  input [7:0] WR_DATA;
  input [2:0] wr_addr;
  input [2:0] rd_addr;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, FULL;
  wire   N9, N10, N11, \MEM[7][7] , \MEM[7][6] , \MEM[7][5] , \MEM[7][4] ,
         \MEM[7][3] , \MEM[7][2] , \MEM[7][1] , \MEM[7][0] , \MEM[6][7] ,
         \MEM[6][6] , \MEM[6][5] , \MEM[6][4] , \MEM[6][3] , \MEM[6][2] ,
         \MEM[6][1] , \MEM[6][0] , \MEM[5][7] , \MEM[5][6] , \MEM[5][5] ,
         \MEM[5][4] , \MEM[5][3] , \MEM[5][2] , \MEM[5][1] , \MEM[5][0] ,
         \MEM[4][7] , \MEM[4][6] , \MEM[4][5] , \MEM[4][4] , \MEM[4][3] ,
         \MEM[4][2] , \MEM[4][1] , \MEM[4][0] , \MEM[3][7] , \MEM[3][6] ,
         \MEM[3][5] , \MEM[3][4] , \MEM[3][3] , \MEM[3][2] , \MEM[3][1] ,
         \MEM[3][0] , \MEM[2][7] , \MEM[2][6] , \MEM[2][5] , \MEM[2][4] ,
         \MEM[2][3] , \MEM[2][2] , \MEM[2][1] , \MEM[2][0] , \MEM[1][7] ,
         \MEM[1][6] , \MEM[1][5] , \MEM[1][4] , \MEM[1][3] , \MEM[1][2] ,
         \MEM[1][1] , \MEM[1][0] , \MEM[0][7] , \MEM[0][6] , \MEM[0][5] ,
         \MEM[0][4] , \MEM[0][3] , \MEM[0][2] , \MEM[0][1] , \MEM[0][0] , n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115;
  assign N9 = rd_addr[0];
  assign N10 = rd_addr[1];
  assign N11 = rd_addr[2];

  DFFRQX2M \MEM_reg[5][7]  ( .D(n69), .CK(W_CLK), .RN(n102), .Q(\MEM[5][7] )
         );
  DFFRQX2M \MEM_reg[5][6]  ( .D(n68), .CK(W_CLK), .RN(n102), .Q(\MEM[5][6] )
         );
  DFFRQX2M \MEM_reg[5][5]  ( .D(n67), .CK(W_CLK), .RN(n102), .Q(\MEM[5][5] )
         );
  DFFRQX2M \MEM_reg[5][4]  ( .D(n66), .CK(W_CLK), .RN(n102), .Q(\MEM[5][4] )
         );
  DFFRQX2M \MEM_reg[5][3]  ( .D(n65), .CK(W_CLK), .RN(n102), .Q(\MEM[5][3] )
         );
  DFFRQX2M \MEM_reg[5][2]  ( .D(n64), .CK(W_CLK), .RN(n102), .Q(\MEM[5][2] )
         );
  DFFRQX2M \MEM_reg[5][1]  ( .D(n63), .CK(W_CLK), .RN(n102), .Q(\MEM[5][1] )
         );
  DFFRQX2M \MEM_reg[5][0]  ( .D(n62), .CK(W_CLK), .RN(n102), .Q(\MEM[5][0] )
         );
  DFFRQX2M \MEM_reg[1][7]  ( .D(n37), .CK(W_CLK), .RN(n104), .Q(\MEM[1][7] )
         );
  DFFRQX2M \MEM_reg[1][6]  ( .D(n36), .CK(W_CLK), .RN(n104), .Q(\MEM[1][6] )
         );
  DFFRQX2M \MEM_reg[1][5]  ( .D(n35), .CK(W_CLK), .RN(n104), .Q(\MEM[1][5] )
         );
  DFFRQX2M \MEM_reg[1][4]  ( .D(n34), .CK(W_CLK), .RN(n104), .Q(\MEM[1][4] )
         );
  DFFRQX2M \MEM_reg[1][3]  ( .D(n33), .CK(W_CLK), .RN(n105), .Q(\MEM[1][3] )
         );
  DFFRQX2M \MEM_reg[1][2]  ( .D(n32), .CK(W_CLK), .RN(n105), .Q(\MEM[1][2] )
         );
  DFFRQX2M \MEM_reg[1][1]  ( .D(n31), .CK(W_CLK), .RN(n105), .Q(\MEM[1][1] )
         );
  DFFRQX2M \MEM_reg[1][0]  ( .D(n30), .CK(W_CLK), .RN(n105), .Q(\MEM[1][0] )
         );
  DFFRQX2M \MEM_reg[7][7]  ( .D(n85), .CK(W_CLK), .RN(n101), .Q(\MEM[7][7] )
         );
  DFFRQX2M \MEM_reg[7][6]  ( .D(n84), .CK(W_CLK), .RN(n101), .Q(\MEM[7][6] )
         );
  DFFRQX2M \MEM_reg[7][5]  ( .D(n83), .CK(W_CLK), .RN(n101), .Q(\MEM[7][5] )
         );
  DFFRQX2M \MEM_reg[7][4]  ( .D(n82), .CK(W_CLK), .RN(n101), .Q(\MEM[7][4] )
         );
  DFFRQX2M \MEM_reg[7][3]  ( .D(n81), .CK(W_CLK), .RN(n101), .Q(\MEM[7][3] )
         );
  DFFRQX2M \MEM_reg[7][2]  ( .D(n80), .CK(W_CLK), .RN(n101), .Q(\MEM[7][2] )
         );
  DFFRQX2M \MEM_reg[7][1]  ( .D(n79), .CK(W_CLK), .RN(n101), .Q(\MEM[7][1] )
         );
  DFFRQX2M \MEM_reg[7][0]  ( .D(n78), .CK(W_CLK), .RN(n101), .Q(\MEM[7][0] )
         );
  DFFRQX2M \MEM_reg[3][7]  ( .D(n53), .CK(W_CLK), .RN(n103), .Q(\MEM[3][7] )
         );
  DFFRQX2M \MEM_reg[3][6]  ( .D(n52), .CK(W_CLK), .RN(n103), .Q(\MEM[3][6] )
         );
  DFFRQX2M \MEM_reg[3][5]  ( .D(n51), .CK(W_CLK), .RN(n103), .Q(\MEM[3][5] )
         );
  DFFRQX2M \MEM_reg[3][4]  ( .D(n50), .CK(W_CLK), .RN(n103), .Q(\MEM[3][4] )
         );
  DFFRQX2M \MEM_reg[3][3]  ( .D(n49), .CK(W_CLK), .RN(n103), .Q(\MEM[3][3] )
         );
  DFFRQX2M \MEM_reg[3][2]  ( .D(n48), .CK(W_CLK), .RN(n103), .Q(\MEM[3][2] )
         );
  DFFRQX2M \MEM_reg[3][1]  ( .D(n47), .CK(W_CLK), .RN(n103), .Q(\MEM[3][1] )
         );
  DFFRQX2M \MEM_reg[3][0]  ( .D(n46), .CK(W_CLK), .RN(n104), .Q(\MEM[3][0] )
         );
  DFFRQX2M \MEM_reg[6][7]  ( .D(n77), .CK(W_CLK), .RN(n101), .Q(\MEM[6][7] )
         );
  DFFRQX2M \MEM_reg[6][6]  ( .D(n76), .CK(W_CLK), .RN(n101), .Q(\MEM[6][6] )
         );
  DFFRQX2M \MEM_reg[6][5]  ( .D(n75), .CK(W_CLK), .RN(n101), .Q(\MEM[6][5] )
         );
  DFFRQX2M \MEM_reg[6][4]  ( .D(n74), .CK(W_CLK), .RN(n101), .Q(\MEM[6][4] )
         );
  DFFRQX2M \MEM_reg[6][3]  ( .D(n73), .CK(W_CLK), .RN(n101), .Q(\MEM[6][3] )
         );
  DFFRQX2M \MEM_reg[6][2]  ( .D(n72), .CK(W_CLK), .RN(n102), .Q(\MEM[6][2] )
         );
  DFFRQX2M \MEM_reg[6][1]  ( .D(n71), .CK(W_CLK), .RN(n102), .Q(\MEM[6][1] )
         );
  DFFRQX2M \MEM_reg[6][0]  ( .D(n70), .CK(W_CLK), .RN(n102), .Q(\MEM[6][0] )
         );
  DFFRQX2M \MEM_reg[2][7]  ( .D(n45), .CK(W_CLK), .RN(n104), .Q(\MEM[2][7] )
         );
  DFFRQX2M \MEM_reg[2][6]  ( .D(n44), .CK(W_CLK), .RN(n104), .Q(\MEM[2][6] )
         );
  DFFRQX2M \MEM_reg[2][5]  ( .D(n43), .CK(W_CLK), .RN(n104), .Q(\MEM[2][5] )
         );
  DFFRQX2M \MEM_reg[2][4]  ( .D(n42), .CK(W_CLK), .RN(n104), .Q(\MEM[2][4] )
         );
  DFFRQX2M \MEM_reg[2][3]  ( .D(n41), .CK(W_CLK), .RN(n104), .Q(\MEM[2][3] )
         );
  DFFRQX2M \MEM_reg[2][2]  ( .D(n40), .CK(W_CLK), .RN(n104), .Q(\MEM[2][2] )
         );
  DFFRQX2M \MEM_reg[2][1]  ( .D(n39), .CK(W_CLK), .RN(n104), .Q(\MEM[2][1] )
         );
  DFFRQX2M \MEM_reg[2][0]  ( .D(n38), .CK(W_CLK), .RN(n104), .Q(\MEM[2][0] )
         );
  DFFRQX2M \MEM_reg[4][7]  ( .D(n61), .CK(W_CLK), .RN(n102), .Q(\MEM[4][7] )
         );
  DFFRQX2M \MEM_reg[4][6]  ( .D(n60), .CK(W_CLK), .RN(n102), .Q(\MEM[4][6] )
         );
  DFFRQX2M \MEM_reg[4][5]  ( .D(n59), .CK(W_CLK), .RN(n103), .Q(\MEM[4][5] )
         );
  DFFRQX2M \MEM_reg[4][4]  ( .D(n58), .CK(W_CLK), .RN(n103), .Q(\MEM[4][4] )
         );
  DFFRQX2M \MEM_reg[4][3]  ( .D(n57), .CK(W_CLK), .RN(n103), .Q(\MEM[4][3] )
         );
  DFFRQX2M \MEM_reg[4][2]  ( .D(n56), .CK(W_CLK), .RN(n103), .Q(\MEM[4][2] )
         );
  DFFRQX2M \MEM_reg[4][1]  ( .D(n55), .CK(W_CLK), .RN(n103), .Q(\MEM[4][1] )
         );
  DFFRQX2M \MEM_reg[4][0]  ( .D(n54), .CK(W_CLK), .RN(n103), .Q(\MEM[4][0] )
         );
  DFFRQX2M \MEM_reg[0][7]  ( .D(n29), .CK(W_CLK), .RN(n105), .Q(\MEM[0][7] )
         );
  DFFRQX2M \MEM_reg[0][6]  ( .D(n28), .CK(W_CLK), .RN(n105), .Q(\MEM[0][6] )
         );
  DFFRQX2M \MEM_reg[0][5]  ( .D(n27), .CK(W_CLK), .RN(n105), .Q(\MEM[0][5] )
         );
  DFFRQX2M \MEM_reg[0][4]  ( .D(n26), .CK(W_CLK), .RN(n105), .Q(\MEM[0][4] )
         );
  DFFRQX2M \MEM_reg[0][3]  ( .D(n25), .CK(W_CLK), .RN(n105), .Q(\MEM[0][3] )
         );
  DFFRQX2M \MEM_reg[0][2]  ( .D(n24), .CK(W_CLK), .RN(n105), .Q(\MEM[0][2] )
         );
  DFFRQX2M \MEM_reg[0][1]  ( .D(n23), .CK(W_CLK), .RN(n105), .Q(\MEM[0][1] )
         );
  DFFRQX2M \MEM_reg[0][0]  ( .D(n22), .CK(W_CLK), .RN(n105), .Q(\MEM[0][0] )
         );
  BUFX2M U2 ( .A(n19), .Y(n96) );
  BUFX2M U3 ( .A(n20), .Y(n95) );
  BUFX2M U4 ( .A(n21), .Y(n94) );
  BUFX2M U5 ( .A(n13), .Y(n98) );
  BUFX2M U6 ( .A(n15), .Y(n97) );
  BUFX2M U7 ( .A(n99), .Y(n103) );
  BUFX2M U8 ( .A(n99), .Y(n102) );
  BUFX2M U9 ( .A(n99), .Y(n101) );
  BUFX2M U10 ( .A(n100), .Y(n104) );
  BUFX2M U11 ( .A(n100), .Y(n105) );
  NOR2BX2M U12 ( .AN(W_INC), .B(FULL), .Y(n16) );
  BUFX2M U13 ( .A(W_RST), .Y(n99) );
  BUFX2M U14 ( .A(W_RST), .Y(n100) );
  NAND3X2M U15 ( .A(n106), .B(n115), .C(n18), .Y(n17) );
  NAND3X2M U16 ( .A(n106), .B(n115), .C(n12), .Y(n11) );
  NAND3X2M U17 ( .A(n12), .B(n106), .C(wr_addr[1]), .Y(n14) );
  NOR2BX2M U18 ( .AN(n16), .B(wr_addr[2]), .Y(n12) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n107), .A0N(\MEM[0][0] ), .A1N(n11), .Y(n22)
         );
  OAI2BB2X1M U20 ( .B0(n11), .B1(n108), .A0N(\MEM[0][1] ), .A1N(n11), .Y(n23)
         );
  OAI2BB2X1M U21 ( .B0(n11), .B1(n109), .A0N(\MEM[0][2] ), .A1N(n11), .Y(n24)
         );
  OAI2BB2X1M U22 ( .B0(n11), .B1(n110), .A0N(\MEM[0][3] ), .A1N(n11), .Y(n25)
         );
  OAI2BB2X1M U23 ( .B0(n11), .B1(n111), .A0N(\MEM[0][4] ), .A1N(n11), .Y(n26)
         );
  OAI2BB2X1M U24 ( .B0(n11), .B1(n112), .A0N(\MEM[0][5] ), .A1N(n11), .Y(n27)
         );
  OAI2BB2X1M U25 ( .B0(n11), .B1(n113), .A0N(\MEM[0][6] ), .A1N(n11), .Y(n28)
         );
  OAI2BB2X1M U26 ( .B0(n11), .B1(n114), .A0N(\MEM[0][7] ), .A1N(n11), .Y(n29)
         );
  OAI2BB2X1M U27 ( .B0(n107), .B1(n14), .A0N(\MEM[2][0] ), .A1N(n14), .Y(n38)
         );
  OAI2BB2X1M U28 ( .B0(n108), .B1(n14), .A0N(\MEM[2][1] ), .A1N(n14), .Y(n39)
         );
  OAI2BB2X1M U29 ( .B0(n109), .B1(n14), .A0N(\MEM[2][2] ), .A1N(n14), .Y(n40)
         );
  OAI2BB2X1M U30 ( .B0(n110), .B1(n14), .A0N(\MEM[2][3] ), .A1N(n14), .Y(n41)
         );
  OAI2BB2X1M U31 ( .B0(n111), .B1(n14), .A0N(\MEM[2][4] ), .A1N(n14), .Y(n42)
         );
  OAI2BB2X1M U32 ( .B0(n112), .B1(n14), .A0N(\MEM[2][5] ), .A1N(n14), .Y(n43)
         );
  OAI2BB2X1M U33 ( .B0(n113), .B1(n14), .A0N(\MEM[2][6] ), .A1N(n14), .Y(n44)
         );
  OAI2BB2X1M U34 ( .B0(n114), .B1(n14), .A0N(\MEM[2][7] ), .A1N(n14), .Y(n45)
         );
  OAI2BB2X1M U35 ( .B0(n107), .B1(n17), .A0N(\MEM[4][0] ), .A1N(n17), .Y(n54)
         );
  OAI2BB2X1M U36 ( .B0(n108), .B1(n17), .A0N(\MEM[4][1] ), .A1N(n17), .Y(n55)
         );
  OAI2BB2X1M U37 ( .B0(n109), .B1(n17), .A0N(\MEM[4][2] ), .A1N(n17), .Y(n56)
         );
  OAI2BB2X1M U38 ( .B0(n110), .B1(n17), .A0N(\MEM[4][3] ), .A1N(n17), .Y(n57)
         );
  OAI2BB2X1M U39 ( .B0(n111), .B1(n17), .A0N(\MEM[4][4] ), .A1N(n17), .Y(n58)
         );
  OAI2BB2X1M U40 ( .B0(n112), .B1(n17), .A0N(\MEM[4][5] ), .A1N(n17), .Y(n59)
         );
  OAI2BB2X1M U41 ( .B0(n113), .B1(n17), .A0N(\MEM[4][6] ), .A1N(n17), .Y(n60)
         );
  OAI2BB2X1M U42 ( .B0(n114), .B1(n17), .A0N(\MEM[4][7] ), .A1N(n17), .Y(n61)
         );
  OAI2BB2X1M U43 ( .B0(n107), .B1(n98), .A0N(\MEM[1][0] ), .A1N(n98), .Y(n30)
         );
  OAI2BB2X1M U44 ( .B0(n108), .B1(n98), .A0N(\MEM[1][1] ), .A1N(n98), .Y(n31)
         );
  OAI2BB2X1M U45 ( .B0(n109), .B1(n98), .A0N(\MEM[1][2] ), .A1N(n98), .Y(n32)
         );
  OAI2BB2X1M U46 ( .B0(n110), .B1(n98), .A0N(\MEM[1][3] ), .A1N(n98), .Y(n33)
         );
  OAI2BB2X1M U47 ( .B0(n111), .B1(n98), .A0N(\MEM[1][4] ), .A1N(n98), .Y(n34)
         );
  OAI2BB2X1M U48 ( .B0(n112), .B1(n98), .A0N(\MEM[1][5] ), .A1N(n98), .Y(n35)
         );
  OAI2BB2X1M U49 ( .B0(n113), .B1(n98), .A0N(\MEM[1][6] ), .A1N(n98), .Y(n36)
         );
  OAI2BB2X1M U50 ( .B0(n114), .B1(n98), .A0N(\MEM[1][7] ), .A1N(n98), .Y(n37)
         );
  OAI2BB2X1M U51 ( .B0(n107), .B1(n97), .A0N(\MEM[3][0] ), .A1N(n97), .Y(n46)
         );
  OAI2BB2X1M U52 ( .B0(n108), .B1(n97), .A0N(\MEM[3][1] ), .A1N(n97), .Y(n47)
         );
  OAI2BB2X1M U53 ( .B0(n109), .B1(n97), .A0N(\MEM[3][2] ), .A1N(n97), .Y(n48)
         );
  OAI2BB2X1M U54 ( .B0(n110), .B1(n97), .A0N(\MEM[3][3] ), .A1N(n97), .Y(n49)
         );
  OAI2BB2X1M U55 ( .B0(n111), .B1(n97), .A0N(\MEM[3][4] ), .A1N(n97), .Y(n50)
         );
  OAI2BB2X1M U56 ( .B0(n112), .B1(n97), .A0N(\MEM[3][5] ), .A1N(n97), .Y(n51)
         );
  OAI2BB2X1M U57 ( .B0(n113), .B1(n97), .A0N(\MEM[3][6] ), .A1N(n97), .Y(n52)
         );
  OAI2BB2X1M U58 ( .B0(n114), .B1(n97), .A0N(\MEM[3][7] ), .A1N(n97), .Y(n53)
         );
  OAI2BB2X1M U59 ( .B0(n107), .B1(n96), .A0N(\MEM[5][0] ), .A1N(n96), .Y(n62)
         );
  OAI2BB2X1M U60 ( .B0(n108), .B1(n96), .A0N(\MEM[5][1] ), .A1N(n96), .Y(n63)
         );
  OAI2BB2X1M U61 ( .B0(n109), .B1(n96), .A0N(\MEM[5][2] ), .A1N(n96), .Y(n64)
         );
  OAI2BB2X1M U62 ( .B0(n110), .B1(n96), .A0N(\MEM[5][3] ), .A1N(n96), .Y(n65)
         );
  OAI2BB2X1M U63 ( .B0(n111), .B1(n96), .A0N(\MEM[5][4] ), .A1N(n96), .Y(n66)
         );
  OAI2BB2X1M U64 ( .B0(n112), .B1(n96), .A0N(\MEM[5][5] ), .A1N(n96), .Y(n67)
         );
  OAI2BB2X1M U65 ( .B0(n113), .B1(n96), .A0N(\MEM[5][6] ), .A1N(n96), .Y(n68)
         );
  OAI2BB2X1M U66 ( .B0(n114), .B1(n96), .A0N(\MEM[5][7] ), .A1N(n96), .Y(n69)
         );
  OAI2BB2X1M U67 ( .B0(n107), .B1(n95), .A0N(\MEM[6][0] ), .A1N(n95), .Y(n70)
         );
  OAI2BB2X1M U68 ( .B0(n108), .B1(n95), .A0N(\MEM[6][1] ), .A1N(n95), .Y(n71)
         );
  OAI2BB2X1M U69 ( .B0(n109), .B1(n95), .A0N(\MEM[6][2] ), .A1N(n95), .Y(n72)
         );
  OAI2BB2X1M U70 ( .B0(n110), .B1(n95), .A0N(\MEM[6][3] ), .A1N(n95), .Y(n73)
         );
  OAI2BB2X1M U71 ( .B0(n111), .B1(n95), .A0N(\MEM[6][4] ), .A1N(n95), .Y(n74)
         );
  OAI2BB2X1M U72 ( .B0(n112), .B1(n95), .A0N(\MEM[6][5] ), .A1N(n95), .Y(n75)
         );
  OAI2BB2X1M U73 ( .B0(n113), .B1(n95), .A0N(\MEM[6][6] ), .A1N(n95), .Y(n76)
         );
  OAI2BB2X1M U74 ( .B0(n114), .B1(n95), .A0N(\MEM[6][7] ), .A1N(n95), .Y(n77)
         );
  OAI2BB2X1M U75 ( .B0(n107), .B1(n94), .A0N(\MEM[7][0] ), .A1N(n94), .Y(n78)
         );
  OAI2BB2X1M U76 ( .B0(n108), .B1(n94), .A0N(\MEM[7][1] ), .A1N(n94), .Y(n79)
         );
  OAI2BB2X1M U77 ( .B0(n109), .B1(n94), .A0N(\MEM[7][2] ), .A1N(n94), .Y(n80)
         );
  OAI2BB2X1M U78 ( .B0(n110), .B1(n94), .A0N(\MEM[7][3] ), .A1N(n94), .Y(n81)
         );
  OAI2BB2X1M U79 ( .B0(n111), .B1(n94), .A0N(\MEM[7][4] ), .A1N(n94), .Y(n82)
         );
  OAI2BB2X1M U80 ( .B0(n112), .B1(n94), .A0N(\MEM[7][5] ), .A1N(n94), .Y(n83)
         );
  OAI2BB2X1M U81 ( .B0(n113), .B1(n94), .A0N(\MEM[7][6] ), .A1N(n94), .Y(n84)
         );
  OAI2BB2X1M U82 ( .B0(n114), .B1(n94), .A0N(\MEM[7][7] ), .A1N(n94), .Y(n85)
         );
  AND2X2M U83 ( .A(wr_addr[2]), .B(n16), .Y(n18) );
  NAND3X2M U84 ( .A(n12), .B(n115), .C(wr_addr[0]), .Y(n13) );
  NAND3X2M U85 ( .A(wr_addr[0]), .B(n12), .C(wr_addr[1]), .Y(n15) );
  NAND3X2M U86 ( .A(wr_addr[1]), .B(wr_addr[0]), .C(n18), .Y(n21) );
  NAND3X2M U87 ( .A(wr_addr[0]), .B(n115), .C(n18), .Y(n19) );
  NAND3X2M U88 ( .A(wr_addr[1]), .B(n106), .C(n18), .Y(n20) );
  INVX2M U89 ( .A(WR_DATA[1]), .Y(n108) );
  INVX2M U90 ( .A(WR_DATA[2]), .Y(n109) );
  INVX2M U91 ( .A(WR_DATA[3]), .Y(n110) );
  INVX2M U92 ( .A(WR_DATA[4]), .Y(n111) );
  INVX2M U93 ( .A(WR_DATA[5]), .Y(n112) );
  INVX2M U94 ( .A(WR_DATA[6]), .Y(n113) );
  INVX2M U95 ( .A(WR_DATA[7]), .Y(n114) );
  INVX2M U96 ( .A(WR_DATA[0]), .Y(n107) );
  INVX2M U97 ( .A(wr_addr[0]), .Y(n106) );
  INVX2M U98 ( .A(wr_addr[1]), .Y(n115) );
  MX2X2M U99 ( .A(n4), .B(n3), .S0(N11), .Y(RD_DATA[1]) );
  MX4X1M U100 ( .A(\MEM[4][1] ), .B(\MEM[5][1] ), .C(\MEM[6][1] ), .D(
        \MEM[7][1] ), .S0(n92), .S1(N10), .Y(n3) );
  MX4X1M U101 ( .A(\MEM[0][1] ), .B(\MEM[1][1] ), .C(\MEM[2][1] ), .D(
        \MEM[3][1] ), .S0(n93), .S1(N10), .Y(n4) );
  MX2X2M U102 ( .A(n6), .B(n5), .S0(N11), .Y(RD_DATA[2]) );
  MX4X1M U103 ( .A(\MEM[4][2] ), .B(\MEM[5][2] ), .C(\MEM[6][2] ), .D(
        \MEM[7][2] ), .S0(n92), .S1(N10), .Y(n5) );
  MX4X1M U104 ( .A(\MEM[0][2] ), .B(\MEM[1][2] ), .C(\MEM[2][2] ), .D(
        \MEM[3][2] ), .S0(n93), .S1(N10), .Y(n6) );
  MX2X2M U105 ( .A(n8), .B(n7), .S0(N11), .Y(RD_DATA[3]) );
  MX4X1M U106 ( .A(\MEM[4][3] ), .B(\MEM[5][3] ), .C(\MEM[6][3] ), .D(
        \MEM[7][3] ), .S0(n92), .S1(N10), .Y(n7) );
  MX4X1M U107 ( .A(\MEM[0][3] ), .B(\MEM[1][3] ), .C(\MEM[2][3] ), .D(
        \MEM[3][3] ), .S0(n93), .S1(N10), .Y(n8) );
  MX2X2M U108 ( .A(n10), .B(n9), .S0(N11), .Y(RD_DATA[4]) );
  MX4X1M U109 ( .A(\MEM[4][4] ), .B(\MEM[5][4] ), .C(\MEM[6][4] ), .D(
        \MEM[7][4] ), .S0(n92), .S1(N10), .Y(n9) );
  MX4X1M U110 ( .A(\MEM[0][4] ), .B(\MEM[1][4] ), .C(\MEM[2][4] ), .D(
        \MEM[3][4] ), .S0(n93), .S1(N10), .Y(n10) );
  MX2X2M U111 ( .A(n87), .B(n86), .S0(N11), .Y(RD_DATA[5]) );
  MX4X1M U112 ( .A(\MEM[4][5] ), .B(\MEM[5][5] ), .C(\MEM[6][5] ), .D(
        \MEM[7][5] ), .S0(n92), .S1(N10), .Y(n86) );
  MX4X1M U113 ( .A(\MEM[0][5] ), .B(\MEM[1][5] ), .C(\MEM[2][5] ), .D(
        \MEM[3][5] ), .S0(n93), .S1(N10), .Y(n87) );
  MX2X2M U114 ( .A(n89), .B(n88), .S0(N11), .Y(RD_DATA[6]) );
  MX4X1M U115 ( .A(\MEM[4][6] ), .B(\MEM[5][6] ), .C(\MEM[6][6] ), .D(
        \MEM[7][6] ), .S0(n92), .S1(N10), .Y(n88) );
  MX4X1M U116 ( .A(\MEM[0][6] ), .B(\MEM[1][6] ), .C(\MEM[2][6] ), .D(
        \MEM[3][6] ), .S0(n93), .S1(N10), .Y(n89) );
  MX2X2M U117 ( .A(n91), .B(n90), .S0(N11), .Y(RD_DATA[7]) );
  MX4X1M U118 ( .A(\MEM[4][7] ), .B(\MEM[5][7] ), .C(\MEM[6][7] ), .D(
        \MEM[7][7] ), .S0(n92), .S1(N10), .Y(n90) );
  MX4X1M U119 ( .A(\MEM[0][7] ), .B(\MEM[1][7] ), .C(\MEM[2][7] ), .D(
        \MEM[3][7] ), .S0(n93), .S1(N10), .Y(n91) );
  MX2X2M U120 ( .A(n2), .B(n1), .S0(N11), .Y(RD_DATA[0]) );
  MX4X1M U121 ( .A(\MEM[4][0] ), .B(\MEM[5][0] ), .C(\MEM[6][0] ), .D(
        \MEM[7][0] ), .S0(n92), .S1(N10), .Y(n1) );
  MX4X1M U122 ( .A(\MEM[0][0] ), .B(\MEM[1][0] ), .C(\MEM[2][0] ), .D(
        \MEM[3][0] ), .S0(n93), .S1(N10), .Y(n2) );
  BUFX2M U123 ( .A(N9), .Y(n93) );
  BUFX2M U124 ( .A(N9), .Y(n92) );
endmodule


module DF_SYNC_PTR_WD4_0 ( CLK, RST, ASYNC_PTR, SYNC_PTR );
  input [3:0] ASYNC_PTR;
  output [3:0] SYNC_PTR;
  input CLK, RST;
  wire   \multi_flops[3][0] , \multi_flops[2][0] , \multi_flops[1][0] ,
         \multi_flops[0][0] ;

  EDFFHQX2M \SYNC_PTR_reg[2]  ( .D(\multi_flops[2][0] ), .E(RST), .CK(CLK), 
        .Q(SYNC_PTR[2]) );
  EDFFHQX2M \SYNC_PTR_reg[0]  ( .D(\multi_flops[0][0] ), .E(RST), .CK(CLK), 
        .Q(SYNC_PTR[0]) );
  EDFFHQX2M \SYNC_PTR_reg[1]  ( .D(\multi_flops[1][0] ), .E(RST), .CK(CLK), 
        .Q(SYNC_PTR[1]) );
  EDFFHQX2M \SYNC_PTR_reg[3]  ( .D(\multi_flops[3][0] ), .E(RST), .CK(CLK), 
        .Q(SYNC_PTR[3]) );
  DFFRQX2M \multi_flops_reg[2][0]  ( .D(ASYNC_PTR[2]), .CK(CLK), .RN(RST), .Q(
        \multi_flops[2][0] ) );
  DFFRQX2M \multi_flops_reg[1][0]  ( .D(ASYNC_PTR[1]), .CK(CLK), .RN(RST), .Q(
        \multi_flops[1][0] ) );
  DFFRQX2M \multi_flops_reg[0][0]  ( .D(ASYNC_PTR[0]), .CK(CLK), .RN(RST), .Q(
        \multi_flops[0][0] ) );
  DFFRQX2M \multi_flops_reg[3][0]  ( .D(ASYNC_PTR[3]), .CK(CLK), .RN(RST), .Q(
        \multi_flops[3][0] ) );
endmodule


module FIFO_WR_PTR_WD4 ( W_CLK, W_RST, W_INC, r2w_ptr, gray_wr_ptr, wr_addr, 
        FULL );
  input [3:0] r2w_ptr;
  output [3:0] gray_wr_ptr;
  output [2:0] wr_addr;
  input W_CLK, W_RST, W_INC;
  output FULL;
  wire   n12, n13, n14, n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n1, n2, n3, n4, n5, n6, n7, n8;

  DFFRQX2M \wr_ptr_reg[3]  ( .D(n25), .CK(W_CLK), .RN(W_RST), .Q(
        gray_wr_ptr[3]) );
  DFFRQX2M \wr_ptr_reg[2]  ( .D(n26), .CK(W_CLK), .RN(W_RST), .Q(wr_addr[2])
         );
  DFFRQX2M \wr_ptr_reg[1]  ( .D(n27), .CK(W_CLK), .RN(W_RST), .Q(wr_addr[1])
         );
  DFFRQX2M \wr_ptr_reg[0]  ( .D(n28), .CK(W_CLK), .RN(W_RST), .Q(wr_addr[0])
         );
  INVX2M U3 ( .A(n20), .Y(FULL) );
  OAI22X1M U4 ( .A0(n18), .A1(n19), .B0(n17), .B1(n3), .Y(n27) );
  NAND2X2M U5 ( .A(W_INC), .B(n20), .Y(n18) );
  OAI211X2M U6 ( .A0(n21), .A1(n22), .B0(n23), .C0(n24), .Y(n20) );
  XNOR2X2M U7 ( .A(n5), .B(r2w_ptr[3]), .Y(n21) );
  XNOR2X2M U8 ( .A(n6), .B(gray_wr_ptr[2]), .Y(n22) );
  XNOR2X2M U9 ( .A(gray_wr_ptr[1]), .B(r2w_ptr[1]), .Y(n23) );
  XNOR2X2M U10 ( .A(n4), .B(gray_wr_ptr[3]), .Y(gray_wr_ptr[2]) );
  XNOR2X2M U11 ( .A(r2w_ptr[0]), .B(gray_wr_ptr[0]), .Y(n24) );
  XNOR2X2M U12 ( .A(wr_addr[2]), .B(n3), .Y(gray_wr_ptr[1]) );
  OAI21X2M U13 ( .A0(wr_addr[0]), .A1(n3), .B0(n19), .Y(gray_wr_ptr[0]) );
  NAND2X2M U14 ( .A(wr_addr[0]), .B(n3), .Y(n19) );
  INVX2M U15 ( .A(wr_addr[1]), .Y(n3) );
  INVX2M U16 ( .A(wr_addr[2]), .Y(n4) );
  OAI21X2M U17 ( .A0(n12), .A1(n5), .B0(n13), .Y(n25) );
  AOI33X2M U18 ( .A0(n8), .A1(n7), .A2(n14), .B0(n15), .B1(n5), .B2(n12), .Y(
        n13) );
  AOI21X2M U19 ( .A0(r2w_ptr[3]), .A1(n6), .B0(n5), .Y(n14) );
  OAI211X2M U20 ( .A0(r2w_ptr[3]), .A1(n6), .B0(n8), .C0(n7), .Y(n15) );
  XNOR2X2M U21 ( .A(wr_addr[0]), .B(n18), .Y(n28) );
  NOR2X2M U22 ( .A(n18), .B(n2), .Y(n17) );
  INVX2M U23 ( .A(wr_addr[0]), .Y(n2) );
  AND4X2M U24 ( .A(W_INC), .B(wr_addr[2]), .C(wr_addr[1]), .D(wr_addr[0]), .Y(
        n12) );
  INVX2M U25 ( .A(gray_wr_ptr[3]), .Y(n5) );
  INVX2M U26 ( .A(r2w_ptr[2]), .Y(n6) );
  CLKXOR2X2M U27 ( .A(n4), .B(n1), .Y(n26) );
  NAND2X2M U28 ( .A(n17), .B(wr_addr[1]), .Y(n1) );
  INVX2M U29 ( .A(r2w_ptr[1]), .Y(n7) );
  INVX2M U30 ( .A(r2w_ptr[0]), .Y(n8) );
endmodule


module DF_SYNC_PTR_WD4_1 ( CLK, RST, ASYNC_PTR, SYNC_PTR );
  input [3:0] ASYNC_PTR;
  output [3:0] SYNC_PTR;
  input CLK, RST;
  wire   \multi_flops[3][0] , \multi_flops[2][0] , \multi_flops[1][0] ,
         \multi_flops[0][0] ;

  EDFFHQX2M \SYNC_PTR_reg[3]  ( .D(\multi_flops[3][0] ), .E(RST), .CK(CLK), 
        .Q(SYNC_PTR[3]) );
  EDFFHQX2M \SYNC_PTR_reg[1]  ( .D(\multi_flops[1][0] ), .E(RST), .CK(CLK), 
        .Q(SYNC_PTR[1]) );
  EDFFHQX2M \SYNC_PTR_reg[0]  ( .D(\multi_flops[0][0] ), .E(RST), .CK(CLK), 
        .Q(SYNC_PTR[0]) );
  EDFFHQX2M \SYNC_PTR_reg[2]  ( .D(\multi_flops[2][0] ), .E(RST), .CK(CLK), 
        .Q(SYNC_PTR[2]) );
  DFFRQX2M \multi_flops_reg[3][0]  ( .D(ASYNC_PTR[3]), .CK(CLK), .RN(RST), .Q(
        \multi_flops[3][0] ) );
  DFFRQX2M \multi_flops_reg[2][0]  ( .D(ASYNC_PTR[2]), .CK(CLK), .RN(RST), .Q(
        \multi_flops[2][0] ) );
  DFFRQX2M \multi_flops_reg[1][0]  ( .D(ASYNC_PTR[1]), .CK(CLK), .RN(RST), .Q(
        \multi_flops[1][0] ) );
  DFFRQX2M \multi_flops_reg[0][0]  ( .D(ASYNC_PTR[0]), .CK(CLK), .RN(RST), .Q(
        \multi_flops[0][0] ) );
endmodule


module FIFO_RD_PTR_WD4 ( R_CLK, R_RST, R_INC, w2r_ptr, gray_rd_ptr, rd_addr, 
        EMPTY );
  input [3:0] w2r_ptr;
  output [3:0] gray_rd_ptr;
  output [2:0] rd_addr;
  input R_CLK, R_RST, R_INC;
  output EMPTY;
  wire   n5, n6, n7, n8, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n1, n2, n3;

  DFFRQX2M \rd_ptr_reg[3]  ( .D(n18), .CK(R_CLK), .RN(R_RST), .Q(
        gray_rd_ptr[3]) );
  DFFRQX2M \rd_ptr_reg[0]  ( .D(n21), .CK(R_CLK), .RN(R_RST), .Q(rd_addr[0])
         );
  DFFRQX2M \rd_ptr_reg[2]  ( .D(n19), .CK(R_CLK), .RN(R_RST), .Q(rd_addr[2])
         );
  DFFRQX2M \rd_ptr_reg[1]  ( .D(n20), .CK(R_CLK), .RN(R_RST), .Q(rd_addr[1])
         );
  OAI22X1M U3 ( .A0(n11), .A1(n12), .B0(n10), .B1(n3), .Y(n20) );
  NAND2X2M U4 ( .A(R_INC), .B(n13), .Y(n11) );
  INVX2M U5 ( .A(n13), .Y(EMPTY) );
  XNOR2X2M U6 ( .A(gray_rd_ptr[1]), .B(w2r_ptr[1]), .Y(n14) );
  XNOR2X2M U7 ( .A(rd_addr[2]), .B(n3), .Y(gray_rd_ptr[1]) );
  OAI21X2M U8 ( .A0(rd_addr[0]), .A1(n3), .B0(n12), .Y(gray_rd_ptr[0]) );
  XNOR2X2M U9 ( .A(rd_addr[0]), .B(n11), .Y(n21) );
  NAND4X2M U10 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n13) );
  XNOR2X2M U11 ( .A(w2r_ptr[3]), .B(gray_rd_ptr[3]), .Y(n16) );
  XNOR2X2M U12 ( .A(gray_rd_ptr[2]), .B(w2r_ptr[2]), .Y(n17) );
  XNOR2X2M U13 ( .A(w2r_ptr[0]), .B(gray_rd_ptr[0]), .Y(n15) );
  NOR2BX2M U14 ( .AN(rd_addr[0]), .B(n11), .Y(n10) );
  INVX2M U15 ( .A(rd_addr[1]), .Y(n3) );
  NAND2X2M U16 ( .A(rd_addr[0]), .B(n3), .Y(n12) );
  CLKXOR2X2M U17 ( .A(rd_addr[2]), .B(gray_rd_ptr[3]), .Y(gray_rd_ptr[2]) );
  XNOR2X2M U18 ( .A(rd_addr[2]), .B(n1), .Y(n19) );
  NAND2X2M U19 ( .A(n10), .B(rd_addr[1]), .Y(n1) );
  NOR4X1M U20 ( .A(w2r_ptr[2]), .B(w2r_ptr[1]), .C(w2r_ptr[0]), .D(n2), .Y(n8)
         );
  OAI2BB2X1M U21 ( .B0(n5), .B1(n6), .A0N(n6), .A1N(gray_rd_ptr[3]), .Y(n18)
         );
  NAND4X2M U22 ( .A(rd_addr[2]), .B(rd_addr[1]), .C(rd_addr[0]), .D(R_INC), 
        .Y(n6) );
  AOI2B1X1M U23 ( .A1N(gray_rd_ptr[3]), .A0(n7), .B0(n8), .Y(n5) );
  NAND4BBX1M U24 ( .AN(w2r_ptr[1]), .BN(w2r_ptr[0]), .C(w2r_ptr[2]), .D(n2), 
        .Y(n7) );
  INVX2M U25 ( .A(w2r_ptr[3]), .Y(n2) );
endmodule


module ASYNC_FIFO ( WR_DATA, W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, RD_DATA, 
        FULL, EMPTY );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   n1, n2;
  wire   [2:0] wr_addr;
  wire   [2:0] rd_addr;
  wire   [3:0] gray_rd_ptr;
  wire   [3:0] r2w_ptr;
  wire   [3:0] gray_wr_ptr;
  wire   [3:0] w2r_ptr;

  FIFO_MEM_PTR_WD4_DATA_WD8_FIFO_DP8 U0_FIFO_MEM ( .WR_DATA(WR_DATA), .W_CLK(
        W_CLK), .W_RST(n1), .W_INC(W_INC), .FULL(FULL), .wr_addr(wr_addr), 
        .rd_addr(rd_addr), .RD_DATA(RD_DATA) );
  DF_SYNC_PTR_WD4_0 RD_WR_DF_SYNC ( .CLK(W_CLK), .RST(n1), .ASYNC_PTR(
        gray_rd_ptr), .SYNC_PTR(r2w_ptr) );
  FIFO_WR_PTR_WD4 U0_FIFO_WR ( .W_CLK(W_CLK), .W_RST(n1), .W_INC(W_INC), 
        .r2w_ptr(r2w_ptr), .gray_wr_ptr(gray_wr_ptr), .wr_addr(wr_addr), 
        .FULL(FULL) );
  DF_SYNC_PTR_WD4_1 WR_RD_DF_SYNC ( .CLK(R_CLK), .RST(R_RST), .ASYNC_PTR(
        gray_wr_ptr), .SYNC_PTR(w2r_ptr) );
  FIFO_RD_PTR_WD4 U0_FIFO_RD ( .R_CLK(R_CLK), .R_RST(R_RST), .R_INC(R_INC), 
        .w2r_ptr(w2r_ptr), .gray_rd_ptr(gray_rd_ptr), .rd_addr(rd_addr), 
        .EMPTY(EMPTY) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(W_RST), .Y(n2) );
endmodule


module SYS_CTRL ( CLK, RST, SYNC_DATA, SYNC_PULSE, FIFO_FULL, RD_DATA, 
        RD_DATA_VLD, ALU_OUT, ALU_OUT_VLD, WR_EN, RD_EN, ADDR, REG_WR_DATA, 
        ALU_FUN, ALU_EN, CLKGATE_EN, FIFO_WR_DATA, WR_INC );
  input [7:0] SYNC_DATA;
  input [7:0] RD_DATA;
  input [15:0] ALU_OUT;
  output [3:0] ADDR;
  output [7:0] REG_WR_DATA;
  output [3:0] ALU_FUN;
  output [7:0] FIFO_WR_DATA;
  input CLK, RST, SYNC_PULSE, FIFO_FULL, RD_DATA_VLD, ALU_OUT_VLD;
  output WR_EN, RD_EN, ALU_EN, CLKGATE_EN, WR_INC;
  wire   n13, n14, n15, n16, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n17, n18, n19,
         n20, n21, n22, n23, n24, n25;
  wire   [3:0] CU;
  wire   [3:0] NXT;

  DFFRX1M \REG_ADDR_reg[0]  ( .D(n76), .CK(CLK), .RN(RST), .QN(n16) );
  DFFRX1M \REG_ADDR_reg[3]  ( .D(n79), .CK(CLK), .RN(RST), .QN(n13) );
  DFFRX1M \REG_ADDR_reg[2]  ( .D(n78), .CK(CLK), .RN(RST), .QN(n14) );
  DFFRX1M \REG_ADDR_reg[1]  ( .D(n77), .CK(CLK), .RN(RST), .QN(n15) );
  DFFRQX2M \CU_reg[0]  ( .D(NXT[0]), .CK(CLK), .RN(RST), .Q(CU[0]) );
  DFFRQX2M \CU_reg[1]  ( .D(NXT[1]), .CK(CLK), .RN(RST), .Q(CU[1]) );
  DFFRQX2M \CU_reg[3]  ( .D(NXT[3]), .CK(CLK), .RN(RST), .Q(CU[3]) );
  DFFRQX2M \CU_reg[2]  ( .D(NXT[2]), .CK(CLK), .RN(RST), .Q(CU[2]) );
  NOR2X2M U3 ( .A(n21), .B(n56), .Y(ALU_FUN[3]) );
  NOR2X2M U4 ( .A(n22), .B(n56), .Y(ALU_FUN[2]) );
  OAI22X2M U5 ( .A0(n22), .A1(n45), .B0(n74), .B1(n14), .Y(ADDR[2]) );
  INVX2M U6 ( .A(n39), .Y(n1) );
  AOI21X2M U7 ( .A0(n8), .A1(FIFO_FULL), .B0(n3), .Y(n39) );
  INVX2M U8 ( .A(n56), .Y(ALU_EN) );
  INVX2M U9 ( .A(n27), .Y(n5) );
  NAND2X2M U10 ( .A(n63), .B(n56), .Y(CLKGATE_EN) );
  NAND2X2M U11 ( .A(n73), .B(n10), .Y(n56) );
  NOR2X2M U12 ( .A(n24), .B(n56), .Y(ALU_FUN[0]) );
  AOI31X2M U13 ( .A0(n28), .A1(n29), .A2(n30), .B0(FIFO_FULL), .Y(WR_INC) );
  NOR2X2M U14 ( .A(n23), .B(n56), .Y(ALU_FUN[1]) );
  NAND2X2M U15 ( .A(n75), .B(n12), .Y(n52) );
  AND2X2M U16 ( .A(n32), .B(n52), .Y(n74) );
  AND2X2M U17 ( .A(n31), .B(n32), .Y(n33) );
  NOR2X2M U18 ( .A(n33), .B(n19), .Y(REG_WR_DATA[5]) );
  NOR2X2M U19 ( .A(n33), .B(n18), .Y(REG_WR_DATA[6]) );
  NOR2X2M U20 ( .A(n33), .B(n23), .Y(REG_WR_DATA[1]) );
  NOR2X2M U21 ( .A(n33), .B(n22), .Y(REG_WR_DATA[2]) );
  NOR2X2M U22 ( .A(n33), .B(n21), .Y(REG_WR_DATA[3]) );
  NOR2X2M U23 ( .A(n33), .B(n20), .Y(REG_WR_DATA[4]) );
  NOR2X2M U24 ( .A(n33), .B(n17), .Y(REG_WR_DATA[7]) );
  NOR2X2M U25 ( .A(n33), .B(n24), .Y(REG_WR_DATA[0]) );
  NAND2BX2M U26 ( .AN(n31), .B(n12), .Y(n63) );
  INVX2M U27 ( .A(n29), .Y(n8) );
  INVX2M U28 ( .A(n30), .Y(n3) );
  INVX2M U29 ( .A(n28), .Y(n4) );
  NOR4X1M U30 ( .A(n19), .B(n17), .C(n21), .D(n23), .Y(n59) );
  NAND3X2M U31 ( .A(n10), .B(n12), .C(n61), .Y(n27) );
  NAND4BX1M U32 ( .AN(n64), .B(n59), .C(n24), .D(n46), .Y(n62) );
  NAND3X2M U33 ( .A(n20), .B(n18), .C(n22), .Y(n64) );
  OAI21X2M U34 ( .A0(n12), .A1(n25), .B0(n11), .Y(n38) );
  NOR2BX2M U35 ( .AN(n52), .B(n53), .Y(n49) );
  NAND3X2M U36 ( .A(n20), .B(n19), .C(n23), .Y(n44) );
  INVX2M U37 ( .A(n45), .Y(RD_EN) );
  INVX2M U38 ( .A(n37), .Y(n9) );
  NOR3X2M U39 ( .A(n6), .B(CU[2]), .C(n11), .Y(n73) );
  INVX2M U40 ( .A(CU[3]), .Y(n11) );
  OAI22X4M U41 ( .A0(n21), .A1(n45), .B0(n74), .B1(n13), .Y(ADDR[3]) );
  NOR3X2M U42 ( .A(CU[0]), .B(CU[3]), .C(n10), .Y(n75) );
  NOR2X2M U43 ( .A(n6), .B(CU[3]), .Y(n61) );
  NAND2X2M U44 ( .A(n75), .B(CU[2]), .Y(n45) );
  INVX2M U45 ( .A(CU[1]), .Y(n10) );
  INVX2M U46 ( .A(CU[2]), .Y(n12) );
  INVX2M U47 ( .A(SYNC_DATA[0]), .Y(n24) );
  INVX2M U48 ( .A(SYNC_DATA[1]), .Y(n23) );
  INVX2M U49 ( .A(CU[0]), .Y(n6) );
  INVX2M U50 ( .A(SYNC_DATA[2]), .Y(n22) );
  NAND3X2M U51 ( .A(CU[1]), .B(n61), .C(CU[2]), .Y(n32) );
  OAI22X1M U52 ( .A0(n23), .A1(n45), .B0(n74), .B1(n15), .Y(ADDR[1]) );
  OAI221X1M U53 ( .A0(n74), .A1(n16), .B0(n24), .B1(n45), .C0(n63), .Y(ADDR[0]) );
  NAND2X2M U54 ( .A(n34), .B(n35), .Y(NXT[3]) );
  AOI31X2M U55 ( .A0(n9), .A1(SYNC_DATA[4]), .A2(n36), .B0(ALU_EN), .Y(n35) );
  AOI31X2M U56 ( .A0(n6), .A1(n10), .A2(n38), .B0(n1), .Y(n34) );
  NOR3X2M U57 ( .A(n24), .B(SYNC_DATA[5]), .C(SYNC_DATA[1]), .Y(n36) );
  OAI21X2M U58 ( .A0(SYNC_PULSE), .A1(n31), .B0(n32), .Y(WR_EN) );
  OAI22X1M U59 ( .A0(SYNC_PULSE), .A1(CU[0]), .B0(CU[3]), .B1(n48), .Y(n42) );
  NOR2X2M U60 ( .A(FIFO_FULL), .B(n6), .Y(n48) );
  OAI211X2M U61 ( .A0(FIFO_FULL), .A1(n30), .B0(n40), .C0(n41), .Y(NXT[2]) );
  AOI2BB2XLM U62 ( .B0(FIFO_FULL), .B1(n8), .A0N(n25), .A1N(n49), .Y(n40) );
  AOI31X2M U63 ( .A0(n42), .A1(n10), .A2(CU[2]), .B0(n43), .Y(n41) );
  OAI31X1M U64 ( .A0(n44), .A1(SYNC_DATA[0]), .A2(n37), .B0(n45), .Y(n43) );
  NAND4X2M U65 ( .A(CU[3]), .B(CU[2]), .C(CU[1]), .D(CU[0]), .Y(n29) );
  INVX2M U66 ( .A(SYNC_DATA[3]), .Y(n21) );
  NOR2X2M U67 ( .A(FIFO_FULL), .B(n71), .Y(FIFO_WR_DATA[1]) );
  AOI222X1M U68 ( .A0(RD_DATA[1]), .A1(n4), .B0(ALU_OUT[9]), .B1(n8), .C0(
        ALU_OUT[1]), .C1(n3), .Y(n71) );
  NOR2X2M U69 ( .A(FIFO_FULL), .B(n70), .Y(FIFO_WR_DATA[2]) );
  AOI222X1M U70 ( .A0(RD_DATA[2]), .A1(n4), .B0(ALU_OUT[10]), .B1(n8), .C0(
        ALU_OUT[2]), .C1(n3), .Y(n70) );
  NOR2X2M U71 ( .A(FIFO_FULL), .B(n69), .Y(FIFO_WR_DATA[3]) );
  AOI222X1M U72 ( .A0(RD_DATA[3]), .A1(n4), .B0(ALU_OUT[11]), .B1(n8), .C0(
        ALU_OUT[3]), .C1(n3), .Y(n69) );
  NOR2X2M U73 ( .A(FIFO_FULL), .B(n68), .Y(FIFO_WR_DATA[4]) );
  AOI222X1M U74 ( .A0(RD_DATA[4]), .A1(n4), .B0(ALU_OUT[12]), .B1(n8), .C0(
        ALU_OUT[4]), .C1(n3), .Y(n68) );
  NOR2X2M U75 ( .A(FIFO_FULL), .B(n67), .Y(FIFO_WR_DATA[5]) );
  AOI222X1M U76 ( .A0(RD_DATA[5]), .A1(n4), .B0(ALU_OUT[13]), .B1(n8), .C0(
        ALU_OUT[5]), .C1(n3), .Y(n67) );
  NOR2X2M U77 ( .A(FIFO_FULL), .B(n66), .Y(FIFO_WR_DATA[6]) );
  AOI222X1M U78 ( .A0(RD_DATA[6]), .A1(n4), .B0(ALU_OUT[14]), .B1(n8), .C0(
        ALU_OUT[6]), .C1(n3), .Y(n66) );
  NOR2X2M U79 ( .A(FIFO_FULL), .B(n65), .Y(FIFO_WR_DATA[7]) );
  AOI222X1M U80 ( .A0(RD_DATA[7]), .A1(n4), .B0(ALU_OUT[15]), .B1(n8), .C0(
        ALU_OUT[7]), .C1(n3), .Y(n65) );
  NAND2X2M U81 ( .A(n73), .B(CU[1]), .Y(n30) );
  NOR2X2M U82 ( .A(FIFO_FULL), .B(n72), .Y(FIFO_WR_DATA[0]) );
  NAND3X2M U83 ( .A(n61), .B(n10), .C(CU[2]), .Y(n28) );
  NAND3X2M U84 ( .A(n6), .B(n10), .C(CU[3]), .Y(n31) );
  NAND4BX1M U85 ( .AN(n54), .B(n55), .C(n56), .D(n57), .Y(NXT[0]) );
  OAI21X2M U86 ( .A0(n53), .A1(n5), .B0(n25), .Y(n55) );
  AOI31X2M U87 ( .A0(n62), .A1(n63), .A2(n52), .B0(n25), .Y(n54) );
  AOI221XLM U88 ( .A0(n4), .A1(FIFO_FULL), .B0(RD_DATA_VLD), .B1(RD_EN), .C0(
        n50), .Y(n57) );
  NAND3BX2M U89 ( .AN(n50), .B(n49), .C(n51), .Y(NXT[1]) );
  AOI222X1M U90 ( .A0(SYNC_PULSE), .A1(n5), .B0(ALU_OUT_VLD), .B1(ALU_EN), 
        .C0(RD_EN), .C1(n2), .Y(n51) );
  INVX2M U91 ( .A(RD_DATA_VLD), .Y(n2) );
  NAND2X2M U92 ( .A(n39), .B(n58), .Y(n50) );
  NAND4X2M U93 ( .A(SYNC_PULSE), .B(n46), .C(n59), .D(n60), .Y(n58) );
  NOR4X1M U94 ( .A(SYNC_DATA[6]), .B(SYNC_DATA[2]), .C(n24), .D(n20), .Y(n60)
         );
  NOR4X1M U95 ( .A(CU[0]), .B(CU[1]), .C(CU[2]), .D(CU[3]), .Y(n46) );
  OAI22X1M U96 ( .A0(n5), .A1(n14), .B0(n27), .B1(n22), .Y(n78) );
  OAI22X1M U97 ( .A0(n5), .A1(n16), .B0(n27), .B1(n24), .Y(n76) );
  OAI22X1M U98 ( .A0(n5), .A1(n15), .B0(n27), .B1(n23), .Y(n77) );
  OAI22X1M U99 ( .A0(n5), .A1(n13), .B0(n27), .B1(n21), .Y(n79) );
  NAND4X2M U100 ( .A(n46), .B(SYNC_DATA[6]), .C(SYNC_PULSE), .D(n47), .Y(n37)
         );
  NOR3X2M U101 ( .A(n17), .B(n22), .C(n21), .Y(n47) );
  AND3X2M U102 ( .A(n61), .B(n12), .C(CU[1]), .Y(n53) );
  INVX2M U103 ( .A(SYNC_DATA[4]), .Y(n20) );
  INVX2M U104 ( .A(SYNC_DATA[5]), .Y(n19) );
  INVX2M U105 ( .A(SYNC_PULSE), .Y(n25) );
  INVX2M U106 ( .A(SYNC_DATA[7]), .Y(n17) );
  INVX2M U107 ( .A(SYNC_DATA[6]), .Y(n18) );
  AOI222X1M U108 ( .A0(RD_DATA[0]), .A1(n4), .B0(ALU_OUT[8]), .B1(n8), .C0(
        ALU_OUT[0]), .C1(n3), .Y(n72) );
endmodule


module REGFILE ( CLK, RST, WrEn, RdEn, ADDR, WR_DATA, REG0, REG1, REG2, REG3, 
        RD_DATA, RD_DATA_VLD );
  input [3:0] ADDR;
  input [7:0] WR_DATA;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  output [7:0] RD_DATA;
  input CLK, RST, WrEn, RdEn;
  output RD_DATA_VLD;
  wire   N11, N12, N13, N14, \REGF_MEM[15][7] , \REGF_MEM[15][6] ,
         \REGF_MEM[15][5] , \REGF_MEM[15][4] , \REGF_MEM[15][3] ,
         \REGF_MEM[15][2] , \REGF_MEM[15][1] , \REGF_MEM[15][0] ,
         \REGF_MEM[14][7] , \REGF_MEM[14][6] , \REGF_MEM[14][5] ,
         \REGF_MEM[14][4] , \REGF_MEM[14][3] , \REGF_MEM[14][2] ,
         \REGF_MEM[14][1] , \REGF_MEM[14][0] , \REGF_MEM[13][7] ,
         \REGF_MEM[13][6] , \REGF_MEM[13][5] , \REGF_MEM[13][4] ,
         \REGF_MEM[13][3] , \REGF_MEM[13][2] , \REGF_MEM[13][1] ,
         \REGF_MEM[13][0] , \REGF_MEM[12][7] , \REGF_MEM[12][6] ,
         \REGF_MEM[12][5] , \REGF_MEM[12][4] , \REGF_MEM[12][3] ,
         \REGF_MEM[12][2] , \REGF_MEM[12][1] , \REGF_MEM[12][0] ,
         \REGF_MEM[11][7] , \REGF_MEM[11][6] , \REGF_MEM[11][5] ,
         \REGF_MEM[11][4] , \REGF_MEM[11][3] , \REGF_MEM[11][2] ,
         \REGF_MEM[11][1] , \REGF_MEM[11][0] , \REGF_MEM[10][7] ,
         \REGF_MEM[10][6] , \REGF_MEM[10][5] , \REGF_MEM[10][4] ,
         \REGF_MEM[10][3] , \REGF_MEM[10][2] , \REGF_MEM[10][1] ,
         \REGF_MEM[10][0] , \REGF_MEM[9][7] , \REGF_MEM[9][6] ,
         \REGF_MEM[9][5] , \REGF_MEM[9][4] , \REGF_MEM[9][3] ,
         \REGF_MEM[9][2] , \REGF_MEM[9][1] , \REGF_MEM[9][0] ,
         \REGF_MEM[8][7] , \REGF_MEM[8][6] , \REGF_MEM[8][5] ,
         \REGF_MEM[8][4] , \REGF_MEM[8][3] , \REGF_MEM[8][2] ,
         \REGF_MEM[8][1] , \REGF_MEM[8][0] , \REGF_MEM[7][7] ,
         \REGF_MEM[7][6] , \REGF_MEM[7][5] , \REGF_MEM[7][4] ,
         \REGF_MEM[7][3] , \REGF_MEM[7][2] , \REGF_MEM[7][1] ,
         \REGF_MEM[7][0] , \REGF_MEM[6][7] , \REGF_MEM[6][6] ,
         \REGF_MEM[6][5] , \REGF_MEM[6][4] , \REGF_MEM[6][3] ,
         \REGF_MEM[6][2] , \REGF_MEM[6][1] , \REGF_MEM[6][0] ,
         \REGF_MEM[5][7] , \REGF_MEM[5][6] , \REGF_MEM[5][5] ,
         \REGF_MEM[5][4] , \REGF_MEM[5][3] , \REGF_MEM[5][2] ,
         \REGF_MEM[5][1] , \REGF_MEM[5][0] , \REGF_MEM[4][7] ,
         \REGF_MEM[4][6] , \REGF_MEM[4][5] , \REGF_MEM[4][4] ,
         \REGF_MEM[4][3] , \REGF_MEM[4][2] , \REGF_MEM[4][1] ,
         \REGF_MEM[4][0] , N36, N37, N38, N39, N40, N41, N42, N43, n11, n12,
         n13, n14, n15, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111, n112, n113, n114, n115, n116, n117, n118, n119, n120,
         n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n16, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229;
  assign N11 = ADDR[0];
  assign N12 = ADDR[1];
  assign N13 = ADDR[2];
  assign N14 = ADDR[3];

  DFFSQX2M \REGF_MEM_reg[3][5]  ( .D(n77), .CK(CLK), .SN(n204), .Q(REG3[5]) );
  DFFRQX2M \RD_DATA_reg[0]  ( .D(n39), .CK(CLK), .RN(n208), .Q(RD_DATA[0]) );
  DFFRQX2M \REGF_MEM_reg[13][7]  ( .D(n159), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[13][7] ) );
  DFFRQX2M \REGF_MEM_reg[13][6]  ( .D(n158), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[13][6] ) );
  DFFRQX2M \REGF_MEM_reg[13][5]  ( .D(n157), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[13][5] ) );
  DFFRQX2M \REGF_MEM_reg[13][4]  ( .D(n156), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[13][4] ) );
  DFFRQX2M \REGF_MEM_reg[13][3]  ( .D(n155), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[13][3] ) );
  DFFRQX2M \REGF_MEM_reg[13][2]  ( .D(n154), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[13][2] ) );
  DFFRQX2M \REGF_MEM_reg[13][1]  ( .D(n153), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[13][1] ) );
  DFFRQX2M \REGF_MEM_reg[13][0]  ( .D(n152), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[13][0] ) );
  DFFRQX2M \REGF_MEM_reg[9][7]  ( .D(n127), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[9][7] ) );
  DFFRQX2M \REGF_MEM_reg[9][6]  ( .D(n126), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[9][6] ) );
  DFFRQX2M \REGF_MEM_reg[9][5]  ( .D(n125), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[9][5] ) );
  DFFRQX2M \REGF_MEM_reg[9][4]  ( .D(n124), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[9][4] ) );
  DFFRQX2M \REGF_MEM_reg[9][3]  ( .D(n123), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[9][3] ) );
  DFFRQX2M \REGF_MEM_reg[9][2]  ( .D(n122), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[9][2] ) );
  DFFRQX2M \REGF_MEM_reg[9][1]  ( .D(n121), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[9][1] ) );
  DFFRQX2M \REGF_MEM_reg[9][0]  ( .D(n120), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[9][0] ) );
  DFFRQX2M \REGF_MEM_reg[5][7]  ( .D(n95), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[5][7] ) );
  DFFRQX2M \REGF_MEM_reg[5][6]  ( .D(n94), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[5][6] ) );
  DFFRQX2M \REGF_MEM_reg[5][5]  ( .D(n93), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[5][5] ) );
  DFFRQX2M \REGF_MEM_reg[5][4]  ( .D(n92), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[5][4] ) );
  DFFRQX2M \REGF_MEM_reg[5][3]  ( .D(n91), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[5][3] ) );
  DFFRQX2M \REGF_MEM_reg[5][2]  ( .D(n90), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[5][2] ) );
  DFFRQX2M \REGF_MEM_reg[5][1]  ( .D(n89), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[5][1] ) );
  DFFRQX2M \REGF_MEM_reg[5][0]  ( .D(n88), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[5][0] ) );
  DFFRQX2M \REGF_MEM_reg[15][7]  ( .D(n175), .CK(CLK), .RN(n204), .Q(
        \REGF_MEM[15][7] ) );
  DFFRQX2M \REGF_MEM_reg[15][6]  ( .D(n174), .CK(CLK), .RN(n213), .Q(
        \REGF_MEM[15][6] ) );
  DFFRQX2M \REGF_MEM_reg[15][5]  ( .D(n173), .CK(CLK), .RN(n213), .Q(
        \REGF_MEM[15][5] ) );
  DFFRQX2M \REGF_MEM_reg[15][4]  ( .D(n172), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[15][4] ) );
  DFFRQX2M \REGF_MEM_reg[15][3]  ( .D(n171), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[15][3] ) );
  DFFRQX2M \REGF_MEM_reg[15][2]  ( .D(n170), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[15][2] ) );
  DFFRQX2M \REGF_MEM_reg[15][1]  ( .D(n169), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[15][1] ) );
  DFFRQX2M \REGF_MEM_reg[15][0]  ( .D(n168), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[15][0] ) );
  DFFRQX2M \REGF_MEM_reg[11][7]  ( .D(n143), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[11][7] ) );
  DFFRQX2M \REGF_MEM_reg[11][6]  ( .D(n142), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[11][6] ) );
  DFFRQX2M \REGF_MEM_reg[11][5]  ( .D(n141), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[11][5] ) );
  DFFRQX2M \REGF_MEM_reg[11][4]  ( .D(n140), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[11][4] ) );
  DFFRQX2M \REGF_MEM_reg[11][3]  ( .D(n139), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[11][3] ) );
  DFFRQX2M \REGF_MEM_reg[11][2]  ( .D(n138), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[11][2] ) );
  DFFRQX2M \REGF_MEM_reg[11][1]  ( .D(n137), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[11][1] ) );
  DFFRQX2M \REGF_MEM_reg[11][0]  ( .D(n136), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[11][0] ) );
  DFFRQX2M \REGF_MEM_reg[7][7]  ( .D(n111), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[7][7] ) );
  DFFRQX2M \REGF_MEM_reg[7][6]  ( .D(n110), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[7][6] ) );
  DFFRQX2M \REGF_MEM_reg[7][5]  ( .D(n109), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[7][5] ) );
  DFFRQX2M \REGF_MEM_reg[7][4]  ( .D(n108), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[7][4] ) );
  DFFRQX2M \REGF_MEM_reg[7][3]  ( .D(n107), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[7][3] ) );
  DFFRQX2M \REGF_MEM_reg[7][2]  ( .D(n106), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[7][2] ) );
  DFFRQX2M \REGF_MEM_reg[7][1]  ( .D(n105), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[7][1] ) );
  DFFRQX2M \REGF_MEM_reg[7][0]  ( .D(n104), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[7][0] ) );
  DFFRQX2M \REGF_MEM_reg[14][7]  ( .D(n167), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[14][7] ) );
  DFFRQX2M \REGF_MEM_reg[14][6]  ( .D(n166), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[14][6] ) );
  DFFRQX2M \REGF_MEM_reg[14][5]  ( .D(n165), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[14][5] ) );
  DFFRQX2M \REGF_MEM_reg[14][4]  ( .D(n164), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[14][4] ) );
  DFFRQX2M \REGF_MEM_reg[14][3]  ( .D(n163), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[14][3] ) );
  DFFRQX2M \REGF_MEM_reg[14][2]  ( .D(n162), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[14][2] ) );
  DFFRQX2M \REGF_MEM_reg[14][1]  ( .D(n161), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[14][1] ) );
  DFFRQX2M \REGF_MEM_reg[14][0]  ( .D(n160), .CK(CLK), .RN(n212), .Q(
        \REGF_MEM[14][0] ) );
  DFFRQX2M \REGF_MEM_reg[10][7]  ( .D(n135), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[10][7] ) );
  DFFRQX2M \REGF_MEM_reg[10][6]  ( .D(n134), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[10][6] ) );
  DFFRQX2M \REGF_MEM_reg[10][5]  ( .D(n133), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[10][5] ) );
  DFFRQX2M \REGF_MEM_reg[10][4]  ( .D(n132), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[10][4] ) );
  DFFRQX2M \REGF_MEM_reg[10][3]  ( .D(n131), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[10][3] ) );
  DFFRQX2M \REGF_MEM_reg[10][2]  ( .D(n130), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[10][2] ) );
  DFFRQX2M \REGF_MEM_reg[10][1]  ( .D(n129), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[10][1] ) );
  DFFRQX2M \REGF_MEM_reg[10][0]  ( .D(n128), .CK(CLK), .RN(n210), .Q(
        \REGF_MEM[10][0] ) );
  DFFRQX2M \REGF_MEM_reg[6][7]  ( .D(n103), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[6][7] ) );
  DFFRQX2M \REGF_MEM_reg[6][6]  ( .D(n102), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[6][6] ) );
  DFFRQX2M \REGF_MEM_reg[6][5]  ( .D(n101), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[6][5] ) );
  DFFRQX2M \REGF_MEM_reg[6][4]  ( .D(n100), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[6][4] ) );
  DFFRQX2M \REGF_MEM_reg[6][3]  ( .D(n99), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[6][3] ) );
  DFFRQX2M \REGF_MEM_reg[6][2]  ( .D(n98), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[6][2] ) );
  DFFRQX2M \REGF_MEM_reg[6][1]  ( .D(n97), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[6][1] ) );
  DFFRQX2M \REGF_MEM_reg[6][0]  ( .D(n96), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[6][0] ) );
  DFFRQX2M \REGF_MEM_reg[12][7]  ( .D(n151), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[12][7] ) );
  DFFRQX2M \REGF_MEM_reg[12][6]  ( .D(n150), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[12][6] ) );
  DFFRQX2M \REGF_MEM_reg[12][5]  ( .D(n149), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[12][5] ) );
  DFFRQX2M \REGF_MEM_reg[12][4]  ( .D(n148), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[12][4] ) );
  DFFRQX2M \REGF_MEM_reg[12][3]  ( .D(n147), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[12][3] ) );
  DFFRQX2M \REGF_MEM_reg[12][2]  ( .D(n146), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[12][2] ) );
  DFFRQX2M \REGF_MEM_reg[12][1]  ( .D(n145), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[12][1] ) );
  DFFRQX2M \REGF_MEM_reg[12][0]  ( .D(n144), .CK(CLK), .RN(n211), .Q(
        \REGF_MEM[12][0] ) );
  DFFRQX2M \REGF_MEM_reg[8][7]  ( .D(n119), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[8][7] ) );
  DFFRQX2M \REGF_MEM_reg[8][6]  ( .D(n118), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[8][6] ) );
  DFFRQX2M \REGF_MEM_reg[8][5]  ( .D(n117), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[8][5] ) );
  DFFRQX2M \REGF_MEM_reg[8][4]  ( .D(n116), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[8][4] ) );
  DFFRQX2M \REGF_MEM_reg[8][3]  ( .D(n115), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[8][3] ) );
  DFFRQX2M \REGF_MEM_reg[8][2]  ( .D(n114), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[8][2] ) );
  DFFRQX2M \REGF_MEM_reg[8][1]  ( .D(n113), .CK(CLK), .RN(n209), .Q(
        \REGF_MEM[8][1] ) );
  DFFRQX2M \REGF_MEM_reg[8][0]  ( .D(n112), .CK(CLK), .RN(n208), .Q(
        \REGF_MEM[8][0] ) );
  DFFRQX2M \REGF_MEM_reg[4][7]  ( .D(n87), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[4][7] ) );
  DFFRQX2M \REGF_MEM_reg[4][6]  ( .D(n86), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[4][6] ) );
  DFFRQX2M \REGF_MEM_reg[4][5]  ( .D(n85), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[4][5] ) );
  DFFRQX2M \REGF_MEM_reg[4][4]  ( .D(n84), .CK(CLK), .RN(n207), .Q(
        \REGF_MEM[4][4] ) );
  DFFRQX2M \REGF_MEM_reg[4][3]  ( .D(n83), .CK(CLK), .RN(n206), .Q(
        \REGF_MEM[4][3] ) );
  DFFRQX2M \REGF_MEM_reg[4][2]  ( .D(n82), .CK(CLK), .RN(n206), .Q(
        \REGF_MEM[4][2] ) );
  DFFRQX2M \REGF_MEM_reg[4][1]  ( .D(n81), .CK(CLK), .RN(n206), .Q(
        \REGF_MEM[4][1] ) );
  DFFRQX2M \REGF_MEM_reg[4][0]  ( .D(n80), .CK(CLK), .RN(n206), .Q(
        \REGF_MEM[4][0] ) );
  DFFRQX2M \REGF_MEM_reg[3][0]  ( .D(n72), .CK(CLK), .RN(n206), .Q(REG3[0]) );
  DFFRQX2M \REGF_MEM_reg[3][6]  ( .D(n78), .CK(CLK), .RN(n206), .Q(REG3[6]) );
  DFFRQX2M \REGF_MEM_reg[3][3]  ( .D(n75), .CK(CLK), .RN(n206), .Q(REG3[3]) );
  DFFRQX2M \REGF_MEM_reg[3][2]  ( .D(n74), .CK(CLK), .RN(n206), .Q(REG3[2]) );
  DFFRQX2M \REGF_MEM_reg[3][1]  ( .D(n73), .CK(CLK), .RN(n206), .Q(REG3[1]) );
  DFFRQX2M \REGF_MEM_reg[3][4]  ( .D(n76), .CK(CLK), .RN(n206), .Q(REG3[4]) );
  DFFRQX2M \RD_DATA_reg[7]  ( .D(n46), .CK(CLK), .RN(n204), .Q(RD_DATA[7]) );
  DFFRQX2M \RD_DATA_reg[6]  ( .D(n45), .CK(CLK), .RN(n204), .Q(RD_DATA[6]) );
  DFFRQX2M \RD_DATA_reg[5]  ( .D(n44), .CK(CLK), .RN(n204), .Q(RD_DATA[5]) );
  DFFRQX2M \RD_DATA_reg[4]  ( .D(n43), .CK(CLK), .RN(n206), .Q(RD_DATA[4]) );
  DFFRQX2M \RD_DATA_reg[3]  ( .D(n42), .CK(CLK), .RN(n204), .Q(RD_DATA[3]) );
  DFFRQX2M \RD_DATA_reg[2]  ( .D(n41), .CK(CLK), .RN(n204), .Q(RD_DATA[2]) );
  DFFRQX2M \RD_DATA_reg[1]  ( .D(n40), .CK(CLK), .RN(n204), .Q(RD_DATA[1]) );
  DFFRQX2M \REGF_MEM_reg[3][7]  ( .D(n79), .CK(CLK), .RN(n206), .Q(REG3[7]) );
  DFFSQX2M \REGF_MEM_reg[2][0]  ( .D(n64), .CK(CLK), .SN(n204), .Q(REG2[0]) );
  DFFRQX2M \REGF_MEM_reg[2][1]  ( .D(n65), .CK(CLK), .RN(n205), .Q(REG2[1]) );
  DFFRQX2M RD_DATA_VLD_reg ( .D(n47), .CK(CLK), .RN(n204), .Q(RD_DATA_VLD) );
  DFFRQX2M \REGF_MEM_reg[2][4]  ( .D(n68), .CK(CLK), .RN(n206), .Q(REG2[4]) );
  DFFSQX2M \REGF_MEM_reg[2][7]  ( .D(n71), .CK(CLK), .SN(n204), .Q(REG2[7]) );
  DFFRQX2M \REGF_MEM_reg[2][2]  ( .D(n66), .CK(CLK), .RN(n205), .Q(REG2[2]) );
  DFFRQX2M \REGF_MEM_reg[2][3]  ( .D(n67), .CK(CLK), .RN(n205), .Q(REG2[3]) );
  DFFRQX2M \REGF_MEM_reg[2][6]  ( .D(n70), .CK(CLK), .RN(n206), .Q(REG2[6]) );
  DFFRQX2M \REGF_MEM_reg[0][2]  ( .D(n50), .CK(CLK), .RN(n205), .Q(REG0[2]) );
  DFFRQX2M \REGF_MEM_reg[0][1]  ( .D(n49), .CK(CLK), .RN(n205), .Q(REG0[1]) );
  DFFRQX2M \REGF_MEM_reg[0][0]  ( .D(n48), .CK(CLK), .RN(n204), .Q(REG0[0]) );
  DFFRQX2M \REGF_MEM_reg[0][3]  ( .D(n51), .CK(CLK), .RN(n205), .Q(REG0[3]) );
  DFFRQX2M \REGF_MEM_reg[0][4]  ( .D(n52), .CK(CLK), .RN(n205), .Q(REG0[4]) );
  DFFRQX2M \REGF_MEM_reg[2][5]  ( .D(n69), .CK(CLK), .RN(n206), .Q(REG2[5]) );
  DFFRQX1M \REGF_MEM_reg[0][5]  ( .D(n53), .CK(CLK), .RN(RST), .Q(REG0[5]) );
  DFFRHQX4M \REGF_MEM_reg[1][0]  ( .D(n56), .CK(CLK), .RN(n204), .Q(REG1[0])
         );
  DFFRHQX2M \REGF_MEM_reg[1][3]  ( .D(n59), .CK(CLK), .RN(n205), .Q(REG1[3])
         );
  DFFRHQX2M \REGF_MEM_reg[1][2]  ( .D(n58), .CK(CLK), .RN(n205), .Q(REG1[2])
         );
  DFFRHQX1M \REGF_MEM_reg[1][5]  ( .D(n61), .CK(CLK), .RN(n205), .Q(REG1[5])
         );
  DFFRHQX2M \REGF_MEM_reg[1][4]  ( .D(n60), .CK(CLK), .RN(n205), .Q(REG1[4])
         );
  DFFRHQX2M \REGF_MEM_reg[1][1]  ( .D(n57), .CK(CLK), .RN(n205), .Q(REG1[1])
         );
  DFFRHQX2M \REGF_MEM_reg[1][6]  ( .D(n62), .CK(CLK), .RN(n204), .Q(REG1[6])
         );
  DFFRHQX1M \REGF_MEM_reg[0][7]  ( .D(n55), .CK(CLK), .RN(n205), .Q(REG0[7])
         );
  DFFRHQX2M \REGF_MEM_reg[0][6]  ( .D(n54), .CK(CLK), .RN(n205), .Q(REG0[6])
         );
  DFFRHQX8M \REGF_MEM_reg[1][7]  ( .D(n63), .CK(CLK), .RN(RST), .Q(REG1[7]) );
  NOR2X2M U3 ( .A(n221), .B(n220), .Y(n1) );
  NOR2X2M U4 ( .A(n203), .B(N13), .Y(n19) );
  MX2XLM U5 ( .A(REG0[5]), .B(WR_DATA[5]), .S0(n219), .Y(n53) );
  MX2XLM U6 ( .A(REG0[6]), .B(WR_DATA[6]), .S0(n219), .Y(n54) );
  INVX2M U7 ( .A(n202), .Y(n200) );
  INVX2M U8 ( .A(n199), .Y(n201) );
  BUFX2M U9 ( .A(n202), .Y(n199) );
  INVX2M U10 ( .A(n17), .Y(n220) );
  INVX2M U11 ( .A(n13), .Y(n219) );
  INVX2M U12 ( .A(n203), .Y(n198) );
  NAND2X2M U13 ( .A(n29), .B(n19), .Y(n32) );
  NAND2X2M U14 ( .A(n31), .B(n19), .Y(n33) );
  NAND2X2M U15 ( .A(n19), .B(n15), .Y(n18) );
  NAND2X2M U16 ( .A(n19), .B(n17), .Y(n20) );
  NAND2X2M U17 ( .A(n29), .B(n22), .Y(n34) );
  NAND2X2M U18 ( .A(n31), .B(n22), .Y(n35) );
  NAND2X2M U19 ( .A(n29), .B(n25), .Y(n36) );
  NAND2X2M U20 ( .A(n31), .B(n25), .Y(n38) );
  NAND2X2M U21 ( .A(n29), .B(n14), .Y(n28) );
  NAND2X2M U22 ( .A(n31), .B(n14), .Y(n30) );
  NAND2BX2M U23 ( .AN(n221), .B(n15), .Y(n13) );
  AND2X2M U24 ( .A(n37), .B(n200), .Y(n31) );
  AND2X2M U25 ( .A(n26), .B(n200), .Y(n17) );
  NAND2X2M U26 ( .A(n22), .B(n15), .Y(n21) );
  NAND2X2M U27 ( .A(n22), .B(n17), .Y(n23) );
  NAND2X2M U28 ( .A(n25), .B(n15), .Y(n24) );
  NAND2X2M U29 ( .A(n25), .B(n17), .Y(n27) );
  INVX2M U30 ( .A(WR_DATA[0]), .Y(n222) );
  INVX2M U31 ( .A(WR_DATA[1]), .Y(n223) );
  INVX2M U32 ( .A(WR_DATA[2]), .Y(n224) );
  INVX2M U33 ( .A(WR_DATA[3]), .Y(n225) );
  INVX2M U34 ( .A(WR_DATA[4]), .Y(n226) );
  INVX2M U35 ( .A(WR_DATA[5]), .Y(n227) );
  INVX2M U36 ( .A(WR_DATA[6]), .Y(n228) );
  INVX2M U37 ( .A(WR_DATA[7]), .Y(n229) );
  INVX2M U38 ( .A(n14), .Y(n221) );
  BUFX2M U39 ( .A(n218), .Y(n204) );
  BUFX2M U40 ( .A(n218), .Y(n205) );
  BUFX2M U41 ( .A(n217), .Y(n206) );
  BUFX2M U42 ( .A(n217), .Y(n207) );
  BUFX2M U43 ( .A(n216), .Y(n208) );
  BUFX2M U44 ( .A(n216), .Y(n209) );
  BUFX2M U45 ( .A(n215), .Y(n210) );
  BUFX2M U46 ( .A(n215), .Y(n211) );
  BUFX2M U47 ( .A(n214), .Y(n212) );
  BUFX2M U48 ( .A(n214), .Y(n213) );
  NOR2BX2M U49 ( .AN(n11), .B(N14), .Y(n26) );
  AND2X2M U50 ( .A(n37), .B(n202), .Y(n29) );
  AND2X2M U51 ( .A(n26), .B(n202), .Y(n15) );
  AND2X2M U52 ( .A(N14), .B(n11), .Y(n37) );
  NOR2BX2M U53 ( .AN(WrEn), .B(RdEn), .Y(n11) );
  NOR2BX2M U54 ( .AN(RdEn), .B(WrEn), .Y(n12) );
  NOR2X2M U55 ( .A(n198), .B(N13), .Y(n14) );
  AND2X2M U56 ( .A(N13), .B(n203), .Y(n22) );
  AND2X2M U57 ( .A(N13), .B(N12), .Y(n25) );
  BUFX2M U58 ( .A(RST), .Y(n217) );
  BUFX2M U59 ( .A(RST), .Y(n216) );
  BUFX2M U60 ( .A(RST), .Y(n215) );
  BUFX2M U61 ( .A(RST), .Y(n214) );
  BUFX2M U62 ( .A(RST), .Y(n218) );
  OAI2BB2X1M U63 ( .B0(n222), .B1(n32), .A0N(\REGF_MEM[10][0] ), .A1N(n32), 
        .Y(n128) );
  OAI2BB2X1M U64 ( .B0(n223), .B1(n32), .A0N(\REGF_MEM[10][1] ), .A1N(n32), 
        .Y(n129) );
  OAI2BB2X1M U65 ( .B0(n224), .B1(n32), .A0N(\REGF_MEM[10][2] ), .A1N(n32), 
        .Y(n130) );
  OAI2BB2X1M U66 ( .B0(n225), .B1(n32), .A0N(\REGF_MEM[10][3] ), .A1N(n32), 
        .Y(n131) );
  OAI2BB2X1M U67 ( .B0(n226), .B1(n32), .A0N(\REGF_MEM[10][4] ), .A1N(n32), 
        .Y(n132) );
  OAI2BB2X1M U68 ( .B0(n227), .B1(n32), .A0N(\REGF_MEM[10][5] ), .A1N(n32), 
        .Y(n133) );
  OAI2BB2X1M U69 ( .B0(n228), .B1(n32), .A0N(\REGF_MEM[10][6] ), .A1N(n32), 
        .Y(n134) );
  OAI2BB2X1M U70 ( .B0(n229), .B1(n32), .A0N(\REGF_MEM[10][7] ), .A1N(n32), 
        .Y(n135) );
  OAI2BB2X1M U71 ( .B0(n222), .B1(n33), .A0N(\REGF_MEM[11][0] ), .A1N(n33), 
        .Y(n136) );
  OAI2BB2X1M U72 ( .B0(n223), .B1(n33), .A0N(\REGF_MEM[11][1] ), .A1N(n33), 
        .Y(n137) );
  OAI2BB2X1M U73 ( .B0(n224), .B1(n33), .A0N(\REGF_MEM[11][2] ), .A1N(n33), 
        .Y(n138) );
  OAI2BB2X1M U74 ( .B0(n225), .B1(n33), .A0N(\REGF_MEM[11][3] ), .A1N(n33), 
        .Y(n139) );
  OAI2BB2X1M U75 ( .B0(n226), .B1(n33), .A0N(\REGF_MEM[11][4] ), .A1N(n33), 
        .Y(n140) );
  OAI2BB2X1M U76 ( .B0(n227), .B1(n33), .A0N(\REGF_MEM[11][5] ), .A1N(n33), 
        .Y(n141) );
  OAI2BB2X1M U77 ( .B0(n228), .B1(n33), .A0N(\REGF_MEM[11][6] ), .A1N(n33), 
        .Y(n142) );
  OAI2BB2X1M U78 ( .B0(n229), .B1(n33), .A0N(\REGF_MEM[11][7] ), .A1N(n33), 
        .Y(n143) );
  OAI2BB2X1M U79 ( .B0(n222), .B1(n28), .A0N(\REGF_MEM[8][0] ), .A1N(n28), .Y(
        n112) );
  OAI2BB2X1M U80 ( .B0(n223), .B1(n28), .A0N(\REGF_MEM[8][1] ), .A1N(n28), .Y(
        n113) );
  OAI2BB2X1M U81 ( .B0(n224), .B1(n28), .A0N(\REGF_MEM[8][2] ), .A1N(n28), .Y(
        n114) );
  OAI2BB2X1M U82 ( .B0(n225), .B1(n28), .A0N(\REGF_MEM[8][3] ), .A1N(n28), .Y(
        n115) );
  OAI2BB2X1M U83 ( .B0(n226), .B1(n28), .A0N(\REGF_MEM[8][4] ), .A1N(n28), .Y(
        n116) );
  OAI2BB2X1M U84 ( .B0(n227), .B1(n28), .A0N(\REGF_MEM[8][5] ), .A1N(n28), .Y(
        n117) );
  OAI2BB2X1M U85 ( .B0(n228), .B1(n28), .A0N(\REGF_MEM[8][6] ), .A1N(n28), .Y(
        n118) );
  OAI2BB2X1M U86 ( .B0(n229), .B1(n28), .A0N(\REGF_MEM[8][7] ), .A1N(n28), .Y(
        n119) );
  OAI2BB2X1M U87 ( .B0(n222), .B1(n30), .A0N(\REGF_MEM[9][0] ), .A1N(n30), .Y(
        n120) );
  OAI2BB2X1M U88 ( .B0(n223), .B1(n30), .A0N(\REGF_MEM[9][1] ), .A1N(n30), .Y(
        n121) );
  OAI2BB2X1M U89 ( .B0(n224), .B1(n30), .A0N(\REGF_MEM[9][2] ), .A1N(n30), .Y(
        n122) );
  OAI2BB2X1M U90 ( .B0(n225), .B1(n30), .A0N(\REGF_MEM[9][3] ), .A1N(n30), .Y(
        n123) );
  OAI2BB2X1M U91 ( .B0(n226), .B1(n30), .A0N(\REGF_MEM[9][4] ), .A1N(n30), .Y(
        n124) );
  OAI2BB2X1M U92 ( .B0(n227), .B1(n30), .A0N(\REGF_MEM[9][5] ), .A1N(n30), .Y(
        n125) );
  OAI2BB2X1M U93 ( .B0(n228), .B1(n30), .A0N(\REGF_MEM[9][6] ), .A1N(n30), .Y(
        n126) );
  OAI2BB2X1M U94 ( .B0(n229), .B1(n30), .A0N(\REGF_MEM[9][7] ), .A1N(n30), .Y(
        n127) );
  OAI2BB2X1M U95 ( .B0(n222), .B1(n34), .A0N(\REGF_MEM[12][0] ), .A1N(n34), 
        .Y(n144) );
  OAI2BB2X1M U96 ( .B0(n223), .B1(n34), .A0N(\REGF_MEM[12][1] ), .A1N(n34), 
        .Y(n145) );
  OAI2BB2X1M U97 ( .B0(n224), .B1(n34), .A0N(\REGF_MEM[12][2] ), .A1N(n34), 
        .Y(n146) );
  OAI2BB2X1M U98 ( .B0(n225), .B1(n34), .A0N(\REGF_MEM[12][3] ), .A1N(n34), 
        .Y(n147) );
  OAI2BB2X1M U99 ( .B0(n226), .B1(n34), .A0N(\REGF_MEM[12][4] ), .A1N(n34), 
        .Y(n148) );
  OAI2BB2X1M U100 ( .B0(n227), .B1(n34), .A0N(\REGF_MEM[12][5] ), .A1N(n34), 
        .Y(n149) );
  OAI2BB2X1M U101 ( .B0(n228), .B1(n34), .A0N(\REGF_MEM[12][6] ), .A1N(n34), 
        .Y(n150) );
  OAI2BB2X1M U102 ( .B0(n229), .B1(n34), .A0N(\REGF_MEM[12][7] ), .A1N(n34), 
        .Y(n151) );
  OAI2BB2X1M U103 ( .B0(n222), .B1(n35), .A0N(\REGF_MEM[13][0] ), .A1N(n35), 
        .Y(n152) );
  OAI2BB2X1M U104 ( .B0(n223), .B1(n35), .A0N(\REGF_MEM[13][1] ), .A1N(n35), 
        .Y(n153) );
  OAI2BB2X1M U105 ( .B0(n224), .B1(n35), .A0N(\REGF_MEM[13][2] ), .A1N(n35), 
        .Y(n154) );
  OAI2BB2X1M U106 ( .B0(n225), .B1(n35), .A0N(\REGF_MEM[13][3] ), .A1N(n35), 
        .Y(n155) );
  OAI2BB2X1M U107 ( .B0(n226), .B1(n35), .A0N(\REGF_MEM[13][4] ), .A1N(n35), 
        .Y(n156) );
  OAI2BB2X1M U108 ( .B0(n227), .B1(n35), .A0N(\REGF_MEM[13][5] ), .A1N(n35), 
        .Y(n157) );
  OAI2BB2X1M U109 ( .B0(n228), .B1(n35), .A0N(\REGF_MEM[13][6] ), .A1N(n35), 
        .Y(n158) );
  OAI2BB2X1M U110 ( .B0(n229), .B1(n35), .A0N(\REGF_MEM[13][7] ), .A1N(n35), 
        .Y(n159) );
  OAI2BB2X1M U111 ( .B0(n222), .B1(n36), .A0N(\REGF_MEM[14][0] ), .A1N(n36), 
        .Y(n160) );
  OAI2BB2X1M U112 ( .B0(n223), .B1(n36), .A0N(\REGF_MEM[14][1] ), .A1N(n36), 
        .Y(n161) );
  OAI2BB2X1M U113 ( .B0(n224), .B1(n36), .A0N(\REGF_MEM[14][2] ), .A1N(n36), 
        .Y(n162) );
  OAI2BB2X1M U114 ( .B0(n225), .B1(n36), .A0N(\REGF_MEM[14][3] ), .A1N(n36), 
        .Y(n163) );
  OAI2BB2X1M U115 ( .B0(n226), .B1(n36), .A0N(\REGF_MEM[14][4] ), .A1N(n36), 
        .Y(n164) );
  OAI2BB2X1M U116 ( .B0(n227), .B1(n36), .A0N(\REGF_MEM[14][5] ), .A1N(n36), 
        .Y(n165) );
  OAI2BB2X1M U117 ( .B0(n228), .B1(n36), .A0N(\REGF_MEM[14][6] ), .A1N(n36), 
        .Y(n166) );
  OAI2BB2X1M U118 ( .B0(n229), .B1(n36), .A0N(\REGF_MEM[14][7] ), .A1N(n36), 
        .Y(n167) );
  OAI2BB2X1M U119 ( .B0(n222), .B1(n38), .A0N(\REGF_MEM[15][0] ), .A1N(n38), 
        .Y(n168) );
  OAI2BB2X1M U120 ( .B0(n223), .B1(n38), .A0N(\REGF_MEM[15][1] ), .A1N(n38), 
        .Y(n169) );
  OAI2BB2X1M U121 ( .B0(n224), .B1(n38), .A0N(\REGF_MEM[15][2] ), .A1N(n38), 
        .Y(n170) );
  OAI2BB2X1M U122 ( .B0(n225), .B1(n38), .A0N(\REGF_MEM[15][3] ), .A1N(n38), 
        .Y(n171) );
  OAI2BB2X1M U123 ( .B0(n226), .B1(n38), .A0N(\REGF_MEM[15][4] ), .A1N(n38), 
        .Y(n172) );
  OAI2BB2X1M U124 ( .B0(n227), .B1(n38), .A0N(\REGF_MEM[15][5] ), .A1N(n38), 
        .Y(n173) );
  OAI2BB2X1M U125 ( .B0(n228), .B1(n38), .A0N(\REGF_MEM[15][6] ), .A1N(n38), 
        .Y(n174) );
  OAI2BB2X1M U126 ( .B0(n229), .B1(n38), .A0N(\REGF_MEM[15][7] ), .A1N(n38), 
        .Y(n175) );
  OAI2BB2X1M U127 ( .B0(n222), .B1(n18), .A0N(REG2[0]), .A1N(n18), .Y(n64) );
  OAI2BB2X1M U128 ( .B0(n229), .B1(n18), .A0N(REG2[7]), .A1N(n18), .Y(n71) );
  OAI2BB2X1M U129 ( .B0(n227), .B1(n20), .A0N(REG3[5]), .A1N(n20), .Y(n77) );
  AO22X1M U130 ( .A0(RD_DATA[0]), .A1(n11), .B0(N43), .B1(n12), .Y(n39) );
  MX4X1M U131 ( .A(n5), .B(n3), .C(n4), .D(n2), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U132 ( .A(\REGF_MEM[8][0] ), .B(\REGF_MEM[9][0] ), .C(
        \REGF_MEM[10][0] ), .D(\REGF_MEM[11][0] ), .S0(N11), .S1(N12), .Y(n3)
         );
  MX4X1M U133 ( .A(\REGF_MEM[4][0] ), .B(\REGF_MEM[5][0] ), .C(
        \REGF_MEM[6][0] ), .D(\REGF_MEM[7][0] ), .S0(N11), .S1(N12), .Y(n4) );
  AO22X1M U134 ( .A0(RD_DATA[1]), .A1(n11), .B0(N42), .B1(n12), .Y(n40) );
  MX4X1M U135 ( .A(n9), .B(n7), .C(n8), .D(n6), .S0(N14), .S1(N13), .Y(N42) );
  MX4X1M U136 ( .A(\REGF_MEM[8][1] ), .B(\REGF_MEM[9][1] ), .C(
        \REGF_MEM[10][1] ), .D(\REGF_MEM[11][1] ), .S0(N11), .S1(N12), .Y(n7)
         );
  MX4X1M U137 ( .A(\REGF_MEM[12][1] ), .B(\REGF_MEM[13][1] ), .C(
        \REGF_MEM[14][1] ), .D(\REGF_MEM[15][1] ), .S0(n200), .S1(n198), .Y(n6) );
  AO22X1M U138 ( .A0(RD_DATA[2]), .A1(n11), .B0(N41), .B1(n12), .Y(n41) );
  MX4X1M U139 ( .A(n177), .B(n16), .C(n176), .D(n10), .S0(N14), .S1(N13), .Y(
        N41) );
  MX4XLM U140 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n200), 
        .S1(N12), .Y(n177) );
  MX4X1M U141 ( .A(\REGF_MEM[8][2] ), .B(\REGF_MEM[9][2] ), .C(
        \REGF_MEM[10][2] ), .D(\REGF_MEM[11][2] ), .S0(n200), .S1(N12), .Y(n16) );
  AO22X1M U142 ( .A0(RD_DATA[3]), .A1(n11), .B0(N40), .B1(n12), .Y(n42) );
  MX4X1M U143 ( .A(n181), .B(n179), .C(n180), .D(n178), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4XLM U144 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n200), 
        .S1(N12), .Y(n181) );
  MX4X1M U145 ( .A(\REGF_MEM[8][3] ), .B(\REGF_MEM[9][3] ), .C(
        \REGF_MEM[10][3] ), .D(\REGF_MEM[11][3] ), .S0(n200), .S1(N12), .Y(
        n179) );
  AO22X1M U146 ( .A0(RD_DATA[4]), .A1(n11), .B0(N39), .B1(n12), .Y(n43) );
  MX4X1M U147 ( .A(n185), .B(n183), .C(n184), .D(n182), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4XLM U148 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n201), 
        .S1(N12), .Y(n185) );
  MX4X1M U149 ( .A(\REGF_MEM[8][4] ), .B(\REGF_MEM[9][4] ), .C(
        \REGF_MEM[10][4] ), .D(\REGF_MEM[11][4] ), .S0(n200), .S1(N12), .Y(
        n183) );
  AO22X1M U150 ( .A0(RD_DATA[5]), .A1(n11), .B0(N38), .B1(n12), .Y(n44) );
  MX4X1M U151 ( .A(n189), .B(n187), .C(n188), .D(n186), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4XLM U152 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n201), 
        .S1(n198), .Y(n189) );
  MX4X1M U153 ( .A(\REGF_MEM[8][5] ), .B(\REGF_MEM[9][5] ), .C(
        \REGF_MEM[10][5] ), .D(\REGF_MEM[11][5] ), .S0(n201), .S1(n198), .Y(
        n187) );
  AO22X1M U154 ( .A0(RD_DATA[6]), .A1(n11), .B0(N37), .B1(n12), .Y(n45) );
  MX4X1M U155 ( .A(n193), .B(n191), .C(n192), .D(n190), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U156 ( .A(\REGF_MEM[8][6] ), .B(\REGF_MEM[9][6] ), .C(
        \REGF_MEM[10][6] ), .D(\REGF_MEM[11][6] ), .S0(n201), .S1(n198), .Y(
        n191) );
  MX4X1M U157 ( .A(\REGF_MEM[4][6] ), .B(\REGF_MEM[5][6] ), .C(
        \REGF_MEM[6][6] ), .D(\REGF_MEM[7][6] ), .S0(n201), .S1(n198), .Y(n192) );
  AO22X1M U158 ( .A0(RD_DATA[7]), .A1(n11), .B0(N36), .B1(n12), .Y(n46) );
  MX4X1M U159 ( .A(n197), .B(n195), .C(n196), .D(n194), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U160 ( .A(\REGF_MEM[8][7] ), .B(\REGF_MEM[9][7] ), .C(
        \REGF_MEM[10][7] ), .D(\REGF_MEM[11][7] ), .S0(n201), .S1(n198), .Y(
        n195) );
  MX4X1M U161 ( .A(\REGF_MEM[4][7] ), .B(\REGF_MEM[5][7] ), .C(
        \REGF_MEM[6][7] ), .D(\REGF_MEM[7][7] ), .S0(n201), .S1(n198), .Y(n196) );
  MX4XLM U162 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n200), 
        .S1(N12), .Y(n9) );
  MX4X1M U163 ( .A(\REGF_MEM[4][1] ), .B(\REGF_MEM[5][1] ), .C(
        \REGF_MEM[6][1] ), .D(\REGF_MEM[7][1] ), .S0(n200), .S1(N12), .Y(n8)
         );
  MX4X1M U164 ( .A(\REGF_MEM[4][2] ), .B(\REGF_MEM[5][2] ), .C(
        \REGF_MEM[6][2] ), .D(\REGF_MEM[7][2] ), .S0(n200), .S1(N12), .Y(n176)
         );
  MX4X1M U165 ( .A(\REGF_MEM[4][3] ), .B(\REGF_MEM[5][3] ), .C(
        \REGF_MEM[6][3] ), .D(\REGF_MEM[7][3] ), .S0(n200), .S1(N12), .Y(n180)
         );
  MX4X1M U166 ( .A(\REGF_MEM[4][4] ), .B(\REGF_MEM[5][4] ), .C(
        \REGF_MEM[6][4] ), .D(\REGF_MEM[7][4] ), .S0(n200), .S1(N12), .Y(n184)
         );
  MX4X1M U167 ( .A(\REGF_MEM[4][5] ), .B(\REGF_MEM[5][5] ), .C(
        \REGF_MEM[6][5] ), .D(\REGF_MEM[7][5] ), .S0(n201), .S1(n198), .Y(n188) );
  MX4X1M U168 ( .A(\REGF_MEM[12][0] ), .B(\REGF_MEM[13][0] ), .C(
        \REGF_MEM[14][0] ), .D(\REGF_MEM[15][0] ), .S0(n200), .S1(n198), .Y(n2) );
  MX4X1M U169 ( .A(\REGF_MEM[12][2] ), .B(\REGF_MEM[13][2] ), .C(
        \REGF_MEM[14][2] ), .D(\REGF_MEM[15][2] ), .S0(n200), .S1(N12), .Y(n10) );
  MX4X1M U170 ( .A(\REGF_MEM[12][3] ), .B(\REGF_MEM[13][3] ), .C(
        \REGF_MEM[14][3] ), .D(\REGF_MEM[15][3] ), .S0(n200), .S1(N12), .Y(
        n178) );
  MX4X1M U171 ( .A(\REGF_MEM[12][4] ), .B(\REGF_MEM[13][4] ), .C(
        \REGF_MEM[14][4] ), .D(\REGF_MEM[15][4] ), .S0(n200), .S1(N12), .Y(
        n182) );
  MX4X1M U172 ( .A(\REGF_MEM[12][5] ), .B(\REGF_MEM[13][5] ), .C(
        \REGF_MEM[14][5] ), .D(\REGF_MEM[15][5] ), .S0(n201), .S1(n198), .Y(
        n186) );
  MX4X1M U173 ( .A(\REGF_MEM[12][6] ), .B(\REGF_MEM[13][6] ), .C(
        \REGF_MEM[14][6] ), .D(\REGF_MEM[15][6] ), .S0(n201), .S1(n198), .Y(
        n190) );
  MX4X1M U174 ( .A(\REGF_MEM[12][7] ), .B(\REGF_MEM[13][7] ), .C(
        \REGF_MEM[14][7] ), .D(\REGF_MEM[15][7] ), .S0(n201), .S1(n198), .Y(
        n194) );
  INVX2M U175 ( .A(N12), .Y(n203) );
  INVX2M U176 ( .A(N11), .Y(n202) );
  OAI2BB2X1M U177 ( .B0(n223), .B1(n18), .A0N(REG2[1]), .A1N(n18), .Y(n65) );
  OAI2BB2X1M U178 ( .B0(n224), .B1(n18), .A0N(REG2[2]), .A1N(n18), .Y(n66) );
  OAI2BB2X1M U179 ( .B0(n225), .B1(n18), .A0N(REG2[3]), .A1N(n18), .Y(n67) );
  OAI2BB2X1M U180 ( .B0(n226), .B1(n18), .A0N(REG2[4]), .A1N(n18), .Y(n68) );
  OAI2BB2X1M U181 ( .B0(n227), .B1(n18), .A0N(REG2[5]), .A1N(n18), .Y(n69) );
  OAI2BB2X1M U182 ( .B0(n228), .B1(n18), .A0N(REG2[6]), .A1N(n18), .Y(n70) );
  OAI2BB2X1M U183 ( .B0(n222), .B1(n20), .A0N(REG3[0]), .A1N(n20), .Y(n72) );
  OAI2BB2X1M U184 ( .B0(n223), .B1(n20), .A0N(REG3[1]), .A1N(n20), .Y(n73) );
  OAI2BB2X1M U185 ( .B0(n224), .B1(n20), .A0N(REG3[2]), .A1N(n20), .Y(n74) );
  OAI2BB2X1M U186 ( .B0(n225), .B1(n20), .A0N(REG3[3]), .A1N(n20), .Y(n75) );
  OAI2BB2X1M U187 ( .B0(n226), .B1(n20), .A0N(REG3[4]), .A1N(n20), .Y(n76) );
  OAI2BB2X1M U188 ( .B0(n228), .B1(n20), .A0N(REG3[6]), .A1N(n20), .Y(n78) );
  OAI2BB2X1M U189 ( .B0(n229), .B1(n20), .A0N(REG3[7]), .A1N(n20), .Y(n79) );
  OAI2BB2X1M U190 ( .B0(n222), .B1(n21), .A0N(\REGF_MEM[4][0] ), .A1N(n21), 
        .Y(n80) );
  OAI2BB2X1M U191 ( .B0(n223), .B1(n21), .A0N(\REGF_MEM[4][1] ), .A1N(n21), 
        .Y(n81) );
  OAI2BB2X1M U192 ( .B0(n224), .B1(n21), .A0N(\REGF_MEM[4][2] ), .A1N(n21), 
        .Y(n82) );
  OAI2BB2X1M U193 ( .B0(n225), .B1(n21), .A0N(\REGF_MEM[4][3] ), .A1N(n21), 
        .Y(n83) );
  OAI2BB2X1M U194 ( .B0(n226), .B1(n21), .A0N(\REGF_MEM[4][4] ), .A1N(n21), 
        .Y(n84) );
  OAI2BB2X1M U195 ( .B0(n227), .B1(n21), .A0N(\REGF_MEM[4][5] ), .A1N(n21), 
        .Y(n85) );
  OAI2BB2X1M U196 ( .B0(n228), .B1(n21), .A0N(\REGF_MEM[4][6] ), .A1N(n21), 
        .Y(n86) );
  OAI2BB2X1M U197 ( .B0(n229), .B1(n21), .A0N(\REGF_MEM[4][7] ), .A1N(n21), 
        .Y(n87) );
  OAI2BB2X1M U198 ( .B0(n222), .B1(n23), .A0N(\REGF_MEM[5][0] ), .A1N(n23), 
        .Y(n88) );
  OAI2BB2X1M U199 ( .B0(n223), .B1(n23), .A0N(\REGF_MEM[5][1] ), .A1N(n23), 
        .Y(n89) );
  OAI2BB2X1M U200 ( .B0(n224), .B1(n23), .A0N(\REGF_MEM[5][2] ), .A1N(n23), 
        .Y(n90) );
  OAI2BB2X1M U201 ( .B0(n225), .B1(n23), .A0N(\REGF_MEM[5][3] ), .A1N(n23), 
        .Y(n91) );
  OAI2BB2X1M U202 ( .B0(n226), .B1(n23), .A0N(\REGF_MEM[5][4] ), .A1N(n23), 
        .Y(n92) );
  OAI2BB2X1M U203 ( .B0(n227), .B1(n23), .A0N(\REGF_MEM[5][5] ), .A1N(n23), 
        .Y(n93) );
  OAI2BB2X1M U204 ( .B0(n228), .B1(n23), .A0N(\REGF_MEM[5][6] ), .A1N(n23), 
        .Y(n94) );
  OAI2BB2X1M U205 ( .B0(n229), .B1(n23), .A0N(\REGF_MEM[5][7] ), .A1N(n23), 
        .Y(n95) );
  OAI2BB2X1M U206 ( .B0(n222), .B1(n24), .A0N(\REGF_MEM[6][0] ), .A1N(n24), 
        .Y(n96) );
  OAI2BB2X1M U207 ( .B0(n223), .B1(n24), .A0N(\REGF_MEM[6][1] ), .A1N(n24), 
        .Y(n97) );
  OAI2BB2X1M U208 ( .B0(n224), .B1(n24), .A0N(\REGF_MEM[6][2] ), .A1N(n24), 
        .Y(n98) );
  OAI2BB2X1M U209 ( .B0(n225), .B1(n24), .A0N(\REGF_MEM[6][3] ), .A1N(n24), 
        .Y(n99) );
  OAI2BB2X1M U210 ( .B0(n226), .B1(n24), .A0N(\REGF_MEM[6][4] ), .A1N(n24), 
        .Y(n100) );
  OAI2BB2X1M U211 ( .B0(n227), .B1(n24), .A0N(\REGF_MEM[6][5] ), .A1N(n24), 
        .Y(n101) );
  OAI2BB2X1M U212 ( .B0(n228), .B1(n24), .A0N(\REGF_MEM[6][6] ), .A1N(n24), 
        .Y(n102) );
  OAI2BB2X1M U213 ( .B0(n229), .B1(n24), .A0N(\REGF_MEM[6][7] ), .A1N(n24), 
        .Y(n103) );
  OAI2BB2X1M U214 ( .B0(n222), .B1(n27), .A0N(\REGF_MEM[7][0] ), .A1N(n27), 
        .Y(n104) );
  OAI2BB2X1M U215 ( .B0(n223), .B1(n27), .A0N(\REGF_MEM[7][1] ), .A1N(n27), 
        .Y(n105) );
  OAI2BB2X1M U216 ( .B0(n224), .B1(n27), .A0N(\REGF_MEM[7][2] ), .A1N(n27), 
        .Y(n106) );
  OAI2BB2X1M U217 ( .B0(n225), .B1(n27), .A0N(\REGF_MEM[7][3] ), .A1N(n27), 
        .Y(n107) );
  OAI2BB2X1M U218 ( .B0(n226), .B1(n27), .A0N(\REGF_MEM[7][4] ), .A1N(n27), 
        .Y(n108) );
  OAI2BB2X1M U219 ( .B0(n227), .B1(n27), .A0N(\REGF_MEM[7][5] ), .A1N(n27), 
        .Y(n109) );
  OAI2BB2X1M U220 ( .B0(n228), .B1(n27), .A0N(\REGF_MEM[7][6] ), .A1N(n27), 
        .Y(n110) );
  OAI2BB2X1M U221 ( .B0(n229), .B1(n27), .A0N(\REGF_MEM[7][7] ), .A1N(n27), 
        .Y(n111) );
  OAI2BB2X1M U222 ( .B0(n13), .B1(n222), .A0N(REG0[0]), .A1N(n13), .Y(n48) );
  OAI2BB2X1M U223 ( .B0(n13), .B1(n223), .A0N(REG0[1]), .A1N(n13), .Y(n49) );
  OAI2BB2X1M U224 ( .B0(n13), .B1(n224), .A0N(REG0[2]), .A1N(n13), .Y(n50) );
  OAI2BB2X1M U225 ( .B0(n13), .B1(n225), .A0N(REG0[3]), .A1N(n13), .Y(n51) );
  OAI2BB2X1M U226 ( .B0(n13), .B1(n226), .A0N(REG0[4]), .A1N(n13), .Y(n52) );
  MX2XLM U227 ( .A(REG1[1]), .B(WR_DATA[1]), .S0(n1), .Y(n57) );
  MX2XLM U228 ( .A(REG1[2]), .B(WR_DATA[2]), .S0(n1), .Y(n58) );
  MX2XLM U229 ( .A(REG1[3]), .B(WR_DATA[3]), .S0(n1), .Y(n59) );
  MX2XLM U230 ( .A(REG1[4]), .B(WR_DATA[4]), .S0(n1), .Y(n60) );
  MX2XLM U231 ( .A(REG1[5]), .B(WR_DATA[5]), .S0(n1), .Y(n61) );
  AO21XLM U232 ( .A0(RD_DATA_VLD), .A1(n11), .B0(n12), .Y(n47) );
  MX4XLM U233 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n201), 
        .S1(n198), .Y(n197) );
  MX4XLM U234 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n201), 
        .S1(N12), .Y(n5) );
  MX4XLM U235 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n201), 
        .S1(n198), .Y(n193) );
  MX2XLM U236 ( .A(REG1[6]), .B(WR_DATA[6]), .S0(n1), .Y(n62) );
  MX2XLM U237 ( .A(REG1[0]), .B(WR_DATA[0]), .S0(n1), .Y(n56) );
  MX2XLM U238 ( .A(REG1[7]), .B(WR_DATA[7]), .S0(n1), .Y(n63) );
  MX2XLM U239 ( .A(REG0[7]), .B(WR_DATA[7]), .S0(n219), .Y(n55) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVXLM U2 ( .A(B[2]), .Y(n7) );
  INVXLM U3 ( .A(B[3]), .Y(n6) );
  INVXLM U4 ( .A(B[4]), .Y(n5) );
  INVXLM U5 ( .A(B[5]), .Y(n4) );
  INVXLM U6 ( .A(B[1]), .Y(n8) );
  NAND2X2M U7 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U8 ( .A(A[0]), .Y(n1) );
  INVXLM U9 ( .A(B[6]), .Y(n3) );
  INVXLM U10 ( .A(B[0]), .Y(n9) );
  INVXLM U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;

  wire   [8:1] carry;

  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_0 ( .A(A[0]), .B(B[0]), .CI(1'b0), .CO(carry[1]), .S(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  XNOR2X2M U3 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  NAND2X2M U4 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U5 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n8) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n14, n15, n13, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n8), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n5), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n7), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n6), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  CLKXOR2X2M U10 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  INVX2M U11 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U12 ( .A(\ab[0][6] ), .Y(n22) );
  INVX2M U13 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U14 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U15 ( .A(\ab[0][3] ), .Y(n19) );
  AND2X2M U16 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n11) );
  AND2X2M U17 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n12) );
  CLKXOR2X2M U18 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U19 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U20 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U21 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  AND2X2M U23 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  AND2X2M U24 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n14) );
  AND2X2M U25 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n15) );
  CLKXOR2X2M U26 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  XNOR2X2M U27 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U28 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U29 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  CLKXOR2X2M U30 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XNOR2X2M U31 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U32 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U33 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U34 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  INVX2M U36 ( .A(A[1]), .Y(n38) );
  XNOR2X2M U37 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U38 ( .A(A[3]), .Y(n36) );
  INVX2M U39 ( .A(A[4]), .Y(n35) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[6]), .Y(n33) );
  INVX2M U42 ( .A(A[5]), .Y(n34) );
  INVXLM U43 ( .A(B[3]), .Y(n28) );
  INVXLM U44 ( .A(B[4]), .Y(n27) );
  INVXLM U45 ( .A(B[5]), .Y(n26) );
  INVX2M U46 ( .A(A[0]), .Y(n39) );
  INVXLM U47 ( .A(B[2]), .Y(n29) );
  INVXLM U48 ( .A(B[1]), .Y(n30) );
  INVXLM U49 ( .A(B[6]), .Y(n25) );
  INVXLM U50 ( .A(B[0]), .Y(n31) );
  INVXLM U51 ( .A(B[7]), .Y(n24) );
  INVXLM U52 ( .A(A[7]), .Y(n32) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_DW_div_uns_1 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n103, \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] ,
         \u_div/SumTmp[1][2] , \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] ,
         \u_div/SumTmp[1][5] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][1] , \u_div/SumTmp[5][2] ,
         \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] ,
         \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] ,
         \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] ,
         \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] ,
         \u_div/CryTmp[7][1] , \u_div/PartRem[1][1] , \u_div/PartRem[1][2] ,
         \u_div/PartRem[1][3] , \u_div/PartRem[1][4] , \u_div/PartRem[1][5] ,
         \u_div/PartRem[1][6] , \u_div/PartRem[1][7] , \u_div/PartRem[2][3] ,
         \u_div/PartRem[2][4] , \u_div/PartRem[2][5] , \u_div/PartRem[2][6] ,
         \u_div/PartRem[3][1] , \u_div/PartRem[4][1] , \u_div/PartRem[5][1] ,
         \u_div/PartRem[6][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n44, n45, n46, n47, n48, n49, n50, n52, n53, n54, n55, n56,
         n57, n58, n59, n61, n62, n63, n64, n65, n66, n67, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102;
  wire   [7:0] \u_div/BInv ;

  ADDFHX8M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), 
        .S(\u_div/SumTmp[5][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(
        \u_div/BInv [6]), .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), 
        .S(\u_div/SumTmp[1][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), 
        .S(\u_div/SumTmp[1][4] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), 
        .S(\u_div/SumTmp[1][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(
        \u_div/BInv [4]), .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(
        \u_div/BInv [5]), .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_4  ( .A(n58), .B(\u_div/BInv [4]), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_3  ( .A(n55), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(
        \u_div/BInv [7]), .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFHX4M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/CryTmp[6][1] ), .B(
        \u_div/BInv [1]), .CI(n48), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_2_3  ( .A(n54), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_2  ( .A(n40), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), 
        .S(\u_div/SumTmp[2][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_2  ( .A(n52), .B(\u_div/BInv [2]), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(
        \u_div/BInv [1]), .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), 
        .S(\u_div/SumTmp[3][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_5  ( .A(n50), .B(\u_div/BInv [5]), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_2_4  ( .A(n56), .B(\u_div/BInv [4]), .CI(
        \u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_4_3  ( .A(n59), .B(\u_div/BInv [3]), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(
        \u_div/BInv [3]), .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] )
         );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_1  ( .A(n62), .B(\u_div/BInv [1]), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(
        \u_div/BInv [2]), .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] )
         );
  ADDFX2M \u_div/u_fa_PartRem_0_0_0  ( .A(a[0]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[0][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_0  ( .A(a[2]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[2][1] ), .S(\u_div/SumTmp[2][0] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_0  ( .A(a[1]), .B(\u_div/BInv [0]), .CI(1'b1), .CO(\u_div/CryTmp[1][1] ), .S(\u_div/SumTmp[1][0] ) );
  NAND2BX4M U1 ( .AN(b[7]), .B(\u_div/CryTmp[1][7] ), .Y(n102) );
  CLKNAND2X8M U2 ( .A(\u_div/SumTmp[2][0] ), .B(n30), .Y(n31) );
  NAND2X2M U3 ( .A(\u_div/SumTmp[2][1] ), .B(quotient[2]), .Y(n39) );
  MX2X1M U4 ( .A(\u_div/SumTmp[1][1] ), .B(n62), .S0(n102), .Y(
        \u_div/PartRem[1][2] ) );
  NAND2X3M U5 ( .A(\u_div/SumTmp[6][0] ), .B(n103), .Y(n37) );
  NAND3X4M U6 ( .A(n16), .B(n17), .C(n18), .Y(\u_div/CryTmp[4][2] ) );
  CLKINVX2M U7 ( .A(n98), .Y(quotient[5]) );
  NAND2X2M U8 ( .A(\u_div/BInv [2]), .B(\u_div/CryTmp[4][2] ), .Y(n22) );
  NAND2X6M U9 ( .A(n36), .B(n37), .Y(\u_div/PartRem[6][1] ) );
  NAND2X6M U10 ( .A(a[6]), .B(n35), .Y(n36) );
  NAND2BX8M U11 ( .AN(b[6]), .B(\u_div/BInv [7]), .Y(n89) );
  INVX10M U12 ( .A(b[7]), .Y(\u_div/BInv [7]) );
  NAND2X6M U13 ( .A(n96), .B(n95), .Y(n94) );
  NAND2X2M U14 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/BInv [1]), .Y(n16) );
  NOR2BX8M U15 ( .AN(\u_div/CryTmp[1][7] ), .B(b[7]), .Y(n93) );
  NAND2X3M U16 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/CryTmp[4][1] ), .Y(n17)
         );
  CLKINVX2M U17 ( .A(n40), .Y(n74) );
  MXI2X3M U18 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(n86), .Y(n85) );
  NAND2X6M U19 ( .A(n31), .B(n32), .Y(n62) );
  INVX4M U20 ( .A(b[3]), .Y(\u_div/BInv [3]) );
  INVX4M U21 ( .A(n89), .Y(n100) );
  INVX4M U22 ( .A(b[0]), .Y(\u_div/BInv [0]) );
  NAND2X4M U23 ( .A(n28), .B(n29), .Y(\u_div/PartRem[4][1] ) );
  NAND2X2M U24 ( .A(n33), .B(n34), .Y(n52) );
  MX2X2M U25 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(n53) );
  MX2X2M U26 ( .A(n52), .B(\u_div/SumTmp[3][2] ), .S0(quotient[3]), .Y(n54) );
  CLKNAND2X2M U27 ( .A(\u_div/CryTmp[1][6] ), .B(\u_div/BInv [6]), .Y(n25) );
  NAND2X2M U28 ( .A(\u_div/CryTmp[1][6] ), .B(\u_div/PartRem[2][6] ), .Y(n24)
         );
  NAND2X2M U29 ( .A(n99), .B(n100), .Y(n82) );
  NOR2X2M U30 ( .A(b[5]), .B(b[4]), .Y(n99) );
  NAND2X2M U31 ( .A(n69), .B(\u_div/BInv [3]), .Y(n79) );
  INVX2M U32 ( .A(n82), .Y(n69) );
  INVX2M U33 ( .A(n70), .Y(\u_div/PartRem[2][6] ) );
  MXI2X1M U34 ( .A(n74), .B(n84), .S0(quotient[1]), .Y(\u_div/PartRem[1][3] )
         );
  INVX2M U35 ( .A(n49), .Y(n41) );
  OR2X2M U36 ( .A(\u_div/BInv [0]), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  CLKINVX8M U37 ( .A(n79), .Y(n96) );
  INVX2M U38 ( .A(n102), .Y(quotient[1]) );
  INVX2M U39 ( .A(n41), .Y(quotient[2]) );
  AND2X2M U40 ( .A(\u_div/CryTmp[3][5] ), .B(n101), .Y(quotient[3]) );
  INVX2M U41 ( .A(n87), .Y(n101) );
  BUFX2M U42 ( .A(n103), .Y(quotient[6]) );
  NOR2X4M U43 ( .A(n88), .B(n87), .Y(n86) );
  CLKNAND2X4M U44 ( .A(\u_div/PartRem[1][1] ), .B(\u_div/CryTmp[0][1] ), .Y(n6) );
  CLKNAND2X4M U45 ( .A(\u_div/PartRem[1][1] ), .B(\u_div/BInv [1]), .Y(n7) );
  MXI2X6M U46 ( .A(n91), .B(n92), .S0(n93), .Y(\u_div/PartRem[1][1] ) );
  INVX4M U47 ( .A(b[2]), .Y(\u_div/BInv [2]) );
  OR2X1M U48 ( .A(n83), .B(n82), .Y(n1) );
  CLKAND2X2M U49 ( .A(n96), .B(\u_div/BInv [2]), .Y(n2) );
  MX2XLM U50 ( .A(n48), .B(\u_div/SumTmp[6][1] ), .S0(n103), .Y(n3) );
  XNOR2XLM U51 ( .A(n23), .B(\u_div/CryTmp[1][6] ), .Y(n4) );
  INVX2M U52 ( .A(n1), .Y(quotient[4]) );
  CLKXOR2X2M U53 ( .A(\u_div/BInv [0]), .B(a[5]), .Y(n5) );
  NAND2X2M U54 ( .A(\u_div/CryTmp[0][1] ), .B(\u_div/BInv [1]), .Y(n8) );
  NAND3X2M U55 ( .A(n8), .B(n7), .C(n6), .Y(\u_div/CryTmp[0][2] ) );
  INVX8M U56 ( .A(b[1]), .Y(\u_div/BInv [1]) );
  XOR2XLM U57 ( .A(\u_div/BInv [2]), .B(n3), .Y(n9) );
  XOR2XLM U58 ( .A(n9), .B(\u_div/CryTmp[5][2] ), .Y(\u_div/SumTmp[5][2] ) );
  NAND2X4M U59 ( .A(\u_div/CryTmp[5][2] ), .B(n3), .Y(n10) );
  NAND2X4M U60 ( .A(\u_div/CryTmp[5][2] ), .B(\u_div/BInv [2]), .Y(n11) );
  CLKNAND2X2M U61 ( .A(n3), .B(\u_div/BInv [2]), .Y(n12) );
  NAND3X4M U62 ( .A(n12), .B(n11), .C(n10), .Y(\u_div/CryTmp[5][3] ) );
  INVX2M U63 ( .A(\u_div/CryTmp[5][3] ), .Y(n80) );
  NAND2XLM U64 ( .A(\u_div/CryTmp[5][3] ), .B(n96), .Y(n98) );
  NAND2X2M U65 ( .A(n3), .B(n13), .Y(n14) );
  NAND2X1M U66 ( .A(\u_div/SumTmp[5][2] ), .B(quotient[5]), .Y(n15) );
  NAND2X2M U67 ( .A(n14), .B(n15), .Y(n59) );
  CLKINVX2M U68 ( .A(quotient[5]), .Y(n13) );
  XOR3XLM U69 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/BInv [1]), .C(
        \u_div/CryTmp[4][1] ), .Y(\u_div/SumTmp[4][1] ) );
  NAND2XLM U70 ( .A(\u_div/BInv [1]), .B(\u_div/CryTmp[4][1] ), .Y(n18) );
  XOR2XLM U71 ( .A(n57), .B(\u_div/BInv [2]), .Y(n19) );
  XOR2XLM U72 ( .A(n19), .B(\u_div/CryTmp[4][2] ), .Y(\u_div/SumTmp[4][2] ) );
  NAND2XLM U73 ( .A(n57), .B(\u_div/BInv [2]), .Y(n20) );
  NAND2X1M U74 ( .A(n57), .B(\u_div/CryTmp[4][2] ), .Y(n21) );
  NAND3X2M U75 ( .A(n20), .B(n21), .C(n22), .Y(\u_div/CryTmp[4][3] ) );
  XOR2XLM U76 ( .A(\u_div/BInv [6]), .B(\u_div/PartRem[2][6] ), .Y(n23) );
  NAND2X2M U77 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/BInv [6]), .Y(n26) );
  NAND3X4M U78 ( .A(n26), .B(n25), .C(n24), .Y(\u_div/CryTmp[1][7] ) );
  NAND2X4M U79 ( .A(\u_div/SumTmp[4][0] ), .B(n27), .Y(n28) );
  NAND2X2M U80 ( .A(a[4]), .B(n61), .Y(n29) );
  INVX2M U81 ( .A(n61), .Y(n27) );
  XNOR2X1M U82 ( .A(\u_div/BInv [0]), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  CLKNAND2X4M U83 ( .A(a[2]), .B(n63), .Y(n32) );
  INVX4M U84 ( .A(n63), .Y(n30) );
  NAND2XLM U85 ( .A(\u_div/PartRem[5][1] ), .B(n1), .Y(n33) );
  NAND2X1M U86 ( .A(\u_div/SumTmp[4][1] ), .B(quotient[4]), .Y(n34) );
  INVX4M U87 ( .A(n103), .Y(n35) );
  NAND2XLM U88 ( .A(\u_div/PartRem[3][1] ), .B(n41), .Y(n38) );
  NAND2X2M U89 ( .A(n38), .B(n39), .Y(n40) );
  MXI2X6M U90 ( .A(n65), .B(n64), .S0(n94), .Y(n48) );
  INVX4M U91 ( .A(n85), .Y(\u_div/PartRem[3][1] ) );
  INVX1M U92 ( .A(\u_div/CryTmp[2][6] ), .Y(n90) );
  OR2X2M U93 ( .A(n83), .B(n82), .Y(n61) );
  MXI2X4M U94 ( .A(n77), .B(n5), .S0(n78), .Y(\u_div/PartRem[5][1] ) );
  CLKNAND2X2M U95 ( .A(\u_div/CryTmp[2][2] ), .B(n53), .Y(n45) );
  INVX2M U96 ( .A(\u_div/CryTmp[4][4] ), .Y(n83) );
  NAND2X1M U97 ( .A(n53), .B(\u_div/BInv [2]), .Y(n47) );
  MXI2XLM U98 ( .A(n53), .B(\u_div/SumTmp[2][2] ), .S0(quotient[2]), .Y(n73)
         );
  NAND2X4M U99 ( .A(\u_div/CryTmp[6][2] ), .B(n2), .Y(n97) );
  INVX4M U100 ( .A(n97), .Y(n103) );
  MX2X1M U101 ( .A(\u_div/SumTmp[5][1] ), .B(\u_div/PartRem[6][1] ), .S0(n98), 
        .Y(n57) );
  MX2XLM U102 ( .A(n57), .B(\u_div/SumTmp[4][2] ), .S0(quotient[4]), .Y(n55)
         );
  NOR2X4M U103 ( .A(n80), .B(n79), .Y(n78) );
  CLKINVX4M U104 ( .A(\u_div/CryTmp[3][5] ), .Y(n88) );
  XOR2XLM U105 ( .A(\u_div/BInv [2]), .B(n53), .Y(n44) );
  XOR2XLM U106 ( .A(n44), .B(\u_div/CryTmp[2][2] ), .Y(\u_div/SumTmp[2][2] )
         );
  CLKNAND2X2M U107 ( .A(\u_div/CryTmp[2][2] ), .B(\u_div/BInv [2]), .Y(n46) );
  NAND3X2M U108 ( .A(n47), .B(n46), .C(n45), .Y(\u_div/CryTmp[2][3] ) );
  XOR2X1M U109 ( .A(\u_div/BInv [0]), .B(a[7]), .Y(n65) );
  OR2X4M U110 ( .A(n89), .B(n90), .Y(n63) );
  AND2X1M U111 ( .A(\u_div/CryTmp[2][6] ), .B(n100), .Y(n49) );
  XNOR2XLM U112 ( .A(\u_div/BInv [0]), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  INVXLM U113 ( .A(a[5]), .Y(n77) );
  NAND2BX1M U114 ( .AN(\u_div/BInv [0]), .B(n67), .Y(\u_div/CryTmp[6][1] ) );
  NAND2BX1M U115 ( .AN(\u_div/BInv [0]), .B(n66), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U116 ( .A(n71), .Y(\u_div/PartRem[2][5] ) );
  MX2XLM U117 ( .A(n59), .B(\u_div/SumTmp[4][3] ), .S0(quotient[4]), .Y(n58)
         );
  MXI2XLM U118 ( .A(n54), .B(\u_div/SumTmp[2][3] ), .S0(quotient[2]), .Y(n72)
         );
  MXI2XLM U119 ( .A(n56), .B(\u_div/SumTmp[2][4] ), .S0(quotient[2]), .Y(n71)
         );
  MXI2XLM U120 ( .A(n50), .B(\u_div/SumTmp[2][5] ), .S0(quotient[2]), .Y(n70)
         );
  MX2XLM U121 ( .A(n58), .B(\u_div/SumTmp[3][4] ), .S0(quotient[3]), .Y(n50)
         );
  INVX2M U122 ( .A(a[7]), .Y(n64) );
  MXI2X1M U123 ( .A(n73), .B(n81), .S0(quotient[1]), .Y(\u_div/PartRem[1][4] )
         );
  INVX2M U124 ( .A(\u_div/SumTmp[1][3] ), .Y(n81) );
  MXI2X1M U125 ( .A(n71), .B(n75), .S0(quotient[1]), .Y(\u_div/PartRem[1][6] )
         );
  INVX2M U126 ( .A(\u_div/SumTmp[1][5] ), .Y(n75) );
  MX2XLM U127 ( .A(n55), .B(\u_div/SumTmp[3][3] ), .S0(quotient[3]), .Y(n56)
         );
  AND2X1M U128 ( .A(n95), .B(n96), .Y(quotient[7]) );
  INVX2M U129 ( .A(a[3]), .Y(n66) );
  INVX2M U130 ( .A(a[6]), .Y(n67) );
  INVX2M U131 ( .A(n73), .Y(\u_div/PartRem[2][3] ) );
  INVX2M U132 ( .A(n72), .Y(\u_div/PartRem[2][4] ) );
  MXI2X1M U133 ( .A(n72), .B(n76), .S0(quotient[1]), .Y(\u_div/PartRem[1][5] )
         );
  INVX2M U134 ( .A(\u_div/SumTmp[1][4] ), .Y(n76) );
  INVX2M U135 ( .A(\u_div/SumTmp[1][2] ), .Y(n84) );
  OR2X1M U136 ( .A(\u_div/BInv [0]), .B(a[5]), .Y(\u_div/CryTmp[5][1] ) );
  OR2X1M U137 ( .A(\u_div/BInv [0]), .B(a[4]), .Y(\u_div/CryTmp[4][1] ) );
  MXI2XLM U138 ( .A(n70), .B(n4), .S0(quotient[1]), .Y(\u_div/PartRem[1][7] )
         );
  XNOR2XLM U139 ( .A(\u_div/BInv [0]), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  NAND2XLM U140 ( .A(n100), .B(\u_div/BInv [5]), .Y(n87) );
  INVX2M U141 ( .A(\u_div/SumTmp[1][0] ), .Y(n92) );
  INVX2M U142 ( .A(a[1]), .Y(n91) );
  CLKINVX1M U143 ( .A(b[4]), .Y(\u_div/BInv [4]) );
  CLKINVX1M U144 ( .A(b[5]), .Y(\u_div/BInv [5]) );
  AND3X6M U145 ( .A(\u_div/CryTmp[7][1] ), .B(\u_div/BInv [2]), .C(
        \u_div/BInv [1]), .Y(n95) );
  INVXLM U146 ( .A(b[6]), .Y(\u_div/BInv [6]) );
endmodule


module ALU ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n36, n43, n44, n45, n46, n47, n48, n54, n55, n56, n60, n61,
         n62, n66, n67, n68, n72, n73, n74, n78, n79, n80, n83, n84, n85, n86,
         n87, n88, n89, n90, n92, n101, n103, n104, n106, n107, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n35, n37, n38, n39,
         n40, n41, n42, n49, n50, n51, n52, n53, n57, n58, n59, n63, n64, n65,
         n69, n70, n71, n75, n76, n77, n81, n82, n91, n93, n94, n95, n96, n97,
         n98, n99, n100, n102, n105, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167;
  wire   [15:0] ALU_OUT_Comb;

  ALU_DW01_sub_0 sub_46 ( .A({1'b0, n13, n12, n11, n10, n9, n8, n7, A[0]}), 
        .B({1'b0, B[7], n6, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, N105, 
        N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_43 ( .A({1'b0, n13, n12, n11, n10, n9, n8, n7, A[0]}), 
        .B({1'b0, B[7], n6, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, N95, 
        N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_49 ( .A({n13, n12, n11, n10, n9, n8, n7, A[0]}), .B({
        B[7], n6, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, N120, 
        N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  ALU_DW_div_uns_1 div_52 ( .a({n13, n12, n11, n10, n9, n8, n7, A[0]}), .b({
        B[7], n6, B[5:0]}), .quotient({N132, N131, N130, N129, N128, N127, 
        N126, N125}) );
  DFFRQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX1M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  BUFX5M U3 ( .A(B[6]), .Y(n6) );
  BUFX2M U4 ( .A(A[2]), .Y(n8) );
  BUFX2M U7 ( .A(A[4]), .Y(n10) );
  BUFX2M U8 ( .A(A[5]), .Y(n11) );
  AND2X2M U9 ( .A(n103), .B(n94), .Y(n3) );
  BUFX2M U10 ( .A(A[6]), .Y(n12) );
  BUFX4M U11 ( .A(A[7]), .Y(n13) );
  AOI21X1M U12 ( .A0(N101), .A1(n4), .B0(n19), .Y(n20) );
  AOI21XLM U13 ( .A0(n123), .A1(n120), .B0(B[1]), .Y(n124) );
  INVX2M U14 ( .A(n71), .Y(n116) );
  INVX2M U15 ( .A(n81), .Y(n114) );
  NOR2BX2M U16 ( .AN(n117), .B(n166), .Y(n31) );
  INVX2M U17 ( .A(n100), .Y(n58) );
  OAI2BB1X2M U18 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U19 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U20 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U21 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U22 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U23 ( .A0N(n167), .A1N(n119), .B0(n101), .Y(n47) );
  OAI2BB1X2M U24 ( .A0N(n118), .A1N(n115), .B0(n101), .Y(n48) );
  OAI2BB1X2M U25 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U26 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  INVX2M U27 ( .A(n23), .Y(n115) );
  INVX2M U28 ( .A(n17), .Y(n119) );
  OR2X2M U29 ( .A(n17), .B(n23), .Y(n81) );
  OR2X2M U30 ( .A(n107), .B(n15), .Y(n71) );
  NOR2X2M U31 ( .A(n16), .B(n17), .Y(n4) );
  INVX2M U32 ( .A(n106), .Y(n16) );
  INVX2M U33 ( .A(n107), .Y(n167) );
  INVX2M U34 ( .A(n46), .Y(n77) );
  INVX2M U35 ( .A(n15), .Y(n118) );
  NAND3BX2M U36 ( .AN(n121), .B(n119), .C(n18), .Y(n100) );
  INVX2M U37 ( .A(n14), .Y(n117) );
  NAND3BX2M U38 ( .AN(n121), .B(n118), .C(n18), .Y(n14) );
  INVX2M U39 ( .A(n69), .Y(n113) );
  NOR2X2M U40 ( .A(n15), .B(n16), .Y(n5) );
  INVX2M U41 ( .A(EN), .Y(n166) );
  NOR2X2M U42 ( .A(n109), .B(n108), .Y(n110) );
  NOR2X2M U43 ( .A(n96), .B(n95), .Y(n111) );
  INVX2M U44 ( .A(ALU_FUN[0]), .Y(n122) );
  OR2X2M U45 ( .A(ALU_FUN[3]), .B(n122), .Y(n17) );
  INVX2M U46 ( .A(ALU_FUN[2]), .Y(n18) );
  OR2X2M U47 ( .A(ALU_FUN[1]), .B(n18), .Y(n23) );
  AOI31X2M U48 ( .A0(N158), .A1(ALU_FUN[3]), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U49 ( .A(n122), .B(ALU_FUN[2]), .C(n121), .Y(n89) );
  NOR2X2M U50 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U51 ( .A(n106), .B(n122), .C(ALU_FUN[3]), .Y(n46) );
  NAND3BX2M U52 ( .AN(n122), .B(ALU_FUN[3]), .C(n115), .Y(n69) );
  OR2X2M U53 ( .A(n120), .B(n69), .Y(n97) );
  NAND2X2M U54 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  OR2X2M U55 ( .A(ALU_FUN[0]), .B(ALU_FUN[3]), .Y(n15) );
  NAND2X2M U56 ( .A(EN), .B(n156), .Y(n32) );
  NAND3X2M U57 ( .A(n106), .B(ALU_FUN[0]), .C(ALU_FUN[3]), .Y(n101) );
  AND4X2M U58 ( .A(N159), .B(n115), .C(ALU_FUN[3]), .D(n122), .Y(n90) );
  AO22X1M U59 ( .A0(N97), .A1(n5), .B0(n149), .B1(n116), .Y(n51) );
  NOR3X2M U60 ( .A(n121), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  NAND3X2M U61 ( .A(n167), .B(n122), .C(ALU_FUN[3]), .Y(n36) );
  INVX2M U62 ( .A(ALU_FUN[1]), .Y(n121) );
  INVX2M U63 ( .A(n105), .Y(n96) );
  AOI31X2M U64 ( .A0(n22), .A1(n21), .A2(n20), .B0(n166), .Y(ALU_OUT_Comb[1])
         );
  AOI22X1M U65 ( .A0(N92), .A1(n5), .B0(N110), .B1(n117), .Y(n22) );
  MX2X2M U66 ( .A(n71), .B(n81), .S0(n7), .Y(n21) );
  AOI31X2M U67 ( .A0(n27), .A1(n26), .A2(n25), .B0(n166), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U68 ( .A0(N102), .A1(n4), .B0(n8), .B1(n114), .Y(n26) );
  AOI211X2M U69 ( .A0(N111), .A1(n117), .B0(n24), .C0(n78), .Y(n25) );
  AOI22XLM U70 ( .A0(n9), .A1(n113), .B0(N127), .B1(n58), .Y(n27) );
  AOI31X2M U71 ( .A0(n35), .A1(n30), .A2(n29), .B0(n166), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U72 ( .A0(N103), .A1(n4), .B0(n9), .B1(n114), .Y(n30) );
  AOI211X2M U73 ( .A0(N112), .A1(n117), .B0(n28), .C0(n72), .Y(n29) );
  AOI22XLM U74 ( .A0(n10), .A1(n113), .B0(N128), .B1(n58), .Y(n35) );
  AOI31X2M U75 ( .A0(n40), .A1(n39), .A2(n38), .B0(n166), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U76 ( .A0(N104), .A1(n4), .B0(n10), .B1(n114), .Y(n39) );
  AOI211X2M U77 ( .A0(N113), .A1(n117), .B0(n37), .C0(n66), .Y(n38) );
  AOI22X1M U78 ( .A0(N106), .A1(n4), .B0(n12), .B1(n114), .Y(n53) );
  AOI211X2M U79 ( .A0(N115), .A1(n117), .B0(n51), .C0(n54), .Y(n52) );
  AOI31X2M U80 ( .A0(n64), .A1(n63), .A2(n59), .B0(n166), .Y(ALU_OUT_Comb[7])
         );
  OA22X2M U81 ( .A0(n81), .A1(n160), .B0(n71), .B1(n13), .Y(n63) );
  AOI22X1M U82 ( .A0(N132), .A1(n58), .B0(N107), .B1(n4), .Y(n64) );
  AOI221XLM U83 ( .A0(N98), .A1(n5), .B0(N116), .B1(n117), .C0(n43), .Y(n59)
         );
  AOI21X2M U84 ( .A0(n33), .A1(n34), .B0(n166), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U85 ( .A0(N99), .A1(n5), .B0(n156), .Y(n33) );
  AOI2BB2XLM U86 ( .B0(N117), .B1(n117), .A0N(n160), .A1N(n36), .Y(n34) );
  NAND3X2M U87 ( .A(n105), .B(n3), .C(n102), .Y(n108) );
  NAND2X2M U88 ( .A(n97), .B(n3), .Y(n95) );
  AOI221XLM U89 ( .A0(n46), .A1(n149), .B0(n12), .B1(n48), .C0(n114), .Y(n55)
         );
  AOI221XLM U90 ( .A0(n12), .A1(n46), .B0(n47), .B1(n149), .C0(n116), .Y(n56)
         );
  AOI221XLM U91 ( .A0(n46), .A1(n120), .B0(n7), .B1(n48), .C0(n114), .Y(n86)
         );
  AOI221XLM U92 ( .A0(n7), .A1(n46), .B0(n47), .B1(n120), .C0(n116), .Y(n87)
         );
  INVX2M U93 ( .A(n12), .Y(n149) );
  NAND4X2M U94 ( .A(n100), .B(n99), .C(n98), .D(n97), .Y(n109) );
  AOI31X2M U95 ( .A0(n50), .A1(n49), .A2(n42), .B0(n166), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U96 ( .A0(N105), .A1(n4), .B0(n11), .B1(n114), .Y(n49) );
  AOI22XLM U97 ( .A0(n12), .A1(n113), .B0(N130), .B1(n58), .Y(n50) );
  AOI211X2M U98 ( .A0(N114), .A1(n117), .B0(n41), .C0(n60), .Y(n42) );
  NAND3X2M U99 ( .A(n98), .B(n102), .C(n99), .Y(n65) );
  INVX2M U100 ( .A(n92), .Y(n156) );
  AOI211X2M U101 ( .A0(N108), .A1(n4), .B0(n116), .C0(n47), .Y(n92) );
  INVX2M U102 ( .A(n7), .Y(n120) );
  AO22X1M U103 ( .A0(N93), .A1(n5), .B0(n164), .B1(n116), .Y(n24) );
  AO22X1M U104 ( .A0(N94), .A1(n5), .B0(n163), .B1(n116), .Y(n28) );
  AO22X1M U105 ( .A0(N95), .A1(n5), .B0(n162), .B1(n116), .Y(n37) );
  AO22X1M U106 ( .A0(N96), .A1(n5), .B0(n161), .B1(n116), .Y(n41) );
  NAND2X2M U107 ( .A(N109), .B(n117), .Y(n105) );
  NAND2X2M U108 ( .A(N91), .B(n5), .Y(n102) );
  INVX2M U109 ( .A(n9), .Y(n163) );
  INVX2M U110 ( .A(n10), .Y(n162) );
  INVX2M U111 ( .A(n8), .Y(n164) );
  INVX2M U112 ( .A(n11), .Y(n161) );
  OAI2BB1XLM U113 ( .A0N(N126), .A1N(n58), .B0(n83), .Y(n19) );
  AOI211X2M U114 ( .A0(n8), .A1(n113), .B0(n84), .C0(n85), .Y(n83) );
  OAI2B2X1M U115 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n165), .Y(n85) );
  OAI21XLM U116 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  BUFX2M U117 ( .A(A[3]), .Y(n9) );
  BUFX2M U118 ( .A(A[1]), .Y(n7) );
  AOI31X2M U119 ( .A0(N157), .A1(ALU_FUN[3]), .A2(n104), .B0(n90), .Y(n103) );
  MX2X2M U120 ( .A(n93), .B(n91), .S0(A[0]), .Y(n94) );
  AND2X2M U121 ( .A(n75), .B(n71), .Y(n93) );
  INVX2M U122 ( .A(n47), .Y(n70) );
  AND2X2M U123 ( .A(n82), .B(n81), .Y(n91) );
  INVX2M U124 ( .A(n48), .Y(n76) );
  OAI222XLM U125 ( .A0(n79), .A1(n152), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n120), .Y(n78) );
  AOI221XLM U126 ( .A0(n8), .A1(n46), .B0(n47), .B1(n164), .C0(n116), .Y(n80)
         );
  AOI221XLM U127 ( .A0(n46), .A1(n164), .B0(n8), .B1(n48), .C0(n114), .Y(n79)
         );
  OAI222XLM U128 ( .A0(n73), .A1(n154), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n164), .Y(n72) );
  AOI221XLM U129 ( .A0(n9), .A1(n46), .B0(n47), .B1(n163), .C0(n116), .Y(n74)
         );
  AOI221XLM U130 ( .A0(n46), .A1(n163), .B0(n9), .B1(n48), .C0(n114), .Y(n73)
         );
  OAI222XLM U131 ( .A0(n67), .A1(n159), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n163), .Y(n66) );
  INVXLM U132 ( .A(B[4]), .Y(n159) );
  AOI221XLM U133 ( .A0(n10), .A1(n46), .B0(n47), .B1(n162), .C0(n116), .Y(n68)
         );
  AOI221XLM U134 ( .A0(n46), .A1(n162), .B0(n10), .B1(n48), .C0(n114), .Y(n67)
         );
  OAI222XLM U135 ( .A0(n61), .A1(n158), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n162), .Y(n60) );
  INVXLM U136 ( .A(B[5]), .Y(n158) );
  AOI221XLM U137 ( .A0(n11), .A1(n46), .B0(n47), .B1(n161), .C0(n116), .Y(n62)
         );
  AOI221XLM U138 ( .A0(n46), .A1(n161), .B0(n11), .B1(n48), .C0(n114), .Y(n61)
         );
  INVX2M U139 ( .A(n123), .Y(n151) );
  INVX2M U140 ( .A(n134), .Y(n153) );
  NAND2X2M U141 ( .A(N100), .B(n4), .Y(n98) );
  INVXLM U142 ( .A(B[2]), .Y(n152) );
  INVXLM U143 ( .A(B[3]), .Y(n154) );
  INVX2M U144 ( .A(A[0]), .Y(n165) );
  INVXLM U145 ( .A(n6), .Y(n155) );
  NOR2X4M U146 ( .A(N125), .B(n65), .Y(n112) );
  MX2XLM U147 ( .A(n71), .B(n81), .S0(B[0]), .Y(n99) );
  MX2XLM U148 ( .A(n70), .B(n77), .S0(B[0]), .Y(n75) );
  MX2XLM U149 ( .A(n77), .B(n76), .S0(B[0]), .Y(n82) );
  INVXLM U150 ( .A(B[0]), .Y(n150) );
  INVXLM U151 ( .A(B[7]), .Y(n157) );
  OAI222XLM U152 ( .A0(n55), .A1(n155), .B0(n6), .B1(n56), .C0(n36), .C1(n161), 
        .Y(n54) );
  AOI32XLM U153 ( .A0(n129), .A1(n139), .A2(n142), .B0(n6), .B1(n149), .Y(n130) );
  XNOR2XLM U154 ( .A(n12), .B(n6), .Y(n142) );
  AOI31X2M U155 ( .A0(n57), .A1(n53), .A2(n52), .B0(n166), .Y(ALU_OUT_Comb[6])
         );
  INVXLM U156 ( .A(n13), .Y(n160) );
  AOI22XLM U157 ( .A0(n13), .A1(n113), .B0(N131), .B1(n58), .Y(n57) );
  AOI221XLM U158 ( .A0(n46), .A1(n160), .B0(n13), .B1(n48), .C0(n114), .Y(n44)
         );
  AOI221XLM U159 ( .A0(n46), .A1(n13), .B0(n47), .B1(n160), .C0(n116), .Y(n45)
         );
  NAND2XLM U160 ( .A(B[7]), .B(n160), .Y(n146) );
  AOI22XLM U161 ( .A0(n11), .A1(n113), .B0(N129), .B1(n58), .Y(n40) );
  OAI222XLM U162 ( .A0(n44), .A1(n157), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n149), .Y(n43) );
  NOR2XLM U163 ( .A(n160), .B(B[7]), .Y(n145) );
  AOI211X2M U164 ( .A0(n112), .A1(n111), .B0(n110), .C0(n166), .Y(
        ALU_OUT_Comb[0]) );
  NAND2BX1M U165 ( .AN(B[4]), .B(n10), .Y(n138) );
  NAND2BX1M U166 ( .AN(n10), .B(B[4]), .Y(n127) );
  CLKNAND2X2M U167 ( .A(n138), .B(n127), .Y(n140) );
  NOR2X1M U168 ( .A(n154), .B(n9), .Y(n135) );
  NOR2X1M U169 ( .A(n152), .B(n8), .Y(n126) );
  NOR2X1M U170 ( .A(n150), .B(A[0]), .Y(n123) );
  CLKNAND2X2M U171 ( .A(n8), .B(n152), .Y(n137) );
  NAND2BX1M U172 ( .AN(n126), .B(n137), .Y(n132) );
  AOI211X1M U173 ( .A0(n7), .A1(n151), .B0(n132), .C0(n124), .Y(n125) );
  CLKNAND2X2M U174 ( .A(n9), .B(n154), .Y(n136) );
  OAI31X1M U175 ( .A0(n135), .A1(n126), .A2(n125), .B0(n136), .Y(n128) );
  NAND2BX1M U176 ( .AN(n11), .B(B[5]), .Y(n143) );
  OAI211X1M U177 ( .A0(n140), .A1(n128), .B0(n127), .C0(n143), .Y(n129) );
  NAND2BX1M U178 ( .AN(B[5]), .B(n11), .Y(n139) );
  OAI21X1M U179 ( .A0(n145), .A1(n130), .B0(n146), .Y(N159) );
  CLKNAND2X2M U180 ( .A(A[0]), .B(n150), .Y(n133) );
  OA21X1M U181 ( .A0(n133), .A1(n120), .B0(B[1]), .Y(n131) );
  AOI211X1M U182 ( .A0(n133), .A1(n120), .B0(n132), .C0(n131), .Y(n134) );
  AOI31X1M U183 ( .A0(n153), .A1(n137), .A2(n136), .B0(n135), .Y(n141) );
  OAI2B11X1M U184 ( .A1N(n141), .A0(n140), .B0(n139), .C0(n138), .Y(n144) );
  AOI32X1M U185 ( .A0(n144), .A1(n143), .A2(n142), .B0(n12), .B1(n155), .Y(
        n147) );
  AOI2B1X1M U186 ( .A1N(n147), .A0(n146), .B0(n145), .Y(n148) );
  CLKINVX1M U187 ( .A(n148), .Y(N158) );
  NOR2X1M U188 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module SYS_TOP ( REF_CLK, UART_CLK, RST, SYS_RX_IN, PAR_Err, Frame_Err, 
        SYS_TX_OUT );
  input REF_CLK, UART_CLK, RST, SYS_RX_IN;
  output PAR_Err, Frame_Err, SYS_TX_OUT;
  wire   REF_RST1, REF_RST2, UART_RST, SYS_TX_CLK, SYS_RX_CLK, CLKGATE_EN,
         ALU_CLK, Busy_SIG, Busy_PULSE, RX_DATA_VLD, SYS_CTRL_PULSE,
         FIFO_EMPTY, FIFO_NOT_EMPTY, WR_INC, FIFO_FULL, REGF_RD_DATA_VLD,
         ALU_OUT_VLD, Wr_En, Rd_En, ALU_EN, n1, n2, n3, n4, n5, n6;
  wire   [7:0] TX_Div_Ratio;
  wire   [7:0] UART_Config;
  wire   [7:0] RX_Div_Ratio;
  wire   [7:0] RX_DATA;
  wire   [7:0] SYS_CTRL_DATA;
  wire   [7:0] FIFO_RD_DATA;
  wire   [7:0] FIFO_WR_DATA;
  wire   [7:0] REGF_RD_DATA;
  wire   [15:0] ALU_OUT;
  wire   [3:0] REG_ADDR;
  wire   [7:0] REGF_WR_DATA;
  wire   [3:0] ALU_FUN;
  wire   [7:0] OP_A;
  wire   [7:0] OP_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  RST_SYNC_0 RST_SYNC_1 ( .CLK(REF_CLK), .RST(RST), .SYNC_RST(REF_RST1) );
  RST_SYNC_2 RST_SYNC_2 ( .CLK(REF_CLK), .RST(RST), .SYNC_RST(REF_RST2) );
  RST_SYNC_1 RST_SYNC_3 ( .CLK(UART_CLK), .RST(RST), .SYNC_RST(UART_RST) );
  ClkDiv_0 TX_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(UART_RST), .i_clk_en(
        1'b1), .i_div_ratio(TX_Div_Ratio), .o_div_clk(SYS_TX_CLK) );
  CLKDIV_MUX RX_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, RX_Div_Ratio[3:0]})
         );
  ClkDiv_1 RX_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst_n(UART_RST), .i_clk_en(
        1'b1), .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, RX_Div_Ratio[3:0]}), 
        .o_div_clk(SYS_RX_CLK) );
  CLK_GATE ALU_CLK_GATE ( .CLK_EN(CLKGATE_EN), .CLK(REF_CLK), .GATED_CLK(
        ALU_CLK) );
  PULSE_GEN BUSY_PULSE_GEN ( .CLK(SYS_TX_CLK), .RST(UART_RST), .LVL_SIG(
        Busy_SIG), .PULSE_SIG(Busy_PULSE) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 U0_DATA_SYNC ( .CLK(REF_CLK), .RST(n3), 
        .unsync_bus(RX_DATA), .bus_enable(RX_DATA_VLD), .sync_bus(
        SYS_CTRL_DATA), .enable_pulse_d(SYS_CTRL_PULSE) );
  INV EMPTY_INV ( .SIG(FIFO_EMPTY), .NOT_SIG(FIFO_NOT_EMPTY) );
  UART U0_UART ( .RST(UART_RST), .TX_CLK(SYS_TX_CLK), .RX_CLK(SYS_RX_CLK), 
        .RX_IN(SYS_RX_IN), .Prescale(UART_Config[7:2]), .PAR_EN(UART_Config[0]), .PAR_TYP(UART_Config[1]), .TX_P_DATA(FIFO_RD_DATA), .TX_DATA_VALID(
        FIFO_NOT_EMPTY), .RX_P_DATA(RX_DATA), .RX_DATA_VALID(RX_DATA_VLD), 
        .PAR_Err(PAR_Err), .Frame_Err(Frame_Err), .TX_OUT(SYS_TX_OUT), .Busy(
        Busy_SIG) );
  ASYNC_FIFO U0_ASYNC_FIFO ( .WR_DATA(FIFO_WR_DATA), .W_CLK(REF_CLK), .W_RST(
        n5), .W_INC(WR_INC), .R_CLK(SYS_TX_CLK), .R_RST(UART_RST), .R_INC(
        Busy_PULSE), .RD_DATA(FIFO_RD_DATA), .FULL(FIFO_FULL), .EMPTY(
        FIFO_EMPTY) );
  SYS_CTRL U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n5), .SYNC_DATA(SYS_CTRL_DATA), 
        .SYNC_PULSE(SYS_CTRL_PULSE), .FIFO_FULL(FIFO_FULL), .RD_DATA(
        REGF_RD_DATA), .RD_DATA_VLD(REGF_RD_DATA_VLD), .ALU_OUT(ALU_OUT), 
        .ALU_OUT_VLD(ALU_OUT_VLD), .WR_EN(Wr_En), .RD_EN(Rd_En), .ADDR(
        REG_ADDR), .REG_WR_DATA(REGF_WR_DATA), .ALU_FUN(ALU_FUN), .ALU_EN(
        ALU_EN), .CLKGATE_EN(CLKGATE_EN), .FIFO_WR_DATA(FIFO_WR_DATA), 
        .WR_INC(WR_INC) );
  REGFILE U0_REGFILE ( .CLK(REF_CLK), .RST(n5), .WrEn(Wr_En), .RdEn(Rd_En), 
        .ADDR({REG_ADDR[3:2], n2, n1}), .WR_DATA(REGF_WR_DATA), .REG0(OP_A), 
        .REG1(OP_B), .REG2(UART_Config), .REG3(TX_Div_Ratio), .RD_DATA(
        REGF_RD_DATA), .RD_DATA_VLD(REGF_RD_DATA_VLD) );
  ALU U0_ALU ( .A(OP_A), .B(OP_B), .EN(ALU_EN), .ALU_FUN(ALU_FUN), .CLK(
        ALU_CLK), .RST(n3), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VLD) );
  BUFX2M U2 ( .A(REG_ADDR[1]), .Y(n2) );
  BUFX2M U3 ( .A(REG_ADDR[0]), .Y(n1) );
  INVX2M U4 ( .A(n6), .Y(n5) );
  INVX2M U5 ( .A(REF_RST1), .Y(n6) );
  INVX2M U6 ( .A(n4), .Y(n3) );
  INVX2M U7 ( .A(REF_RST2), .Y(n4) );
endmodule

