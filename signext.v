// yosys
//
// read_verilog -sv signext.v
// hierarchy -check
// proc; opt; memory; opt; fsm; opt
// dump -o ./signext.rtlil
// show -colors 2
//
// exit

module signext(input  logic [15:0] a,
               output logic [31:0] y);
  // shift left by 2
  assign y = {{16{a[15]}}, a};
endmodule