module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); 
    MUXDFF u0_MUXDFF (
        .clk	(KEY[0] ),
        .w	(KEY[3] ),
        .R	(SW[3]  ),
        .E	(KEY[1] ),
        .L	(KEY[2] ),
        .Q	(LEDR[3]) 
    );
    MUXDFF u1_MUXDFF (
        .clk	(KEY[0] ),
        .w	(LEDR[3]),
        .R	(SW[2]  ),
        .E	(KEY[1] ),
        .L	(KEY[2] ),
        .Q	(LEDR[2]) 
    );
    MUXDFF u2_MUXDFF (
        .clk	(KEY[0] ),
        .w	(LEDR[2]),
        .R	(SW[1]  ),
        .E	(KEY[1] ),
        .L	(KEY[2] ),
        .Q	(LEDR[1]) 
    );
    MUXDFF u3_MUXDFF (
        .clk	(KEY[0] ),
        .w	(LEDR[1]),
        .R	(SW[0]  ),
        .E	(KEY[1] ),
        .L	(KEY[2] ),
        .Q	(LEDR[0]) 
    );
endmodule


module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);
    always @ (posedge clk) 
        if (L) begin
            Q <= R;
        end
    	else begin
            if (E) begin
                Q <= w;
            end
            else begin
                Q <= Q;
            end
        end
endmodule
