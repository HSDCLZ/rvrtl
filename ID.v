//译码
`include "Register.v"
`include "Immediate.v"
module ID (
    clk, clr,
    RegWrite,
    Instruction, Writedata,
    rd, rs1, rs2, immediate,
    func7, func3
);
    input clk, clr;
    input RegWrite;
    input [31:0] Instruction, PCin, Writedata;
    input [4:0] rd;

    output [31:0] rs1, rs2, immediate;
    output [6:0] func7;
    output [2:0] func3;

    Register RegisterInt (.clk(clk), .clr(clr), .write(RegWrite),
        .rd(rd), .rs1(Instruction[19:15]), .rs2(Instruction[24:20]),
        .rddata(Writedata), .rs1data(rs1), .rs2data(rs2));

    Immediate Immediate0 (.instruction(Instruction), .immediate(immediate));
endmodule