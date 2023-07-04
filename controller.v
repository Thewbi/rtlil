// read_verilog -sv controller.v aludec.v maindec.v
// hierarchy -check
// proc; opt; memory; opt; fsm; opt
// dump -o ./controller.rtlil
// show -colors 2
// show -format dot -prefix ./controller

// This is the control logic
// It contains the main decoder and the decoder for the ALU
// It only receives a subset of all bits from the instruction.
// The instruction is 32 bits wide.
// The controll logic receives the uppermost 6 (instruction signals for the datapath)
// and lowermost 3 bits (instruction signals for the ALU).
//
// The control logic is instantiated inside the mips module.
//
module controller(input     logic[5:0]    op, funct,
                  input     logic         zero,
                  output    logic         memtoreg, memwrite,
                  output    logic         pcsrc, alusrc,
                  output    logic         regdst, regwrite,
                  output    logic         jump,
                  output    logic[2:0]    alucontrol);

  logic [1:0] aluop;
  logic       branch;

  maindec md ( op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop );

  aludec ad ( funct, aluop, alucontrol );

  assign pcsrc = branch & zero;

endmodule