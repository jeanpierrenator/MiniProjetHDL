module Memory(latch,RW,DataBusIn,DataBusOut,addIn);

parameter BUS_SIZE = 7;
parameter MEMORY_SIZE = 90;
parameter BLOCK_SIZE = 7;
parameter POL_LATCH =1;
parameter POL_RW = 1;
input latch,RW;
input[(BUS_SIZE-1):0] addIn;
input [(BUS_SIZE-1):0] DataBusIn;

wire ilatch,iRW;
output [(BUS_SIZE-1):0] DataBusOut;
reg [(BUS_SIZE-1):0] DataBusOut;

reg [(BLOCK_SIZE-1):0] memory[0:(MEMORY_SIZE-1)];

assign ilatch = (POL_LATCH == 1)?latch : ~latch;
assign iRW = (POL_RW == 1)?RW : ~RW;

always @(posedge(ilatch))
begin


	if(iRW)
	begin
		DataBusOut <= memory[addIn];
	end
	else
	begin 
		memory[addIn] <= DataBusIn;
	end
end




endmodule 