//立即数扩展
module Immediate (instruction, immediate);
    input [31:0]instruction;
    output [31:0]Immediate;

    case (instruction[6:0])
        //I-type Immediate
        7'b0010011:
        7'b0000011:
        7'b1100111:
        7'b1110011:
            immediate = {20{instruction[31]},instruction[31:20]};
        //S-type Immediate
        7'b0100011:
            immediate = {20{instruction[31]},instruction[31:25],instruction[11:7]};
        //B-type Immediate
        7'b1100011:
            immediate = {19{instruction[31]},instruction[31],instruction[7],instruction[30:25],instruction[11:8],1'b0};
        //U-type Immediate
        7'b0110011:
            immediate = {instruction[31:12],12'b0};
        //J-type Immediate
        7'b1101111:
            immediate = {11{instruction[31]},instruction[31],instruction[19:12],instruction[20],instruction[30:21],1'b0};
    endcase
endmodule