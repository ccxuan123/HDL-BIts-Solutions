module top_module (
    input clk,
    input d, 
    input r,   // synchronous reset
    output q
);
    // this method works but come with truncated value warning
    // always @ (posedge clk)
    //     q <= r ? 0 : d;
   
    always @ (posedge clk)
        if (r)
            q <= 0;
    	else
            q <= d;

endmodule
