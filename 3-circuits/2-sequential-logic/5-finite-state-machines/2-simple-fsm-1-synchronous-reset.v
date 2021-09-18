// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter A=1'b0, B=1'b1;
    reg present_state, next_state;
	//initial present_state = B;
    
    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= B;
            out <= 1;     // to reset the output at State B
        end else begin
            case (present_state)
                // Fill in state transition logic
                A : next_state = (in) ? A : B;
                B : next_state = (in) ? B : A;
            endcase

            // State flip-flops
            present_state = next_state;   

            case (present_state)
                // Fill in output logic
                A : out = 0;
                B : out = 1;
            endcase
        end
    end

endmodule
