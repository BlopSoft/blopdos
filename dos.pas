program dos;
  uses sysutils;
  var a:string;
  f: TextFile;
  fileName, fileContent: string;
begin
  writeln('���� ���������� � BlopDOS 0.15!');
  writeln('�⮡� 㧭��� �� ������� ��� BlopDOS � ������ �������: "help"');
  while True do begin
  write('>');
  readln(a);
    if a = 'help' then begin
      writeln('exit - �몫���� BlopDOS');
      writeln('write - ������� ᫮��');
      writeln('info - ���ଠ�� � ��⥬�');
      writeln('fileview - ��ᬮ���� ᮤ�ন��� 䠩��');
    end;
	if a = 'info' then begin
      writeln('   PJ?7777?JP     ����� BlopDos: 0.15');
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
    if a = 'write' then begin
      readln();
    end;
  end;
end.
