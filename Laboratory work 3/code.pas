program lab_3;
var 
    writeNumber: real;
    naturalNumber: integer;
    nCurrentMonth: string;
    formula: real;
    res: real;
    i: integer;
begin
    write('Write natural number -> ');
    readln(writeNumber);
    //if number real
    naturalNumber:= round(writeNumber);
    //Defaul val formul
    formula:= 1/sin(1);
    
    for i:= 1 to naturalNumber do
        formula:= formula + ( 1/( sin(1) + sin(i) ) );
    
    write('Result = ', formula);

end.
