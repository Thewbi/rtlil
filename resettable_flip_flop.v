// read_verilog -sv resettable_flip_flop.v
// hierarchy -check
// proc; opt; memory; opt; fsm; opt
// dump -o ./resettable_flip_flop.rtlil
// show -colors 2
module flopr#(parameter WIDTH=8)
             (input   logic clk, reset,
              input   logic[WIDTH-1:0] d,
              output  logic[WIDTH-1:0] q);

  always_ff@(posedge clk, posedge reset)
    if (reset) q <= 0;
    else       q <= d;

endmodule