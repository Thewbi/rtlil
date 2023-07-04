# start yosys on the command line to enter it's command line interface
yosys



# read design
read_verilog half_adder.v

# elaborate design hierarchy
hierarchy -check -top half_adder

# the high-level stuff
proc; opt; fsm; opt; memory; opt

# mapping to internal cell library
techmap; opt

# mapping flip-flops to mycells.lib
dfflibmap -liberty mycells.lib

# mapping logic to mycells.lib
abc -liberty mycells.lib

# cleanup
clean

# write synthesized design
write_verilog synth.v






https://github.com/nkkav/yosys-examples/blob/master/adder/show_rtl.ys


# start yosys on the command line to enter it's command line interface
yosys

# read design
read_verilog adder.v
hierarchy -check

# high-level synthesis
proc; opt; memory; opt; fsm; opt

# show
#show
show -format dot -prefix ./adder_rtl

dump -o ./adder.rtlil

show -colors 2






# read design
read_verilog des.v
hierarchy -check

# high-level synthesis
proc; opt; memory; opt; fsm; opt

# show
#show
show -format dot -prefix ./des_rtl

dump -o ./des.rtlil

show -colors 2





# read design
read_verilog incomplete_if.v
hierarchy -check

# high-level synthesis
proc; opt; memory; opt; fsm; opt

# show
#show
show -format dot -prefix ./incomplete_if_rtl

dump -o ./incomplete_if.rtlil

write_verilog synth.v






# read design
read_verilog clock_divider.v
hierarchy -check

# high-level synthesis
proc; opt; memory; opt; fsm; opt

# show
#show
show -format dot -prefix ./clock_divider_rtl

dump -o ./clock_divider.rtlil

write_verilog clock_divider_synth.v

show -colors 2





= YOSYS output rtlil file =
Yosys has the dump command which outputs a RTLIL file into the console.

https://yosyshq.readthedocs.io/projects/yosys/en/latest/cmd/dump.html

dump -o test_dump.rtlil
dump -o incomplete_if.rtlil






Show the current status as a dot file:
https://www.mehmetburakaykenar.com/synthesis-n-bit-counter-with-open-source-yosys-synthesizer/294/

brew install xdot

You can use Yosys “show” command to see a graphical view of Verilog files. To use show
command, first read a verilog file by read_verilog command and then just run “show”. You can use
-colors 2 to see connections in colored instead of bw.

show -colors 2