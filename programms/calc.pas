program calc;
var a,b,c,d:integer;
begin
  while True do begin
    writeln('0 - ��室');
    writeln('1 - ��������');
    writeln('2 - ���⠭��');
    writeln('3 - ��������');
    writeln('4 - �������');
    write('�롥�� ⨯: ');
    readln(a);
    if a = 0 then begin
      break;
    end;
    if a = 1 then begin
      write('�ਬ��: ');
      readln(b,c);
      write('�⢥�: ');
      writeln(b+c);
      writeln(' ');
    end;
    if a = 2 then begin
      write('�ਬ��: ');
      readln(b,c);
      write('�⢥�: ');
      writeln(b-c);
      writeln(' ');
    end;
    if a = 3 then begin
      write('�ਬ��: ');
      readln(b,c);
      write('�⢥�: ');
      writeln(b*c);
      writeln(' ');
    end;
    if a = 4 then begin
      write('�ਬ��: ');
      readln(b,c);
      write('�⢥�: ');
      writeln(b/c);
      writeln(' ');
    end;
  end;
end.
