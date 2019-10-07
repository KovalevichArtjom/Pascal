program lab_2;
var 
    numberDate: integer;
    nCurrentMonth: string;
    month: array[1..12] of string = ('январь', 'февраль', 'март',
                                     'апрель', 'май', 'июнь',
                                     'июль', 'август', 'сентябрь',
                                     'октябрь', 'ноябрь', 'декабрь');
begin
    writeln('Write number month -> ');
    readln(numberDate);
    numberDate:= numberDate + 1;
    write('Your mouth -> ');
    //writeln('Your mouth -> ', month[numberDate + 1]);
    case numberDate of
      1: write(month[numberDate]);
      2: write(month[numberDate]);
      3: write(month[numberDate]);
      4: write(month[numberDate]);
      5: write(month[numberDate]);
      6: write(month[numberDate]);
      7: write(month[numberDate]);
      8: write(month[numberDate]);
      9: write(month[numberDate]);
      10: write(month[numberDate]);
      11: write(month[numberDate]);
      12: write(month[numberDate]);
    end;  
end.
