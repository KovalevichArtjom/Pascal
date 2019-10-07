program lab_5;
var 
  str: string[255];
  tempChar: char;
  numberChar: integer;
  lengthStr: integer:= 0;
  lengthWord: integer:= 0;
  beginWord: integer;
  endWord: integer;
  i: integer;
begin
    write('Write srting ->');
    readln(str);
    
    write('Write number char to string -> ');
    readln(numberChar);
    
    str:= Trim(str); 
    lengthStr:= Length(str);
    
    for i:= 1 to lengthStr do
      begin 
       tempChar:= str[i];
       
       if (tempChar = ' ') or (i = lengthStr) then
          begin
            beginWord:= i - (lengthWord);
            endWord:= i - 1;
            writeln(str[beginWord]);
            //task 1
            tempChar:= str[beginWord + numberChar];
            str[beginWord + numberChar]:= str[beginWord + (numberChar - 1)];
            str[beginWord + (numberChar - 1)]:= tempChar;
            //task 2
            tempChar:= str[endWord];
            str[endWord]:= str[beginWord];
            str[beginWord]:= tempChar;
            
            lengthWord:= 0;
            continue;
        end;
        //inc lenght word
        Inc(lengthWord);
      end;
      
      writeln(str);
    
end.
