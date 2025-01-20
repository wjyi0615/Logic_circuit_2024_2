module Receipt (
	input wire clk,
	input wire Address1, Address2, Address3, Address4,
	input wire IN1, IN2, IN3, IN4, IN5, IN6, IN7, IN8,
	input wire write,
	output reg out1, out2, out3, out4, out5, out6, out7, out8
);

	wire [3:0] address = {Address4, Address3, Address2, Address1};
	wire [7:0] data_in = {IN8, IN7, IN6, IN5, IN4, IN3, IN2, IN1};
	
	reg [7:0] data_out;
	
	reg [7:0] ram [15:0];
	
	initial begin
		$readmemh("Receipt.hex", ram);
	end
	
	always @(posedge clk) begin
		if (write)
			ram[address] <= data_in;
		else
			data_out <= ram[address];
	end
	
	always @(*) begin
		{out8, out7, out6, out5, out4, out3, out2, out1} = data_out;
	end
endmodule