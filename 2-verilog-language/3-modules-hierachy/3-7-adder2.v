// incorrect answer
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    
    wire add16_cout;
    wire add1_cout_0;
    wire add1_cout_1;
    wire add1_cout_2;
    wire add1_cout_3;
    wire add1_cout_4;
    wire add1_cout_5;
    wire add1_cout_6;
    wire add1_cout_7;
    wire add1_cout_8;
    wire add1_cout_9;
    wire add1_cout_10;
    wire add1_cout_11;
    wire add1_cout_12;
    wire add1_cout_13;
    wire add1_cout_14;
    wire add1_cout_15;
    
    add1 add1_0  ( a[0],  b[0],  0,            sum[0],  add1_cout_0 );
    add1 add1_1  ( a[1],  b[1],  add1_cout_0,  sum[1],  add1_cout_1 );
    add1 add1_2  ( a[2],  b[2],  add1_cout_1,  sum[2],  add1_cout_2 );
    add1 add1_3  ( a[3],  b[3],  add1_cout_2,  sum[3],  add1_cout_3 );
    add1 add1_4  ( a[4],  b[4],  add1_cout_3,  sum[4],  add1_cout_4 );
    add1 add1_5  ( a[5],  b[5],  add1_cout_4,  sum[5],  add1_cout_5 );
    add1 add1_6  ( a[6],  b[6],  add1_cout_5,  sum[6],  add1_cout_6 );
    add1 add1_7  ( a[7],  b[7],  add1_cout_6,  sum[7],  add1_cout_7 );
    add1 add1_8  ( a[8],  b[8],  add1_cout_7,  sum[8],  add1_cout_8 );
    add1 add1_9  ( a[9],  b[9],  add1_cout_8,  sum[9],  add1_cout_9 );
    add1 add1_10 ( a[10], b[10], add1_cout_9,  sum[10], add1_cout_10 );
    add1 add1_11 ( a[11], b[11], add1_cout_10, sum[11], add1_cout_11 );
    add1 add1_12 ( a[12], b[12], add1_cout_11, sum[12], add1_cout_12 );
    add1 add1_13 ( a[13], b[13], add1_cout_12, sum[13], add1_cout_13 );
    add1 add1_14 ( a[14], b[14], add1_cout_13, sum[14], add1_cout_14 );
    add1 add1_15 ( a[15], b[15], add1_cout_14, sum[15], add1_cout_15 );
    
    add16 add16_up ( a[31:16], b[31:16], add1_cout_15, sum[31:16], add16_cout );

endmodule

        
module add1 ( 
    input a, 
    input b, 
    input cin, 
    output sum, 
    output cout 
);
	// Full adder module here
    assign sum = a^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;

endmodule