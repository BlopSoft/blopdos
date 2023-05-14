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
  writeln('���� ���������� � BlopDOS 0.25!');
  writeln('�⮡� 㧭��� �� ������� ��� BlopDOS � ������ �������: "help"');
  while True do begin
  write(currentDir, '>');
  readln(a);
    if a = 'help' then begin
      writeln('exit - �몫���� BlopDOS');
      writeln('write - ������� ᫮��');
      writeln('info - ���ଠ�� � ��⥬�');
      writeln('fileview - ��ᬮ���� ᮤ�ন��� 䠩��');
      writeln('filemgr - 䠩���� ��������');
    end;
    if a = 'info' then begin
      writeln('   PJ?7777?JP     ����� BlopDos: 0.25');
      writeln(' /7?........?7\   ��������: �� �����');
      writeln('/!5..........5!\  BlopShell: �� ᤥ���');
      writeln('5J....Blop....J5  C������� �� ���⪮� ��᪥: ���������');
      writeln('5J....Dos.....J5  ��ꥬ ���⪮�� ��᪠: ���������');
      writeln('\?............?/  ������: ', GetEnvironmentVariable('PROCESSOR_IDENTIFIER'));
      writeln(' \7?........?7/   ���� � ������: ', GetEnvironmentVariable('NUMBER_OF_PROCESSORS'));
      writeln('   PJ??????JP     ���: ', IntToStr(Round(GetHeapStatus.TotalAddrSpace / 1024 / 1024)), ' Mb');
    end;
    if a = 'exit' then begin
      break;
    end;
    if a = 'fileview' then begin
      Write('������ �������� 䠩��: ');
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
                  writeln(mkdirnamee);

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
    end;
    if a = 'write' then begin
      readln();
    end;
  end;
end.
