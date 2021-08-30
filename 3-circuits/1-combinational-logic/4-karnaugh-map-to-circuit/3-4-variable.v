module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  
); 
    // d in kmap means don't care?
    
	// SOP:
    //assign out = a|(~a&~b&c);
    assign out = a | (~b&c);
    
    // POS:
    // assign out = (a|~b)&(a|b|c);
    
endmodule
