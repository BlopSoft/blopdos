program dos;
  var a:string;
begin
  writeln('Чтобы узнать команды для BlopDos то введите команду help');
  while True do begin
  write('>');
  readln(a);
    if a = 'help' then begin
      writeln('info - Информация о Компьютере');
      writeln('shutdown - Выключение Компьютера');
    end;
    if a = 'info' then begin
      writeln('   PJ?7777?JP     Версия BlopDos: В разработке');
      writeln(' /7?........?7\   Компьютер: Asus P7H55');
      writeln('/!5..........5!\  BlopShell: Не установлен');
      writeln('5J....Blop....J5  Cвободно на жестком диске: ',DiskFree(3)/1024/1024:0:2,'Мб');
      writeln('5J....Dos.....J5  Объем жесткого диска: ',DiskSize(3)/1024/1024:0:2,'Мб');
      writeln('\?............?/  Процессор: Intel Xeon X3440');
      writeln(' \7?........?7/   Видеокарта: Nvidia GTX 660');
      writeln('   PJ??????JP     ОЗУ: 8192 Мб');
    end;
    if a = 'shutdown' then begin
      break;
    end;
  end;
end.