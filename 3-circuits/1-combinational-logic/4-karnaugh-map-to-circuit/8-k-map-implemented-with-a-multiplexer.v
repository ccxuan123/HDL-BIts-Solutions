module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 

    assign mux_in[0] = c ? 1 : (d ? 1 : 0); // 2 mux
    assign mux_in[1] = 0;                   // no mux
    assign mux_in[2] = d ? 0 : 1;           // 1 mux
    assign mux_in[3] = c ? (d ? 1 : 0) : 0; // 2 mux

    // with logic gates only
    // assign mux_in[0] = c | d;
    // assign mux_in[1] = 0;
    // assign mux_in[2] = ~d;
    // assign mux_in[3] = c & d;
    
endmodule
