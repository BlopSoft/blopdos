program filemgr;
  uses sysutils;
  var
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
end.