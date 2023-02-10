

module mux32_2_1(in1,in2,Sel,out);

input[31:0]in1,in2;

input Sel;

output[31:0]out;

reg[31:0]out;


always@(*)
begin 

if(Sel)
   out<=in2;
	
else if(!Sel)
   out<=in1;


end


endmodule