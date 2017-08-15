
module top (
	input  iCE_CLK,
	output LED0,
	output LED1,
	output LED2,
	output LED3,
	output LED4,
	output LED5,
	output LED6,
	output LED7
);
	localparam MAX_VAL = 600000;
	reg [31:0] counter = 0;
	reg [7:0]  shift_reg = 1;

	always @(posedge iCE_CLK) begin
		counter <= counter + 1;
		if (counter>=MAX_VAL) begin
			shift_reg <= (shift_reg==8'h80) ? 1 : shift_reg << 1;
			counter <= 0;
		end
	end
	assign {LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7} = shift_reg;

endmodule
