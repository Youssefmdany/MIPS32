

module Register_File(read_add1,read_add2,write_add,read_data1,read_data2,write_data,write_en,clk);

input[4:0]read_add1,read_add2,write_add; //the addresses of rs ,rt and rd

input[31:0]write_data; //the data to be written in the register

output[31:0]read_data1,read_data2; // read data from register file

reg[31:0]read_data1,read_data2;

input write_en; //write enable

input clk; //clock


reg[31:0] Reg_File[0:31];





integer i;

initial // first initialize all registers with zero value

begin



  for(i=0;i<32;i=i+1)
  
  begin
      Reg_File[i]<=32'b0;
		
  end
  
  

//The values ​​of the  saved variables for the test code
  
Reg_File[16]<=3; //$s0=3

Reg_File[17]<=4; //$s1=4

Reg_File[18]<=6; //$s2=6

Reg_File[19]<=5; //$s3=5



end


always@(*)
begin 

//always read it

 read_data1<=Reg_File[read_add1]; //read data of rs

 read_data2<=Reg_File[read_add2]; //read data of rt
  
	


end




always@(posedge clk)
begin 

if(write_en) // if write_en is enabled then
     
	     Reg_File[write_add]<=write_data; //write the result of ALU in a register of specific address
		  
             Reg_File[0]=32'b0; //always keep the value of $0 equal to zero

end


endmodule

