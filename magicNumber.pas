Program Pzim ;

Var
	number : integer;


Function elevado(base, expoente: integer): integer;
Var
	i, rt:integer;
begin
	rt := 1;
	for i:=1 to expoente do
	begin
		rt := rt * base;
	end;
	elevado := rt;
end;


Function isMagic(number : integer): boolean;
Var 
	part1, part2, grandeza, i, sum : integer;
begin
	isMagic := false;
	grandeza := 0;
   if (number > 9) then 
   begin
   		for i:=0 to 10 do
   		begin
   			if (number > elevado(10, i)) then
   				grandeza := grandeza+1;
   		end;
   		if (grandeza mod 2 = 0) then
   		begin
   		     part1 := number div elevado(10, (grandeza div 2));
		     part2 := number mod elevado(10, (grandeza div 2));
		     sum := part1 + part2;
		     
		     writeln(number, ' --> (', part1,' + ', part2, ') = ', sum, ' --> ', sum, '^2 = ', elevado(sum, 2));
		     
		     if (elevado(sum, 2) = number) then isMagic := true
		     else isMagic := false;
   		end
   end;
end;

 Begin
  	writeln('Digite o numero a ser testado');
  	readln(number);
  	
	if (isMagic(number)) then
		writeln('SIM')
	else
		writeln('NÃO');
  	
  	
 End.
