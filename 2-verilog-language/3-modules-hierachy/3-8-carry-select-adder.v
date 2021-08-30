// compiling warning
// Warning (12241): 3 hierarchies have connectivity warnings
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire cout, cout_ign; // wire cout_ign is ignored
    wire [15:0] alt_sum0, alt_sum1; 
    
    add16 adder_lo   ( a[15:0],  b[15:0],  0, sum[15:0],      cout );
    add16 adder_sel0 ( a[31:16], b[31:16], 0, alt_sum0[15:0], cout_ign );
    add16 adder_sel1 ( a[31:16], b[31:16], 1, alt_sum1[15:0], cout_ign );
    
    // 2 to 1 multiplexer
    always @ (cout, alt_sum0, alt_sum1)
        case (cout)
            1'b0 : sum[31:16] = alt_sum0[15:0];
            1'b1 : sum[31:16] = alt_sum1[15:0];
        endcase
    
endmodule