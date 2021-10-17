module ModuleTirage (CntModuloReg, TriggerTirage, NbrTire);

parameter POLARITY_TIRAGE = 0;  //Front Montant = '1' / Front descendant = '0'

input [6:0] CntModuloReg;
input TriggerTirage;

output [6:0] NbrTire;

reg [6:0] NbrTire;

wire PolTrig;
assign PolTrig = (POLARITY_TIRAGE == 1)? ~TriggerTirage : TriggerTirage;

always@(posedge(PolTrig))
begin
	NbrTire <= CntModuloReg;
end

endmodule