

module add4_PC(curr_PC,next_PC);

input[31:0]curr_PC; //current program counter address

output[31:0]next_PC; //next program counter address

reg[31:0]next_PC;


always@(*)

begin 

next_PC<=curr_PC+4; //add 4 because eace word  bit data consist of 4 bytes

end 


endmodule
