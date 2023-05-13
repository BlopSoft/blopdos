program dos;
  uses sysutils;
  var a:string;
  f: TextFile;
  fileName, fileContent: string;
begin
  writeln('Добро пожаловать в BlopDOS 0.15!');
  writeln('Чтобы узнать все команды для BlopDOS то введите команду: "help"');
  while True do begin
  write('>');
  readln(a);
    if a = 'help' then begin
      writeln('exit - Выключить BlopDOS');
      writeln('write - Написать слово');
      writeln('info - Информация о системе');
      writeln('fileview - Посмотреть содержимое файла');
    end;
	if a = 'info' then begin
      writeln('   PJ?7777?JP     Версия BlopDos: 0.15');
      writeln(' /7?........?7\   Компьютер: Не знаем');
      writeln('/!5..........5!\  BlopShell: Не сделан');
      writeln('5J....Blop....J5  Cвободно на жестком диске: поломался');
      writeln('5J....Dos.....J5  Объем жесткого диска: поломался');
      writeln('\?............?/  Процессор: ', GetEnvironmentVariable('PROCESSOR_IDENTIFIER'));
      writeln(' \7?........?7/   Ядер у процессора: ', GetEnvironmentVariable('NUMBER_OF_PROCESSORS'));
      writeln('   PJ??????JP     ОЗУ: ', IntToStr(Round(GetHeapStatus.TotalAddrSpace / 1024 / 1024)), ' Mb');
    end;
    if a = 'exit' then begin
      break;
    end;
    if a = 'fileview' then begin
      Write('Напишите название файла: ');
      ReadLn(fileName);

      Assign(f, fileName);
      Reset(f);

      while not Eof(f) do
      begin
      	ReadLn(f, fileContent);
      	WriteLn(fileContent);
      end;

      Close(f);
    end;
    if a = 'write' then begin
      readln();
    end;
  end;
end.
