odule Loto (Clk, BPBack, BPReview, BPReset, BPTirage, A1, A2, A3, A4);
input Clk, BPBack, BPReview, BPReset, BPTirage;
output [6:0] A1;
output [6:0] A2;
output [6:0] A3;
output [6:0] A4;

wire [6:0] A, [6:0] B, [6:0] C, [6:0] D, [6:0] E, [6:0] F, [6:0] G, [6:0] H, [6:0] I, [6:0] J;

CmpModuloReglable#()
	CntModReg(Clk, nSet, nReset, modulo, S);

GestionAd#()
	GestionAdresse(RetourArriere, Mode, AdMax, AdOut1, AdOut2);

ModuleTirage#()
	ModTir(TriggerTirage, CntModuloReg, NbrTire) ;

Memory#()
	MemLibre(AddIn, DataBusIn, DataBusOut, Latch, R/W) ;
	MemSave(AddIn, DataBusIn, DataBusOut, Latch, R/W) ;

GestionMemLibre#()
GestionMemoireLibre(AddIn, DataBusIn, DataBusOut, Latch, R/W, DataOut, AdModulo, AdMax, Clk, Reset);

CntTours#()
	CntToursJoué(nReset, nSet, Clk, S);

GestionMemoireSauvegardé#()
	GestionMemSave(AddIn, DataOut, DataIn, Clk, AddOut, DataBusIn, DataBusOut, Latch, R/W);

ConvertisseurBCD#()
	ConvAff12(BinaireIn, BCDOut);
	ConvAff34(BinaireIn, BCDOut);

Aff7SegHexa#()
	Aff12(Byte, Msq, Lsq);
	Aff34(Byte, Msq, Lsq);


endmodule
