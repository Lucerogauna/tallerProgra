program ej2TPinicial;
type
rang1= 1..5;

propied = record
zona: rang1;
cod: integer; // se almacena
tipo: integer;// se almacena
cantdemetros: real;
precioxmetro: real;// se almacena el precio total OJO
end; 
 lista = ^nodo;
  nodo = record
    dato: propied;
    sig: lista;
  end;
//________________________________________________________________
procedure leerPRO (var p: propied);
begin

with p do begin
writeln('zona');
readln (zona);
writeln('codigo');
readln (cod); 
writeln('tipo');
readln (tipo);
writeln('cant de  metro cuadrado');
readln (cantdemetros);
writeln('precio por metro cuadrado');
readln (precioxmetro);
 end;
 end;
 //________________________________________________________________
procedure insertarO (var l: lista; prop:propied);
var nue, act, ant: lista;
begin
new (nue);
nue^.dato:= prop;
act:=l;
ant:= l;
while (act<>nil) and (nue^.dato.tipo> act^.dato.tipo) do begin
ant:= act;
act:= act^.sig;
end;
if act= ant then
l:= nue
else 
ant^.sig:= nue;
nue^.sig:= act;
 end;
//________________________________________________________________
procedure cargarL (var l: lista);
var pr: propied;
begin
leerPRO(pr);
while pr.precioxmetro <> -1 do begin
insertarO (l, pr);
leerPRO(pr);
end;
 end;
 var 
 L: lista;
BEGIN
cargarL  (L);
	
	
END.

