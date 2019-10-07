var 
  row, str, i, y: integer;
  figure:= new real[1,1];
  vectar: array of real;
  average, number: real;
begin
  writeln('Enter quantity Row and String: ');
  write('String -> ');
  readln(str);
  write('Row -> ');
  readln(row);
  
  //set length array
  SetLength(figure, str, row);
  SetLength(vectar, str);
  //set Random values array
  for i:=0 to str - 1 do 
  begin
    for y:=0 to row - 1 do
    begin
      number:= random(101) - 50;
      average:= average + number; 
      figure[i,y]:= number;
    end;
    vectar[i]:= average / str;
  end;

  writeln;  
  writeln('Values our figure:');
  writeln(figure);
  
  writeln;
  writeln('Vectar = ', vectar);
end.
