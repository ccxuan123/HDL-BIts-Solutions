module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    
    // out_both[n]==1 if only both in[n] and in[n+1] are 1
    assign out_both[0] = in[0] & in[1] ;
    assign out_both[1] = in[1] & in[2] ;
    assign out_both[2] = in[2] & in[3] ;
    
    // out_any[n]==1 if only both in[n] and in[n-1] are 1
    assign out_any[1] = in[1] | in[0] ;
    assign out_any[2] = in[2] | in[1] ;
    assign out_any[3] = in[3] | in[2] ;
    
    // out_different[n]==1 if in[n] and in[n+1] are different
    // special case: if n=3, in[n+1]=in[0]
    assign out_different[0]  = in[0] ^ in[1];
    assign out_different[1]  = in[1] ^ in[2];
    assign out_different[2]  = in[2] ^ in[3];
    assign out_different[3]  = in[3] ^ in[0];
    
    // solution above can be simplified with 
    // concantenation operator {} or part select vector [i:j]
    //
    // assign out_both = in[2:0] & in[3:1] ;
    // assign out_any = in[3:1] | in[2:0];
    // assign out_different = in ^ {in[0], in[3:1]};
    
endmodule
