module GestionMemLibre (Clk, AdModulo, AdMax, DataBusOut,DataOutTir, DataBusIn, AdMem, RW, Latch,Reset);

parameter ETAT1 = 0;		
parameter ETAT2 = 1;		
parameter ETAT3 = 2;		
parameter ETAT4 = 3;		
parameter ETAT5 = 4;		
parameter ETAT6 = 5;
parameter ETAT7 = 6;
parameter ETAT8 = 7;
parameter ETAT9 = 8;
parameter ETAT10 =9;
parameter ETAT11 = 10;
parameter ETAT12 = 11;
parameter ETAT13 = 12;
parameter ETAT14 = 13;
parameter ETAT15 = 14;
parameter ETAT16 = 15;
parameter SIZE_MEM =90;

input Clk, Reset;
input [6:0] AdModulo;	
input [6:0] AdMax;		
input [6:0] DataBusOut;

output [6:0] DataOutTir;
output [6:0] DataBusIn;
output [6:0] AdMem;
output RW;
output Latch;

reg Latch = 0;
reg RW = 0;
reg [6:0] DataOutTir;
reg [6:0] DataBusIn;
reg [6:0] AdMem;
reg [4:0] EtatActuel;
reg [4:0] EtatFutur;
reg [6:0] OldAdModulo =0;
reg [6:0] i;

always@(negedge (Clk))
begin

		if (EtatActuel ==  ETAT1)
        begin 
				if(AdModulo != OldAdModulo)
					begin
						EtatActuel <= ETAT2;
						OldAdModulo <= AdModulo;
					end
				end
				else
				begin
	EtatActuel <= EtatFutur;
	end
	
end


always@(EtatActuel)
begin

	case(EtatActuel)
		ETAT2 : 
				begin
				AdMem <= OldAdModulo;
				RW <= 1;
				end
		ETAT3 :
				begin
				Latch <= 1;
				end
		ETAT4 : 
				begin
				Latch <= 0;
				end
		ETAT5 : 
				begin
					DataOutTir <= DataBusOut;

				end
		ETAT6 : 
				begin
				AdMem <= (SIZE_MEM -1) - AdMax;
				RW <= 0;
				end
		ETAT7 :
				begin
				Latch <= 1;
				end
		ETAT8 : 
				begin
				Latch <= 0;
				end
		ETAT9 :
				begin
					DataBusIn <= DataBusOut;
					AdMem <= OldAdModulo;
					RW <= 1;
				end 
		ETAT10 : 
				begin
				Latch <= 1;
				end 
		ETAT11 :
			   begin
				Latch <= 0;
				end
		ETAT12 :
				begin
					i = i+1;
				end
		ETAT13:
				begin
				DataBusIn = i+1;
				AdMem = i;
				RW = 1;
				end 
		ETAT14:
				begin
				Latch = 1;
				end 
		ETAT15:
				begin
				Latch = 0;
				end 
		ETAT16:
				begin
				i = 0;
				end
		default : Latch <= 0; 
		
		endcase
end

always@(EtatActuel,AdModulo)
begin
if(Reset == 1)
begin
	EtatFutur <= ETAT16;
end
else
begin
	case (EtatActuel)
		ETAT1 :
				begin
				EtatFutur <= ETAT1;
				end
		ETAT2 : 
				begin
				EtatFutur <= ETAT3;
				end
		ETAT3 :
				begin
				EtatFutur <= ETAT4;
				end
		ETAT4 : 
				begin
				EtatFutur <= ETAT5;
				end
		ETAT5 : 
				begin
				EtatFutur <= ETAT6;
				end
		ETAT6 : 
				begin
				EtatFutur <= ETAT7;
				end
		ETAT7 : 
				begin
				EtatFutur <= ETAT8;
				end
		ETAT8 : 
				begin
				EtatFutur <= ETAT9;
				end
		ETAT9 : 
				begin
				EtatFutur <= ETAT10;
				end
		ETAT10 : 
				begin
				EtatFutur <= ETAT11;
				end
		ETAT11 : 
				begin
				EtatFutur <= ETAT1;
				end
		ETAT12 :
				begin
					if(i >= SIZE_MEM-1)
					begin
					EtatFutur <= ETAT1;
					end
					else 
					begin
					EtatFutur <= ETAT13;
					end
				end
		ETAT13:
				begin
				EtatFutur <= ETAT14;
				end 
		ETAT14:
				begin
				EtatFutur <= ETAT15;
				end 
		ETAT15:
				begin
				EtatFutur <= ETAT12;
				end 
		ETAT16:
				begin
				EtatFutur <= ETAT12;
				end
		default : EtatFutur <= ETAT1;	
	endcase
end
end

endmodule