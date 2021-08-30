module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q
);
    // this method works but come with truncated value warning
    // always @ (posedge clk or posedge ar)
    //     q <= ar ? 0 : d;
    
    always @ (posedge clk or posedge ar)
        if (ar)
            q <= 0;
    	else 
            q <= d;
    
endmodule
