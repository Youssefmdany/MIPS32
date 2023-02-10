

module PC_Branch(signimm,PC_Plus4,New_PC);
  
  input[31:0]signimm,PC_Plus4; // signed immediate and next program counter if there is no branch
  
  output[31:0]New_PC;//next program counter if there is a branch
  
  reg[31:0]New_PC; 
  
  always@(signimm,PC_Plus4)
  
  begin
  
  New_PC<=(signimm<<2)+PC_Plus4; //next program counter when branch take place
  
  
  end
  
  
  endmodule
  