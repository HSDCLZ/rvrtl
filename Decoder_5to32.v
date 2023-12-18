module Decoder_5to32 (s, shift);
    input [4:0] s;
    output [31:0] shift;

    case (s)
        5'b00000: shift <= 8'h0000_0001;
        5'b00001: shift <= 8'h0000_0002;
        5'b00010: shift <= 8'h0000_0004;
        5'b00011: shift <= 8'h0000_0008;

        5'b00100: shift <= 8'h0000_0010;
        5'b00101: shift <= 8'h0000_0020;
        5'b00110: shift <= 8'h0000_0040;
        5'b00111: shift <= 8'h0000_0080;
        
        5'b01000: shift <= 8'h0000_0100;
        5'b01001: shift <= 8'h0000_0200;
        5'b01010: shift <= 8'h0000_0400;
        5'b01011: shift <= 8'h0000_0800;

        5'b01100: shift <= 8'h0000_1000;
        5'b01101: shift <= 8'h0000_2000;
        5'b01110: shift <= 8'h0000_4000;
        5'b01111: shift <= 8'h0000_8000;

        5'b10000: shift <= 8'h0001_0000;
        5'b11001: shift <= 8'h0002_0000;
        5'b11010: shift <= 8'h0004_0000;
        5'b11011: shift <= 8'h0008_0000;

        5'b11100: shift <= 8'h0010_0000;
        5'b11101: shift <= 8'h0020_0000;
        5'b11110: shift <= 8'h0040_0000;
        5'b11111: shift <= 8'h0080_0000;
        
        5'b11000: shift <= 8'h0010_0000;
        5'b11001: shift <= 8'h0020_0000;
        5'b11010: shift <= 8'h0040_0000;
        5'b11011: shift <= 8'h0080_0000;

        5'b11100: shift <= 8'h1000_0000;
        5'b11101: shift <= 8'h2000_0000;
        5'b11110: shift <= 8'h4000_0000;
        5'b11111: shift <= 8'h8000_0000;
    endcase
endmodule