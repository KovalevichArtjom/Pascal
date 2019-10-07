var 
 oneX, twoX: real;
 functionY, functionZ: real;
 a, b, c, y, z: real;
 dublicate: real;
begin
  
  writeln('Enter numbers:');
  write('a -> ');
  readln(a);
  write('b -> ');
  readln(b);
  write('c -> ');
  readln(c);
  writeln;
  
  dublicate:= sqrt( abs( sqr(b) - 4 * a * c ) );
  oneX:= (b + dublicate) / 2 * a;
  twoX:= (b - dublicate) / 2 * a;
  
  y:= ( exp( -(oneX) ) + exp( -(twoX) )) / 2;
  z:= ( a * sqrt( oneX ) - b * sqrt( twoX )) / c;
  
  writeln('Calculation result:');
  writeln('Value x1 -> ', oneX);
  writeln('Value x2 -> ', twoX);
  writeln('--------------------');
  writeln('y -> ', y);
  writeln('z -> ', z);
  
end.
