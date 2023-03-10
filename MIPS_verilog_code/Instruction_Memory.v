


module Instruction_Memory(PC_address,instruction);

input[31:0] PC_address; //current intruction address

output[31:0] instruction; // the current intruction

reg[31:0] instruction;

reg[31:0] instruction_mem[0:255]; //instruction memory of size of 255 words 


initial 

begin 

  instruction_mem[0] <= 32'b000000_10000_10001_01000_00000_100000; //add $t0, $s0, $s1
  
  instruction_mem[4] <= 32'b000000_10010_10011_01001_00000_100010; //sub $t1, $s2, $s3

  instruction_mem[8] <= 32'b100011_00000_01001_0000000000001000; //lw $t1, 8($0)

  instruction_mem[12] <= 32'b101011_00000_01000_0000000000010000; //sw $t0, 16($0)
  
  instruction_mem[16] <= 32'b000100_01000_01001_0000000000000011; //beq $t0, $t1, 3

  instruction_mem[32] <= 32'b000000_01000_01001_01010_00000_100000; //add $t2, $t0, $t1


end


always@(*)

begin 

instruction<=instruction_mem[PC_address]; //geting the current instruction from Instruction_Memory

end


endmodule