program lab_6;
var 
  //str: string:= 'январь,февраль,март,апрель,май.';
  str: string:= 'аеюэиябч,аеюэоябч,аеюябч,аеюэоябч,аеюэиябч.';
  vowels: set of char:= [
                        'а', 'е', 'и', 'о','у',
                        'ы', 'э', 'ю','я'
];
  consonants: set of char:= [
                            'б', 'в', 'г', 'д', 'ж', 'з',
                            'й', 'л', 'м', 'н', 'р', 'к',
                            'п', 'с', 'т', 'ф', 'х', 'ц',
                            'ч', 'ш', 'щ'
];
  alphabet: array of char:= (
                        'а', 'б', 'в', 'г', 'д', 'е',
                        'ж', 'з', 'и', 'й', 'к', 'л',
                        'м', 'н', 'о', 'п', 'р', 'с',
                        'т', 'у', 'ф', 'х', 'ц', 'ч',
                        'ш', 'щ', 'x', 'ы', 'э', 'ю',
                        'я'
); 
  isValidWords: set of boolean;
  isVowels: set of char;
  res: set of char;
  isChar: boolean:= false;
  i, y: integer;
begin
 
    for i:= 0 to (Length(alphabet) - 1) do       
      begin
        //if vowels
        if (alphabet[i] in vowels) then
        begin
         for y:= 1 to Length(str) do
            begin
              
              if (str[y] = ',') or (str[y] = '.') then
                begin
                  if (isChar = false) then
                    begin
                         include(isValidWords, false); 
                         break;
                    end;
                    
                  //next  
                  include(isValidWords, true);
                  isChar:= false;
                  continue;  
                end; 
              
              if (alphabet[i] = str[y]) then
                 isChar:= true;
                                           
            end;
          
          if (false in isValidWords) then
            begin
             isValidWords:= [];
             continue; 
            end;
          //if everyone has words
          include(isVowels,alphabet[i]);
          isValidWords:= [];
          isChar:= false;
    
        end; 
        
        //set defaulf settings
        isValidWords:= [];
        isChar:= false;
        
        //if consonants
        if (alphabet[i] in consonants) then
        begin
         for y:= 1 to Length(str) do
            begin
              
              if (str[y] = ',') or (str[y] = '.') then
                begin
                  if (isChar = false) then
                    begin
                         include(isValidWords, false); 
                         break;
                    end;
                    
                  //next  
                  include(isValidWords, true);
                  isChar:= false;
                  continue;  
                end; 
              
              if (alphabet[i] = str[y]) then
                 isChar:= true;
                                           
            end;
          
          if (false in isValidWords) then
            begin
             isValidWords:= [];
             continue; 
            end;
          
          exclude(consonants,alphabet[i]);
          isValidWords:= [];
          isChar:= false;
    
        end;      
      end;
      
    writeln('Existing vowels in each words -> ',isVowels);
    writeln('Missing consonants in each word -> ',consonants);
    //union 
    res:= isVowels + consonants;    
    
    write('Result:');
    for i:= 0 to (Length(alphabet) - 1) do  
      begin
        if (alphabet[i] in res) then
          write(' ',alphabet[i]);
      end;
      
end.
