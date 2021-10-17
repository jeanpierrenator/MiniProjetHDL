module GestionMemoirSauvegarde(Clk,AddIn,DataIn,DataOut,AddOut,DataBusOut,DataBusIn,Latch,RW);

parameter WAIT =0;
parameter PREPARE_READ =1;
parameter PREPARE_WRITE=2;
parameter LATCH1_READ =3;
parameter LATCH0_READ =4;
parameter LATCH1_WRITE =5;
parameter LATCH0_WRITE = 6;
parameter PRINT_VALUE = 7;
input[6 : 0] AddIn;
input[6 : 0] DataBusOut;
input[6 : 0] DataIn;
input Clk;



output[6:0] DataOut,AddOut,DataBusIn;
output Latch,RW;

reg [3:0] EtatActuel;
reg [3:0] EtatFutur;
reg Latch,RW;
reg[6:0] DataOut,AddOut,DataBusIn,LastAddIn,LastDataIn;

always@(negedge(Clk))
begin
if (EtatActuel == WAIT)
begin

if(LastDataIn != DataIn)
begin
	EtatActuel <= PREPARE_READ;
	LastDataIn <= DataIn;
end
else 
begin 
	if(LastAddIn != AddIn)
	begin
	EtatActuel <= PREPARE_WRITE;
	LastAddIn <= AddIn;
	end
	else 
	begin
	EtatActuel <= EtatFutur;
	end
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
		WAIT: begin
				end	
		PREPARE_READ : begin
							RW <= 1;
							AddOut <= AddIn;
							end
		PREPARE_WRITE: begin
								RW <= 0;
							AddOut <= AddIn;
							DataBusIn = DataIn;
							end
		LATCH1_READ : begin
							Latch <=1;
							end
		LATCH0_READ : begin
							Latch <=0;
							end
		LATCH1_WRITE:
							begin
							Latch <=1;
							end
		LATCH0_WRITE:
							begin
								Latch <=0;
							end 
		PRINT_VALUE:
							begin
							DataOut <= DataBusOut;
							end
	endcase
end 

always@(EtatActuel)
begin
case(EtatActuel)
		WAIT: begin
				EtatFutur <= WAIT;
				end	
		PREPARE_READ : begin
							EtatFutur <= LATCH1_READ;
							end
		PREPARE_WRITE: begin
								EtatFutur <= LATCH1_WRITE;
							end
		LATCH1_READ : begin
							EtatFutur <= LATCH0_READ;
							end
		LATCH0_READ : begin
							EtatFutur <= PRINT_VALUE;
							end
		LATCH1_WRITE:
							begin
							EtatFutur <= LATCH0_WRITE;
							end
		LATCH0_WRITE:
							begin
								EtatFutur <= PRINT_VALUE;
							end 
		PRINT_VALUE:
							begin
								EtatFutur <= WAIT;
							end
	endcase
end


endmodule