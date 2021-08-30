module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    always @ (posedge clk) 
        case ({E, L})
            2'b00 : Q <= Q;
            2'b01 : Q <= R;
            2'b10 : Q <= w;
            2'b11 : Q <= R;
        endcase
    
    //alternate method with 2 ternary operator (cond ? iftrue : iffalse)
    /*
    wire d, wire_mux;
    assign wire_mux = E ? w : Q;
    assign d = L ? R : wire_mux;
    always @ (posedge clk)
        Q <= d;
    */

endmodule
