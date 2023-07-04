// yosys
//
// read_verilog -sv mux2.v
// hierarchy -check
// proc; opt; memory; opt; fsm; opt
// dump -o ./mux2.rtlil
// show -colors 2
//
// exit

module mux2 #(parameter WIDTH=8)
             (input logic [WIDTH-1:0] d0, d1,
              input logic              s,
              output logic [WIDTH-1:0] y);

    assign y = s ? d1 : d0;
endmodule