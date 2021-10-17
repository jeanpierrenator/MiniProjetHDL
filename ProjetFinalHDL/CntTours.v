module CntTours(clk, S,nSet,nReset);

parameter MODULO = 10;
parameter BUS_SIZE = 4;
parameter POLARITY_NSET = 0;
parameter POLARITY_NRESET = 0;
parameter POLARITY_CLK = 1;//0 front descendant

input clk;
input nSet,nReset;

output[(BUS_SIZE-1):0] S;
reg[(BUS_SIZE-1):0] S;

wire polClk;
assign polClk = (POLARITY_CLK == 0)? clk : ~clk;


always @(negedge(polClk))

begin
	if (nReset == POLARITY_NRESET)
	begin
		S<=0;
	end
	else
	begin
		if (nSet == POLARITY_NSET)
		begin
			S <= (MODULO - 1);
		end
		else
		begin
			if( S >= (MODULO-1))
			begin
				S <= 0;
			end
			else
			begin
				S <= S+1;
			end
		end
	end
end


endmodule