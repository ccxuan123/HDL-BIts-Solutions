module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    
    wire [31:0] tmp_b;
    wire cout0, cout1;
    
    assign tmp_b =  b[31:0] ^ {32{sub}};
    add16 adder_lo ( a[15:0],  tmp_b[15:0],  sub,   sum[15:0],  cout0 );
    add16 adder_hi ( a[31:16], tmp_b[31:16], cout0, sum[31:16], cout1 );

endmodule
