module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum 
);
    
    wire [99:0] wire_cout;
    bcd_fadd FA_0 (a[3:0], b[3:0], cin, wire_cout[0], sum[3:0]);
    
    genvar i;
    generate
        for (i=1; i<100; i=i+1) begin : bcd_fadd_block
            bcd_fadd FA_1 (
                a[i*4+3:i*4], 
                b[i*4+3:i*4], 
                wire_cout[i-1], 
                wire_cout[i], 
                sum[i*4+3:i*4]
            );
        end
    endgenerate
    
    assign cout = wire_cout[99];
    
endmodule
