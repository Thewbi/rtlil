// yosys
//
// read_verilog -sv flopr.v
// hierarchy -check
// proc; opt; memory; opt; fsm; opt
// dump -o ./flopr.rtlil
// show -colors 2
//
// exit

module flopr #(parameter WIDTH=8)
             (input  logic             clk, reset,
              input  logic [WIDTH-1:0] d,
              output logic [WIDTH-1:0] q);

    always_ff @(posedge clk, posedge reset)
      if (reset) q <= 0;
      else       q <= d;
endmodule