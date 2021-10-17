module Aff7SegHexa (Byte, Msq, Lsq);

parameter OUTPUT_POLARITY = 1; // '0' allume ou '1' allume

input [7:0] Byte;

output [0:6] Msq;
output [0:6] Lsq;
reg [0:6] iLsq;
reg [0:6] iMsq;

always @(Byte)
begin

	case (Byte[7:4])
		4'b0000 : iMsq[0:6] <= 7'b1111110;
		4'b0001 : iMsq[0:6] <= 7'b0110000;
		4'b0010 : iMsq[0:6] <= 7'b1101101;
		4'b0011 : iMsq[0:6] <= 7'b1111001;
		4'b0100 : iMsq[0:6] <= 7'b0110011;
		4'b0101 : iMsq[0:6] <= 7'b1011011;
		4'b0110 : iMsq[0:6] <= 7'b1011111;
		4'b0111 : iMsq[0:6] <= 7'b1110000;
		4'b1000 : iMsq[0:6] <= 7'b1111111;
		4'b1001 : iMsq[0:6] <= 7'b1111011;
		4'b1010 : iMsq[0:6] <= 7'b1110111;
		4'b1011 : iMsq[0:6] <= 7'b0011111;
		4'b1100 : iMsq[0:6] <= 7'b1001110;
		4'b1101 : iMsq[0:6] <= 7'b0111101;
		4'b1110 : iMsq[0:6] <= 7'b1001111;
		4'b1111 : iMsq[0:6] <= 7'b1000111;
	endcase
	
	case (Byte[3:0])
		4'b0000 : iLsq[0:6] <= 7'b1111110;
		4'b0001 : iLsq[0:6] <= 7'b0110000;
		4'b0010 : iLsq[0:6] <= 7'b1101101;
		4'b0011 : iLsq[0:6] <= 7'b1111001;
		4'b0100 : iLsq[0:6] <= 7'b0110011;
		4'b0101 : iLsq[0:6] <= 7'b1011011;
		4'b0110 : iLsq[0:6] <= 7'b1011111;
		4'b0111 : iLsq[0:6] <= 7'b1110000;
		4'b1000 : iLsq[0:6] <= 7'b1111111;
		4'b1001 : iLsq[0:6] <= 7'b1111011;
		4'b1010 : iLsq[0:6] <= 7'b1110111;
		4'b1011 : iLsq[0:6] <= 7'b0011111;
		4'b1100 : iLsq[0:6] <= 7'b1001110;
		4'b1101 : iLsq[0:6] <= 7'b0111101;
		4'b1110 : iLsq[0:6] <= 7'b1001111;
		4'b1111 : iLsq[0:6] <= 7'b1000111;
	endcase
	
end

assign Msq = (OUTPUT_POLARITY==1)?iMsq:~iMsq;
assign Lsq = (OUTPUT_POLARITY==1)?iLsq:~iLsq;

endmodule
			