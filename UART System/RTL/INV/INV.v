
module INV (
  input       wire        SIG,
  output      wire        NOT_SIG
);


assign  NOT_SIG = ~SIG;


endmodule