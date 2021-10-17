module ConvertisseurBCD(binaireIn,bcdOut);

    
    input [7:0] binaireIn;

    output [7:0] bcdOut;

    reg [7 : 0] bcdOut; 
    reg [3:0] i;   
     

     always @(binaireIn)
        begin
            bcdOut = 0; 
            for (i = 0; i < 8; i = i+1) 
            begin
                bcdOut = {bcdOut[7:0],binaireIn[7-i]}; 
                      
                if(i < 7 && bcdOut[3:0] > 4) 
                    bcdOut[3:0] = bcdOut[3:0] + 3;
                if(i < 7 && bcdOut[7:4] > 4)
                    bcdOut[7:4] = bcdOut[7:4] + 3;

            end
        end     
                
endmodule