// read_verilog -sv adder.v
// hierarchy -check
// proc; opt; memory; opt; fsm; opt
// dump -o ./adder.rtlil
// show -colors 2
//
// list all modules:
// ls
//
// enter the adder module
// cd adder
// ls
// cd ..
module adder(input logic[31:0] a,b,
             output logic[31:0] y);
    assign y = a + b;
endmodule