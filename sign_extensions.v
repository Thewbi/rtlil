// read_verilog -sv sign_extensions.v
// hierarchy -check
// proc; opt; memory; opt; fsm; opt
// dump -o ./sign_extensions.rtlil
// show -colors 2
module signext(input  logic[15:0] a,
               output logic[31:0] y);

  assign y = {{16{a[15]}}, a};

endmodule