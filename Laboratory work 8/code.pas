program lab_8;

function getIdGroupByNameGroup(arrNumGroup: array of string; nGroup:string):integer;
  var
    idGroup: integer;
begin
    for idGroup:= 0 to Length(arrNumGroup) - 1 do
    begin
      if (arrNumGroup[idGroup] = nGroup) then
      begin
        getIdGroupByNameGroup:= idGroup;
        break
      end;
    end;
end;

procedure setBestSubject(arrSubject: array of string; averageMarksSubjects:array of real; numberStudents: integer;
                         var bestsSubjects: set of string);
  var
    idSubject: integer;
    numberSubject: integer:= Length(arrSubject);
    maxMarkSubject: real:= 0;
begin
    //calculation mark subject
    for idSubject:= 0 to (numberSubject - 1) do
    begin
      averageMarksSubjects[idSubject]:= averageMarksSubjects[idSubject] / numberStudents;
      //find max mark subject
      if (maxMarkSubject < averageMarksSubjects[idSubject]) then
        maxMarkSubject:= averageMarksSubjects[idSubject];
    end;
  
  
    for idSubject:= 0 to Length(averageMarksSubjects) - 1 do
    begin
      if (averageMarksSubjects[idSubject] = maxMarkSubject) then
      begin
        include(bestsSubjects, arrSubject[idSubject]);
      end;
    end;
end;

procedure sortGroups(var averageMarksGroups:array of real; numberStudentInGroup: array of byte;
                     var arrNumGroup: array of string);
  var
    idGroup, i, j: integer;
    tempNGroup: string;
    tempMarks: real;
    numberGroup: integer:= Length(arrNumGroup);
begin
    //calculation marks groups
    for idGroup:= 0 to numberGroup - 1 do
    begin
      if (averageMarksGroups[idGroup] <> 0) then
        averageMarksGroups[idGroup]:= averageMarksGroups[idGroup]/numberStudentInGroup[idGroup];
        
      writeln(arrNumGroup[idGroup],' -> ',averageMarksGroups[idGroup],';');
    end;
    
    for i:= 0 to numberGroup - 1 do
      for j:= i + 1 to numberGroup - 1 do
      begin
        if (averageMarksGroups[j] > averageMarksGroups[i]) then
        begin
          //for maks
          tempMarks:= averageMarksGroups[i];
          averageMarksGroups[i]:= averageMarksGroups[j];
          averageMarksGroups[j]:= tempMarks;
          //for name groups
          tempNGroup:= arrNumGroup[i];
          arrNumGroup[i]:= arrNumGroup[j];
          arrNumGroup[j]:= tempNGroup;
        end;  
      end;
    
end;

type 
     session = record
      surname: string;
      group: string;
      subject: record
        maths: integer;
        physics: integer;
        programming: integer;
      end;  
     end;
     
     calculations = record
     
     end;
var 
  summerSession: array of session;     
  arrSurname: array of string:=(
                                'Поух', 'Арт', 'Гирень',
                                'Сухоцкая', 'Мелешко', 'Крупский'
  );
  arrNumGroup: array of string:=(
                                'ПЗТ-23', 'ПЗТ-24', 'ПЗТ-25'
  );
  arrSubject: array of string:=(
                                'maths', 'physics', 'programming'
  );                              
  averageMarksStudents, averageMarksGroups, averageMarksSubjects: array of real;
  numberStudentInGroup: array of byte;
  notBestStudent: string:= 'Увы, таких нет';
  isGroup: set of string;
  bestsSubjects: set of string;
  bestsStudents: set of string:=[
                                 notBestStudent
  ];
  numberStudents: integer:= Length(arrSurname);  
  numberGroup: integer:= Length(arrNumGroup);
  numberSubject: integer:= Length(arrSubject);
  idStudent, idGroup, i: integer;
begin
  //Set length array
  SetLength(summerSession, numberStudents);
  SetLength(averageMarksStudents, numberStudents);
  SetLength(averageMarksGroups, numberGroup);
  SetLength(averageMarksSubjects, numberSubject);
  SetLength(numberStudentInGroup, numberGroup);
  
  //set information about student
  for idStudent:= 0 to (numberStudents - 1) do
    with summerSession[idStudent] do  
    begin
        writeln;
        writeln('//--------------------//');
        surname:= arrSurname[idStudent];
        writeln('ФИО: ', surname);
        group:= arrNumGroup[random(numberGroup)];
        writeln('Группа: ', group);
        writeln;
        writeln('Оценки по предметам:');
        subject.maths:= random(11);
        writeln('Математика: ', subject.maths);
        subject.physics:= random(11);
        writeln('Физика: ', subject.physics);
        subject.programming:= random(11);
        writeln('Программирование: ', subject.programming);
    end;
  
  for idStudent:= 0 to (numberStudents - 1) do
    with summerSession[idStudent] do  
    begin
      //calculation average mark students
      averageMarksStudents[idStudent]:= (subject.maths + subject.physics + subject.programming)/numberGroup;
      
      //calculation subject
      averageMarksSubjects[0]:= averageMarksSubjects[0] + subject.maths;
      averageMarksSubjects[1]:= averageMarksSubjects[1] + subject.physics;
      averageMarksSubjects[2]:= averageMarksSubjects[2] + subject.programming;   
      
      //calculation average mark group
      idGroup:= getIdGroupByNameGroup(arrNumGroup, group);
      averageMarksGroups[idGroup]:= averageMarksGroups[idGroup] + averageMarksStudents[idStudent];
      numberStudentInGroup[idGroup]:= numberStudentInGroup[idGroup] + 1;
      
      //best students
      if (averageMarksStudents[idStudent] >= 9) then
        begin
          exclude(bestsStudents, notBestStudent);
          include(bestsStudents, surname);
        end;  
    end;   
    
    setBestSubject(arrSubject, averageMarksSubjects, numberStudents, bestsSubjects);
    writeln;
    writeln('//--------Итоги---------//');
    writeln('Фамилии лучших студентов -> ', bestsStudents);
    writeln('Название предметов, которые были сданы лучше всего -> ', bestsSubjects);
    writeln('Средняя успеваемость студентов в группе:');
    sortGroups(averageMarksGroups, numberStudentInGroup, arrNumGroup);
    writeln('Номера группа в порядке убывания успеваемости студентов -> ', arrNumGroup);
end.
