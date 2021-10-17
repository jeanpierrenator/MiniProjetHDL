module GestionAd (RetourArriere, Mode, AdMax, AdOut1, AdOut2);

parameter POLARITY_RA = 1; // Front Montant =  '1' / Front Descendant  = '0'
parameter MODE = 1; //Mode normal = '1'	/ mode Review = '0' 

input RetourArriere;
input Mode;
input [6:0] AdMax;

output [6:0] AdOut1;
output [6:0] AdOut2;

reg [6:0] AdOut1;
reg [6:0] AdOut2;

wire PolRetourArriere;
assign PolRetourArriere = (POLARITY_RA == 1)? RetourArriere : ~RetourArriere; 

wire PolMode;
assign PolMode = (MODE == 1)? Mode : ~Mode;

always@(posedge(PolRetourArriere))
begin
	if (PolMode==0)
	begin
		AdOut1 <= AdOut1-1;
	end
end

always@(PolMode)
begin
	if (PolMode==1)
	begin
		AdOut2 <= AdMax;
	end
	if (PolMode==0)
	begin
		AdOut2 <= 7'bZZZZ;
	end
end

endmodule
