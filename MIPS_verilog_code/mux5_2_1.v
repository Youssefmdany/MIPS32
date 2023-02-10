module mux5_2_1(in1,in2,Sel,out);

input[4:0]in1,in2;

input Sel;

output[4:0]out;

reg[4:0]out;


always@(*)
begin 

if(Sel)
   out<=in2;
	
else if(!Sel)
   out<=in1;


end


endmodule