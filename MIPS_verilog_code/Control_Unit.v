

module Control_Unit(opcode,MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,ALUOp,ALU_control,Funct);

parameter R_type=6'b000000,lw=6'b100011,sw=6'b101011,beq=6'b000100;// i and  R types instructions

parameter  add=6'b100000,sub=6'b100010,anding=6'b100100,oring=6'b100101,SLT=6'b101010; // R-type functions

input[5:0]opcode;// the last six bit of instruction which indicates the instruction type

input[5:0]Funct; //the function required

output MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite; //control unit outputs

reg MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite;

output[1:0] ALUOp;//the output from main decoder

reg[1:0] ALUOp;

output[2:0] ALU_control; //the control signal which tell ALU which operation is needed

reg[2:0] ALU_control;


always@(*)

begin
 
   MemtoReg<=1'b0;
   MemWrite<=1'b0;
   Branch<=1'b0;
   ALUSrc<=1'b0;
   RegDst<=1'b0;
   RegWrite<=1'b0;


case(opcode)

        R_type: begin    //in case of R-type instruction
		           
					  RegWrite<=1'b1; //write in registers files
					  RegDst<=1'b1; //make rd the destination register
					  
					  case(Funct) 
					  
					    add:  ALU_control<=3'b010;
						 
						 sub:  ALU_control<=3'b110;
					    
						 anding:  ALU_control<=3'b000;

						 oring:  ALU_control<=3'b001;

						 SLT:  ALU_control<=3'b111;

						 default: ALU_control<=3'bxxx;
						 
                                                 endcase
						 
		end
						 
        lw: begin  //in case of load word instruction
		  
		                          RegWrite<=1'b1; //write in registers files
					  ALUSrc<=1'b1; // read the sign-extended immediate
					  ALU_control<=3'b010; //add the two operands
                                          MemtoReg<=1'b1; //take reading data from data memory
                                          
			   end
		   
			sw: begin  //in case of store word instruction
			         
					  MemWrite<=1'b1;  //write in data memory
					  ALUSrc<=1'b1;  // read the sign-extended immediate
					  ALU_control<=3'b010;  //add the two operands
					  
			    end
					  
			beq: begin //in case of branch if equal instruction
			        
					  Branch<=1'b1;  //take branch
					  ALU_control<=3'b110;  //subtract the two operands
					  
			    end
			
			default: ALU_control<=3'bxxx;

	endcase
		  


end


endmodule

