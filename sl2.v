// yosys
//
// read_verilog -sv sl2.v
// hierarchy -check
// proc; opt; memory; opt; fsm; opt
// dump -o ./sl2.rtlil
// show -colors 2
//
// exit

module sl2(input  logic [31:0] a,
           output logic [31:0] y);
  // shift left by 2
  assign y = {a[29:0], 2'b00};
endmodule