program calc;
var a,b,c,d:integer;
begin
  while True do begin
    writeln('0 - Выход');
    writeln('1 - Сложение');
    writeln('2 - Вычитание');
    writeln('3 - Умножение');
    writeln('4 - Деление');
    write('Выберите тип: ');
    readln(a);
    if a = 0 then begin
      break;
    end;
    if a = 1 then begin
      write('Первый: ');
      readln(b,c);
      write('Ответ: ');
      writeln(b+c);
      writeln(' ');
    end;
    if a = 2 then begin
      write('Пример: ');
      readln(b,c);
      write('Ответ: ');
      writeln(b-c);
      writeln(' ');
    end;
    if a = 3 then begin
      write('Пример: ');
      readln(b,c);
      write('Ответ: ');
      writeln(b*c);
      writeln(' ');
    end;
    if a = 4 then begin
      write('Пример: ');
      readln(b,c);
      write('Ответ: ');
      writeln(b/c);
      writeln(' ');
    end;
  end;
end.