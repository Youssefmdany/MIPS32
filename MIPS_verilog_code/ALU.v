

module ALU(Src_A,Src_B,ALU_control,ALU_result,zero_sig);

parameter add=3'b010,anding=3'b000,oring=3'b001,sub=3'b110,SLT=3'b111;

input[31:0]Src_A,Src_B; //2 source operands rs ,rt

input[2:0]ALU_control; 

output[31:0]ALU_result;

reg[31:0]ALU_result;

output zero_sig;

reg zero_sig;


always@(*)

begin

case(ALU_control)

          add: ALU_result <= Src_A + Src_B; //addition 
	  
	  sub: ALU_result <= Src_A - Src_B;  //subtraction
	  
	  anding: ALU_result <= Src_A & Src_B; // and operation
	  
	  oring: ALU_result <= Src_A | Src_B; // or operation
	  
	  SLT: begin
	        
			  if(Src_A<Src_B) //if the first source operands(rs) less than the second source operands(rt)
			  
			     ALU_result<=1;
				  
			  else 
			  
			     ALU_result<=0;
	       end	  

	  default:  ALU_result<=32'bx;
	  
endcase

if(ALU_result==0) //means rt>rs

   zero_sig<=1'b1;
	
else 
   zero_sig<=1'b0;

end



endmodule
