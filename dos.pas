program dos;
  uses sysutils;
  var a:string;
  f: TextFile;
  fileName, fileContent: string;
  sr: TSearchRec;
  currentDir: string;
  exitFlag: Boolean;
  input: string;
  FileNamee: string;
  dirnamee: string;
  mkdirnamee: string;
begin
  currentDir := GetCurrentDir;
  writeln('Добро пожаловать в BlopDOS 0.25!');
  writeln('Чтобы узнать все команды для BlopDOS то введите команду: "help"');
  while True do begin
  write(currentDir, '>');
  readln(a);
    if a = 'help' then begin
      writeln('exit - Выключить BlopDOS');
      writeln('write - Написать слово');
      writeln('info - Информация о системе');
      writeln('fileview - Посмотреть содержимое файла');
      writeln('filemgr - файловый менеджер');
    end;
    if a = 'info' then begin
      writeln('   PJ?7777?JP     Версия BlopDos: 0.25');
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
    if a = 'filemgr' then begin
	  exitFlag := False;

	  while not exitFlag do
	  begin
		WriteLn('Сейчас директория: ', currentDir);
		WriteLn('---------------------------------------------');
		WriteLn('Файлы в директории:');
		if FindFirst(currentDir + PathDelim + '*', faAnyFile, sr) = 0 then
		begin
		  repeat
			if (sr.Attr and faDirectory) = 0 then
			  WriteLn('   ', sr.Name);
		  until FindNext(sr) <> 0;
		  FindClose(sr);
		end;

		WriteLn('---------------------------------------------');
		WriteLn('Директории в директории:');
		if FindFirst(currentDir + PathDelim + '*', faDirectory, sr) = 0 then
		begin
		  repeat
			if (sr.Name <> '.') and (sr.Name <> '..') then
			  WriteLn('   ',sr.Name);
		  until FindNext(sr) <> 0;
		  FindClose(sr);
		end;

		WriteLn;
		Write('Комманды (q - Выйти, cd - Войти в директорию, help - Остальные команды): ');
		ReadLn(input);

                if input = 'help' then begin
		  writeln('mkdir - Создать директорию');
                  writeln('deldir - Удалить директорию');
                  writeln('del - Удалить Файл');
		end;

                if input = 'mkdir' then begin
		  write('Название директории: ');
		  readln(mkdirnamee);
		  dirnamee := currentDir + '\' + mkdirnamee;
                  writeln(mkdirnamee);

		  if ForceDirectories(mkdirnamee) then
		    Writeln('Директория создана');
		end;

                if input = 'del' then begin
		  write('Какой файл удалить: ');
		  readln(FileNamee);
		  FileNamee := currentDir + '\' + FileNamee;

		  if DeleteFile(FileNamee) then
		    Writeln('Файл удалён');
		end;

                if input = 'deldir' then begin
		  write('Какую директорию удалить: ');
		  readln(dirnamee);
		  dirnamee := currentDir + '\' + dirnamee;

		  if RemoveDir(dirnamee) then
		    Writeln('Директория удалена');
		end;

		if input = 'q' then
		  exitFlag := True
		else if Copy(input, 1, 3) = 'cd ' then
		begin
		  input := Copy(input, 4, MaxInt);
		  if DirectoryExists(currentDir + PathDelim + input) then
			currentDir := currentDir + PathDelim + input;
		end;
	  end;
    end;
    if a = 'write' then begin
      readln();
    end;
  end;
end.
