program lab_9; 

function getNumber(numbers: string):integer; 
begin
  
  if (numbers = 'positive') then
  begin
    getNumber:= random(50) + 1;// [1-50]
    exit;
  end;

  if (numbers = 'negative') then
  begin
    getNumber:= random(50) - 51;//[(-1)-(-50)]  
    exit;
  end;
  
end;

procedure printFileOnWindow(pathToFile: string);
var
  number: integer;
  f: file of integer;
begin
  //Open file for reading
  Assign(f, pathToFile);
  Reset(f);
  while not eof(f) do
  begin
    read(f, number);      
    write(number);
  end;
  //close file
  close(f);
end;

procedure sortingFileFandH(pathToFileF: string; pathToFileG: string; pathToTempFile: string);
var
  number: integer;
  fileF, fileG, tempFile: file of integer;
begin
  
  assign(fileF, pathToFileF);
  assign(fileG, pathToFileG);
  assign(tempFile, pathToTempFile);
  
  reset(fileF);
  rewrite(fileG);
  rewrite(tempFile);
  
  while not eof(fileF) do
  begin
    read(fileF, number);
    
    if (number < 0) then
      write(fileG, number)
    else
      write(tempFile, number);

  end;
  
  close(fileF);
  close(fileG);
  close(tempFile);
  
  //delete old file
  erase(fileF);
  rename(fileG, pathToFileF);
  
  writeln('Result sorting:');
  write('Negative numbers "fileNameF"-> ');
  printFileOnWindow(pathToFileF);
  writeln;
  write('Positive numbers "fileNameH"-> ');
  printFileOnWindow(pathToTempFile);
  writeln;
end;

procedure sortingFilesTaskOne(pathToFileF: string; pathToFileG: string; pathToTempFile: string);
var
  numberF, numberTemp: integer;
  fileF, fileG, tempFile: file of integer;
begin
  
  assign(fileF, pathToFileF);
  assign(fileG, pathToFileG);
  assign(tempFile, pathToTempFile);
  
  reset(fileF);
  rewrite(fileG);
  reset(tempFile);
  
  while not eof(fileF) do
  begin
    read(fileF, numberF);
    read(tempFile, numberTemp);
    
    write(fileG, numberF);
    write(fileG, numberTemp);

  end;
  
  close(fileF);
  close(fileG);
  close(tempFile);
  
  write('Result -> ');
  printFileOnWindow(pathToFileG);
  writeln;
end;

procedure sortingFilesTaskTwo(pathToFileF: string; pathToFileG: string; pathToTempFile: string);
var
  numberF, numberTemp: integer;
  fileF, fileG, tempFile: file of integer;
begin
  
  assign(fileF, pathToFileF);
  assign(fileG, pathToFileG);
  assign(tempFile, pathToTempFile);
  
  reset(fileF);
  rewrite(fileG);
  reset(tempFile);
  //first positive numbers
  while not eof(tempFile) do
  begin
    read(tempFile, numberTemp);
    write(fileG, numberTemp);
  end;
  //negative numbers
  while not eof(fileF) do
  begin
    read(fileF, numberF);
    write(fileG, numberF);
  end;
  
  close(fileF);
  close(fileG);
  close(tempFile);
  
  write('Result -> ');
  printFileOnWindow(pathToFileG);
  writeln;
end;

procedure sortingFilesTaskThree(pathToFileF: string; pathToFileG: string; pathToTempFile: string);
var
  numberF, numberTemp: integer;
  fileF, fileG, tempFile: file of integer;
  filesSize, number, id: integer;
  numbers: string:= 'positive';
  point, pointF, pointTemp: integer;
begin
  //default val
  point:= 0;
  pointF:= 0;
  pointTemp:= 0;
  
  assign(fileF, pathToFileF);
  assign(fileG, pathToFileG);
  assign(tempFile, pathToTempFile);
  
  reset(fileF);
  rewrite(fileG);
  reset(tempFile);
  //set size two files
  filesSize:= FileSize(fileF) + FileSize(tempFile);
  
  for id:= 0 to (filesSize - 1) do
  begin
    
    if (point > 1) then
    begin
      //set default val
      point:= 0;
      //set utput numbers: -2, -22, 1, 23..
      if (numbers = 'negative') then
        numbers:= 'positive'
      else
        numbers:= 'negative'; 
    end;
    
    if (numbers = 'negative') then
    begin
      Seek(fileF, pointF);
      read(fileF, number); 
      inc(pointF);
    end;
    
    if (numbers = 'positive') then
    begin
      Seek(tempFile, pointTemp);
      read(tempFile, number); 
      inc(pointTemp);
    end;
     
    write(fileG, number);  
    //inc 
    inc(point);
  end;
  
  close(fileF);
  close(fileG);
  close(tempFile);
  
  write('Result -> ');
  printFileOnWindow(pathToFileG);
  writeln;
end;

//...число компонент в файле f делится на 4
const COUNT_NUMBERS_FILE = 40; 
var  
  fileNameF: file of integer; 
  pathToFileF: string:= 'files\fileNameF.ak'; 
  pathToFileG: string:= 'files\fileNameG.ak';
  pathToTempFile: string:= 'files\temp\fileNameH.ak';
  id, number: integer;
  point: integer:= 0;
  numbers: string:= 'negative';
begin
  Assign(fileNameF, pathToFileF);
  //Set numbers in File, observing the conditions lab 9
  Rewrite(fileNameF);
  
  for id:= 0 to (COUNT_NUMBERS_FILE - 1) do
  begin
    
    if (point > 1) then
    begin
      //set default val
      point:= 0;
      //set utput numbers: 2, 22, -1, -23..
      if (numbers = 'negative') then
        numbers:= 'positive'
      else
        numbers:= 'negative'; 
    end;
      
    number:= getNumber(numbers);
    write(fileNameF, number);  
    //inc 
    inc(point);
  end;
  //close file
  close(fileNameF);
 
  write('Data filled file "fileNameF.ak" -> ');
  printFileOnWindow(pathToFileF);
  writeln;
  writeln;
  
  //Sorting files
  sortingFileFandH(pathToFileF, pathToFileG, pathToTempFile);
  writeln;
 
  writeln('а) не было двух соседних чисел с одинаковым знаком;');
  sortingFilesTaskOne(pathToFileF, pathToFileG, pathToTempFile);
  writeln;
  
  writeln('б) вначале шли положительные, затем отрицательные числа;');
  sortingFilesTaskTwo(pathToFileF, pathToFileG, pathToTempFile);  
  writeln;
  
  writeln('в) числа шли в следующем порядке: два положительных, два отрицательных');
  sortingFilesTaskThree(pathToFileF, pathToFileG, pathToTempFile);
  
end.