module top_module(
	input ring, 
	input vibrate_mode,
	output ringer,
	output motor
);
	
	// ringer only rings when ring==1 and vibrate_mode==0
	assign ringer = ring & ~vibrate_mode;
	
	// motor only vibrate when ring==1 and vibrate_motor==0
	assign motor = ring & vibrate_mode;
	
endmodule
