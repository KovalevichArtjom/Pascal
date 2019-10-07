program lab_7;

var
  perimeter: real:= 0;
  lineLength: real:= 0;
  arrPointX: array of real:= ( 
                              2, 5, -7
);
  arrPointY: array of real:= (
                              4, 2, 3
);
  lengthArr: integer:= Length(arrPointX) - 1;
  i, j: integer;
  
procedure countLineLength( pointOneX, pointOneY, pointTwoX, pointTwoY: real;
                           var lineLength: real);
  begin
    lineLength:= sqrt( sqr( pointTwoX - pointOneX ) + sqr( pointTwoY -  pointOneY) ); 
  end;
  
begin
  
  for i:= 0 to lengthArr do
    begin
      j:= 0;
      
      if i <> lengthArr then
        j:= i + 1;
        
      countLineLength(arrPointX[i], arrPointY[i], arrPointX[j], arrPointY[j], lineLength);
      perimeter:= perimeter + lineLength;
    end;
    
  Write('Perimeter := ', perimeter);
end.
