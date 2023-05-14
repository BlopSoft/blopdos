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
	WriteLn('����� ��४���: ', currentDir);
	WriteLn('---------------------------------------------');
	WriteLn('����� � ��४�ਨ:');
	if FindFirst(currentDir + PathDelim + '*', faAnyFile, sr) = 0 then
	begin
	  repeat
		if (sr.Attr and faDirectory) = 0 then
		  WriteLn('   ', sr.Name);
	  until FindNext(sr) <> 0;
	  FindClose(sr);
	end;

	WriteLn('---------------------------------------------');
	WriteLn('��४�ਨ � ��४�ਨ:');
	if FindFirst(currentDir + PathDelim + '*', faDirectory, sr) = 0 then
	begin
	  repeat
		if (sr.Name <> '.') and (sr.Name <> '..') then
		  WriteLn('   ',sr.Name);
	  until FindNext(sr) <> 0;
	  FindClose(sr);
	end;

	WriteLn;
	Write('�������� (q - ���, cd - ���� � ��४���, help - ��⠫�� �������): ');
	ReadLn(input);

    if input = 'help' then begin
	  writeln('mkdir - ������� ��४���');
      writeln('deldir - ������� ��४���');
      writeln('del - ������� ����');
	end;

    if input = 'mkdir' then begin
	  write('�������� ��४�ਨ: ');
	  readln(mkdirnamee);
	  dirnamee := currentDir + '\' + mkdirnamee;

	  if ForceDirectories(mkdirnamee) then
	    Writeln('��४��� ᮧ����');
	end;

    if input = 'del' then begin
	  write('����� 䠩� 㤠����: ');
	  readln(FileNamee);
	  FileNamee := currentDir + '\' + FileNamee;

	  if DeleteFile(FileNamee) then
	    Writeln('���� 㤠��');
	end;

    if input = 'deldir' then begin
	  write('����� ��४��� 㤠����: ');
	  readln(dirnamee);
	  dirnamee := currentDir + '\' + dirnamee;

	  if RemoveDir(dirnamee) then
	    Writeln('��४��� 㤠����');
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