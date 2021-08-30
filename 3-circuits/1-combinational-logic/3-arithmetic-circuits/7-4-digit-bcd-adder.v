module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [2:0] o;
    bcd_fadd B_FA1 (a[3:0],   b[3:0],   cin,  o[0], sum[3:0]  );
    bcd_fadd B_FA2 (a[7:4],   b[7:4],   o[0], o[1], sum[7:4]  );
    bcd_fadd B_FA3 (a[11:8],  b[11:8],  o[1], o[2], sum[11:8] );
    bcd_fadd B_FA4 (a[15:12], b[15:12], o[2], cout, sum[15:12]);
    
endmodule
