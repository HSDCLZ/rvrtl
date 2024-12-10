//16位快速加法器
module FastAdder_16 (a, b, sum, cin, cout);
    input  [15:0] a, b;
    output [15:0] sum;
    input  cin;
    output cout;
    wire [15:0] g, p;
    wire [14:0] ctemp;
    
    assign g = a & b;//进位产生
    assign p = a | b;//进位传播

    //进位逻辑
    assign ctemp[0] = g[0] | (p[0] & cin);
    assign ctemp[1] = g[1] | (p[1] & g[0])
        |((p[1] & p[0]) & cin);
    assign ctemp[2] = g[2] | (p[2] & g[1])
        | ((p[2] & p[1]) & g[0]) 
        | ((p[2] & p[1]) & (p[0] & cin));
    assign ctemp[3] = g[3] | (p[3] & g[2])
        | ((p[3] & p[2]) & g[1])
        | ((p[3] & p[2]) & (p[1] & g[0]))
        | (((p[3] & p[2]) & (p[1] & p[0])) & cin);
    assign ctemp[4] = g[4] | (p[4] & g[3])
        | ((p[4] & p[3]) & g[2])
        | ((p[4] & p[3]) & (p[2] & g[1]))
        | (((p[4] & p[3]) & (p[2] & p[1])) & g[0])
        | (((p[4] & p[3]) & (p[2] & p[1])) & (p[0] & cin));
    assign ctemp[5] = g[5] | (p[5] & g[4])
        | ((p[5] & p[4]) & g[3])
        | ((p[5] & p[4]) & (p[3] & g[2]))
        | (((p[5] & p[4]) & (p[3] & p[2])) & g[1])
        | (((p[5] & p[4]) & (p[3] & p[2])) & (p[1] & g[0]))
        | (((p[5] & p[4]) & (p[3] & p[2])) & ((p[1] & p[0]) & cin));
    assign ctemp[6] = g[6] | (p[6] & g[5])
        | ((p[6] & p[5]) & g[4])
        | ((p[6] & p[5]) & (p[4] & g[3]))
        | (((p[6] & p[5]) & (p[4] & p[3])) & g[2])
        | (((p[6] & p[5]) & (p[4] & p[3])) & (p[2] & g[1]))
        | (((p[6] & p[5]) & (p[4] & p[3])) & ((p[2] & p[1]) & g[0]))
        | (((p[6] & p[5]) & (p[4] & p[3])) & ((p[2] & p[1]) & (p[0] & cin)));
    assign ctemp[7] = g[7] | (p[7] & g[6])
        | ((p[7] & p[6]) & g[5])
        | ((p[7] & p[6]) & (p[5] & g[4]))
        | (((p[7] & p[6]) & (p[5] & p[4])) & g[3])
        | (((p[7] & p[6]) & (p[5] & p[4])) & (p[3] & g[2]))
        | (((p[7] & p[6]) & (p[5] & p[4])) & ((p[3] & p[2]) & g[1]))
        | (((p[7] & p[6]) & (p[5] & p[4])) & ((p[3] & p[2]) & (p[1] & g[0])))
        | (((p[7] & p[6]) & (p[5] & p[4])) & (((p[3] & p[2]) & (p[1] & p[0])) & cin));
    assign ctemp[8] = g[8] | (p[8] & g[7])
        | ((p[8] & p[7]) & g[6])
        | ((p[8] & p[7]) & (p[6] & g[5]))
        | (((p[8] & p[7]) & (p[6] & p[5])) & g[4])
        | (((p[8] & p[7]) & (p[6] & p[5])) & (p[4] & g[3]))
        | (((p[8] & p[7]) & (p[6] & p[5])) & ((p[4] & p[3]) & g[2]))
        | (((p[8] & p[7]) & (p[6] & p[5])) & ((p[4] & p[3]) & (p[2] & g[1])))
        | ((((p[8] & p[7]) & (p[6] & p[5])) & ((p[4] & p[3]) & (p[2] & p[1]))) & g[0])
        | ((((p[8] & p[7]) & (p[6] & p[5])) & ((p[4] & p[3]) & (p[2] & p[1]))) & (p[0] & cin));
    assign ctemp[9] = g[9] | (p[9] & g[8])
        | ((p[9] & p[8]) & g[7])
        | ((p[9] & p[8]) & (p[7] & g[6]))
        | (((p[9] & p[8]) & (p[7] & p[6])) & g[5])
        | (((p[9] & p[8]) & (p[7] & p[6])) & (p[5] & g[4]))
        | (((p[9] & p[8]) & (p[7] & p[6])) & ((p[5] & p[4]) & g[3]))
        | (((p[9] & p[8]) & (p[7] & p[6])) & ((p[5] & p[4]) &( p[3] & g[2])))
        | ((((p[9] & p[8]) & (p[7] & p[6])) & ((p[5] & p[4]) & (p[3] & p[2]))) & g[1])
        | ((((p[9] & p[8]) & (p[7] & p[6])) & ((p[5] & p[4]) & (p[3] & p[2]))) & (p[1] & g[0]))
        | ((((p[9] & p[8]) & (p[7] & p[6])) & ((p[5] & p[4]) & (p[3] & p[2]))) & ((p[1] & p[0]) & cin));
    assign ctemp[10] = g[10] | (p[10] & g[9])
        | ((p[10] & p[9]) & g[8])
        | ((p[10] & p[9]) & (p[8] & g[7]))
        | (((p[10] & p[9]) & (p[8] & p[7])) & g[6])
        | (((p[10] & p[9]) & (p[8] & p[7])) & (p[6] & g[5]))
        | (((p[10] & p[9]) & (p[8] & p[7])) & ((p[6] & p[5]) & g[4]))
        | (((p[10] & p[9]) & (p[8] & p[7])) & ((p[6] & p[5]) & (p[4] & g[3])))
        | ((((p[10] & p[9]) & (p[8] & p[7])) & ((p[6] & p[5]) & (p[4] & p[3]))) & g[2])
        | ((((p[10] & p[9]) & (p[8] & p[7])) & ((p[6] & p[5]) & (p[4] & p[3]))) & (p[2] & g[1]))
        | ((((p[10] & p[9]) & (p[8] & p[7])) & ((p[6] & p[5]) & (p[4] & p[3]))) & ((p[2] & p[1]) & g[0]))
        | ((((p[10] & p[9]) & (p[8] & p[7])) & ((p[6] & p[5]) & (p[4] & p[3]))) & (((p[2] & p[1]) & (p[0] & cin))));
    assign ctemp[11] = g[11] | (p[11] & g[10])
        | (p[11] & p[10] & g[9])
        | (p[11] & p[10] & (p[9] & g[8]))
        | (((p[11] & p[10]) &( p[9] & p[8])) & g[7])
        | (((p[11] & p[10]) &( p[9] & p[8])) & (p[7] & g[6]))
        | (((p[11] & p[10]) &( p[9] & p[8])) & ((p[7] & p[6]) & g[5]))
        | (((p[11] & p[10]) &( p[9] & p[8])) & ((p[7] & p[6]) & (p[5] & g[4])))
        | ((((p[11] & p[10]) &( p[9] & p[8])) & ((p[7] & p[6]) & (p[5] & p[4]))) & g[3])
        | ((((p[11] & p[10]) &( p[9] & p[8])) & ((p[7] & p[6]) & (p[5] & p[4]))) & (p[3] & g[2]))
        | ((((p[11] & p[10]) &( p[9] & p[8])) & ((p[7] & p[6]) & (p[5] & p[4]))) & ((p[3] & p[2]) & g[1]))
        | ((((p[11] & p[10]) &( p[9] & p[8])) & ((p[7] & p[6]) & (p[5] & p[4]))) & ((p[3] & p[2]) & (p[1] & g[0])))
        | ((((p[11] & p[10]) &( p[9] & p[8])) & ((p[7] & p[6]) & (p[5] & p[4]))) & (((p[3] & p[2]) & (p[1] & p[0])) & cin));
    assign ctemp[12] = g[12] | (p[12] & g[11])
        | ((p[12] & p[11]) & g[10])
        | ((p[12] & p[11]) & (p[10] & g[9]))
        | (((p[12] & p[11]) & (p[10] & p[9])) & g[8])
        | (((p[12] & p[11]) & (p[10] & p[9])) & (p[8] & g[7]))
        | (((p[12] & p[11]) & (p[10] & p[9])) & ((p[8] & p[7]) & g[6]))
        | (((p[12] & p[11]) & (p[10] & p[9])) & ((p[8] & p[7]) & (p[6] & g[5])))
        | ((((p[12] & p[11]) & (p[10] & p[9])) & ((p[8] & p[7]) & (p[6] & p[5]))) & g[4])
        | ((((p[12] & p[11]) & (p[10] & p[9])) & ((p[8] & p[7]) & (p[6] & p[5]))) & (p[4] & g[3]))
        | ((((p[12] & p[11]) & (p[10] & p[9])) & ((p[8] & p[7]) & (p[6] & p[5]))) & ((p[4] & p[3]) & g[2]))
        | ((((p[12] & p[11]) & (p[10] & p[9])) & ((p[8] & p[7]) & (p[6] & p[5]))) & ((p[4] & p[3]) & (p[2] & g[1])))
        | ((((p[12] & p[11]) & (p[10] & p[9])) & ((p[8] & p[7]) & (p[6] & p[5]))) & (((p[4] & p[3]) & (p[2] & p[1])) & g[0]))
        | ((((p[12] & p[11]) & (p[10] & p[9])) & ((p[8] & p[7]) & (p[6] & p[5]))) & (((p[4] & p[3]) & (p[2] & p[1])) & (p[0] & cin)));
    assign ctemp[13] = g[13] | (p[13] & g[12])
        | ((p[13] & p[12]) & g[11])
        | ((p[13] & p[12]) & (p[11] & g[10]))
        | (((p[13] & p[12]) & (p[11] & p[10])) & g[9])
        | (((p[13] & p[12]) & (p[11] & p[10])) & (p[9] & g[8]))
        | (((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & g[7]))
        | (((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & (p[7] & g[6])))
        | ((((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & (p[7] & p[6]))) & g[5])
        | ((((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & (p[7] & p[6]))) & (p[5] & g[4]))
        | ((((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & (p[7] & p[6]))) & ((p[5] & p[4]) & g[3]))
        | ((((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & (p[7] & p[6]))) & ((p[5] & p[4]) & (p[3] & g[2])))
        | ((((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & (p[7] & p[6]))) & (((p[5] & p[4]) & (p[3] & p[2])) & g[1]))
        | ((((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & (p[7] & p[6]))) & (((p[5] & p[4]) & (p[3] & p[2])) & p[1] & g[0]))
        | ((((p[13] & p[12]) & (p[11] & p[10])) & ((p[9] & p[8]) & (p[7] & p[6]))) & (((p[5] & p[4]) & (p[3] & p[2])) & ((p[1] & p[0]) & cin)));
    assign ctemp[14] = g[14] | (p[14] & g[13])
        | ((p[14] & p[13]) & g[12])
        | ((p[14] & p[13]) & (p[12] & g[11]))
        | (((p[14] & p[13]) & (p[12] & p[11])) & g[10])
        | (((p[14] & p[13]) & (p[12] & p[11])) & (p[10] & g[9]))
        | (((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & g[8]))
        | (((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & g[7])))
        | ((((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & p[7]))) & g[6])
        | ((((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & p[7]))) & (p[6] & g[5]))
        | ((((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & p[7]))) & ((p[6] & p[5]) & g[4]))
        | ((((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & p[7]))) & ((p[6] & p[5]) & (p[4] & g[3])))
        | ((((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & p[7]))) & (((p[6] & p[5]) & (p[4] & p[3])) & g[2]))
        | ((((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & p[7]))) & (((p[6] & p[5]) & (p[4] & p[3])) & (p[2] & g[1])))
        | ((((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & p[7]))) & (((p[6] & p[5]) & (p[4] & p[3])) & ((p[2] & p[1]) & g[0])))
        | ((((p[14] & p[13]) & (p[12] & p[11])) & ((p[10] & p[9]) & (p[8] & p[7]))) & (((p[6] & p[5]) & (p[4] & p[3])) & (((p[2] & p[1]) & (p[0] & cin)))));
    assign cout = g[15] | (p[15] & g[14])
        | ((p[15] & p[14]) & g[13])
        | ((p[15] & p[14]) & (p[13] & g[12]))
        | (((p[15] & p[14]) & (p[13] & p[12])) & g[11])
        | (((p[15] & p[14]) & (p[13] & p[12])) & (p[11] & g[10]))
        | (((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & g[9]))
        | (((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & g[8])))
        | ((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & g[7])
        | ((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & (p[7] & g[6]))
        | ((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & ((p[7] & p[6]) & g[5]))
        | ((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & ((p[7] & p[6]) & (p[5] & g[4])))
        | ((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & (((p[7] & p[6]) & (p[5] & p[4])) & g[3]))
        | ((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & (((p[7] & p[6]) & (p[5] & p[4])) & (p[3] & g[2])))
        | ((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & (((p[7] & p[6]) & (p[5] & p[4])) & ((p[3] & p[2]) & g[1])))
        | ((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & (((p[7] & p[6]) & (p[5] & p[4])) & ((p[3] & p[2]) & (p[1] & g[0]))))
        | (((((p[15] & p[14]) & (p[13] & p[12])) & ((p[11] & p[10]) & (p[9] & p[8]))) & (((p[7] & p[6]) & (p[5] & p[4])) & ((p[3] & p[2]) & (p[1] & p[0])))) & cin);

    //和输出
    assign sum[0] = a[0] ^ b[0] ^ cin;
    assign sum[1] = a[1] ^ b[1] ^ ctemp[0];
    assign sum[2] = a[2] ^ b[2] ^ ctemp[1];
    assign sum[3] = a[3] ^ b[3] ^ ctemp[2];
    assign sum[4] = a[4] ^ b[4] ^ ctemp[3];
    assign sum[5] = a[5] ^ b[5] ^ ctemp[4];
    assign sum[6] = a[6] ^ b[6] ^ ctemp[5];
    assign sum[7] = a[7] ^ b[7] ^ ctemp[6];
    assign sum[8] = a[8] ^ b[8] ^ ctemp[7];
    assign sum[9] = a[9] ^ b[9] ^ ctemp[8];
    assign sum[10] = a[10] ^ b[10] ^ ctemp[9];
    assign sum[11] = a[11] ^ b[11] ^ ctemp[10];
    assign sum[12] = a[12] ^ b[12] ^ ctemp[11];
    assign sum[13] = a[13] ^ b[13] ^ ctemp[12];
    assign sum[14] = a[14] ^ b[14] ^ ctemp[13];
    assign sum[15] = a[15] ^ b[15] ^ ctemp[14];
endmodule