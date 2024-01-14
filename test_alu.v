`default_nettype none 
`timescale 1ns/1ps
`include "ALU.v"
`include "SignExtender.v"


module test_alu() ;

ALU uut_alu(.rs1(a), .rs2(b), .sub(sub), .func3(func3), .result(result), .compare(flags));

reg [31:0] a ;
reg [31:0] b ;
reg sub;
reg [2:0] func3;
wire [31:0] result ;
wire [2:0] flags;


integer i , j ; // 循环计数器
reg [31:0] expected_result ;
integer seed = 100 ;

initial begin
    $dumpfile ("test_alu.vcd") ;
    $dumpvars (0 , test_alu) ;

    //seed = 100 ;

    for (i=0 ; i<8 ; i=i+1) begin
      func3 = i ;

      sub = 0 ;

      for (j=0 ; j<100 ; j=j+1) begin
        a = $random(seed);
        b = $random(seed);

        #10
        case(func3)
          0: expected_result = a+b ;
          6: expected_result = a|b ;
        endcase

        if (expected_result!==result) begin
          $display("incorrect result: func3=%d , j=0 , a=%x , b=%x , result=%x , expected_result=%x\n" , func3 , j , a , b , result , expected_result);
        end  

      end
    end
    $finish; // 运行所有测试用例后停止模拟
  end

endmodule