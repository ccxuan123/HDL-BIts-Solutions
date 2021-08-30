module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min
);
    // assign intermediate_result1 = compare? true: false;
    wire [7:0] int1
    wire [7:0] int2;
    assign int1 = (a < b) ? a : b ;
    assign int2 = (int1 < c) ? int1 : c ;
    assign min = (int2 < d) ? int2 : d ;

endmodule
