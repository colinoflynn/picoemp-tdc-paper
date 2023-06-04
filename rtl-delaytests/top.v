`include "settings.v"

`define DELAY_ITEMS 1

module blink_test (
	input CLK_IN,      //-- 12 Mhz
	output GPIO1,
	output GPIO2
);

    wire CLK;
	wire [`DELAY_ITEMS:0] dly;

    //assign CLK = CLK_IN;
	pll pll_inst(.clock_in(CLK_IN), .clock_out(CLK));

	
    assign dly[0] = CLK;

	genvar i;
	generate
	for (i=0; i < `DELAY_ITEMS; i=i+1) begin: generate_delay

        if (i == 0) begin (* BEL="X9/Y1/lc5", keep *) //As good a place as any to start
		   SB_LUT4 SB_LUT4_inst ( .O (dly[i+1]), // output 
                         .I0 (1'b0), // data input 0
                         .I1 (1'b0), // data input 1
                         .I2 (1'b0), // data input 2
                         .I3 (dly[i]) // data input 3
                        );
   		   defparam SB_LUT4_inst.LUT_INIT=16'b1111111100000000;
		
		/*
            SB_CARRY carry_inst_tdc (
                .CO(dly[i+1]), //Carry out
                  .I0(1'b0),     //I0
                  .I1(1'b1),     //I1
                .CI(dly[i])
            ); //Carry in
			*/
			end

		if (i > 0) begin  (*keep*)
		   SB_LUT4 SB_LUT4_inst ( .O (dly[i+1]), // output 
                         .I0 (1'b0), // data input 0
                         .I1 (1'b0), // data input 1
                         .I2 (1'b0), // data input 2
                         .I3 (dly[i]) // data input 3
                        );
   			defparam SB_LUT4_inst.LUT_INIT=16'b1111111100000000;
		/*
		            SB_CARRY carry_inst_inputdly (
                    .CO(dly[i+1]), //Carry out
                    .I0(1'b0),     //I0
                    .I1(1'b1),     //I1
                    .CI(dly[i])
            );
		*/
		end
	end
	endgenerate


	assign GPIO1 = CLK;
	assign GPIO2 = dly[`DELAY_ITEMS];

endmodule
