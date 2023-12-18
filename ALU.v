//算数逻辑运算单元
`include "Mux.v"
`include "Adder_32"
`include "Decoder_5to32.v"
`include "Shifter_32"
module ALU (rs1, rs2, sub, func3, result, overflow, zeroflag);
    input [31:0]rs1, rs2;
    input sub;
    input [2:0]func3;
    output [31:0]result;
    output overflow, zeroflag;
    wire [31:0]rs2bar, muxrs2, addout, shift;
    //rs2取反
    assign rs2bar = ~rs2;
    Mux Mux_b(.select(sub), .datain0(rs2), .datain1(rs2bar), .dataout(muxrs2));
    //加法器
    Adder_32 Adder(.a(rs1), .b(muxrs2), .sub(sub), .s(addout), .cout(overflow), .zeroflag(zeroflag));
    //移位模块
    Decoder_5to32 Decoder_Shift(.s(rs2[4:0]), .right(sub), .sout(shift));
    Shifter_32 Shifter(.s(shift), din, dout);
    //ALU输出
    case (func3)
        3'b000: result = addout;//算数结果
        3'b001: result = ;//左移
        3'b010: result = ;//小于置1
        3'b011: result = ;//无符号小于置1
        3'b100: result = a ^ b;//逻辑异或
        3'b101: result = ;//右移
        3'b110: result = a | b;//逻辑或
        3'b111: result = a & b;//逻辑与
    endcase
endmodule
