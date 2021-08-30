module top_module( 
    input a, b, sel,
    output out ); 

    assign out = ( (sel==1) ? b : a); 
    
    // Mux expressed as AND and OR
    // assign out = (sel & b) | (~sel & a);	

endmodule