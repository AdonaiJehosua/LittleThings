program PassGen;
var
  sitename: string;
  login: string;
  f: text;
  pass: string;
const
  filepath = 'C:\Users\User\Desktop\pascal\passgen\passgen.txt';
procedure generatepass;
var
  symbol: char;
  i, k: integer;
const
  lenght = 10;
  small = ['a'..'z'];
  big = ['A'..'Z'];
  dig = ['0'..'9'];
  sym = ['!'..'/', ':'..'@', '['..'`', '{'..'~'];
label
  repeatPassGen;
begin
     randomize;
     repeatPassGen:
     i := lenght;
     repeat
        symbol := chr(random(94)+33);
        pass := (pass + symbol);
        dec(i);
     until i < 1;
     for k:=1 to i do
        if not(pass[k] in small) or
           not(pass[k] in big) or
           not(pass[k] in dig) or
           not(pass[k] in sym) then
     goto repeatPassGen
end;

begin
  assign(f, filepath);
  append(f);
  write('Enter site name: ');
  readln(sitename);
  while length(sitename)<1 do
     begin
        write('No no no, ENTER site name: ');
        readln(sitename);
     end;
  write('Enter login: ');
  readln(login);
  while length(login)<1 do
     begin
        write('No no no, ENTER login, dude: ');
        readln(login);
     end;
  generatepass;
  writeln('SiteName: ', sitename, #13,'Login: ', login, #13, 'Pass: ', pass);
  write(f, sitename, #13,'Login: ', login, #13, 'Pass: ', pass, #13, #13);
  close(f);
  readln ;
end.
