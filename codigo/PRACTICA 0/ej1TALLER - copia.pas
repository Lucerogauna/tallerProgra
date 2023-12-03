
//TALLER DE PROGRAMACION 2023
program ejINICIAL;
type 

rang1= 1..36;
vector = array [rang1] of integer;
alumno= record
nom: string;
num: integer;
anio: integer;
cantaprobadas: rang1;
vecnotas: vector;
end;
alumno2= record
nume: integer;
prom:integer;
end;

lista2= ^nodo2;
nodo2 = record
dat: alumno2;
sig: lista2;
end;
lista= ^nodo;
nodo = record
dato: alumno;
sig: lista;
end;
//--------------------------------------------------
procedure cargarvec(dl:integer; var v: vector);
var i: integer;
begin
for i:= 1 to dl do begin
writeln('ingresa la nota numero:', i);
readln(v[i]);
end; 
end;
//---------------------------------------------------
procedure leer( var a: alumno);
begin
with a do begin
writeln('nombre');
readln (nom);
writeln('numero');
readln (num); 
writeln('anio');
readln (anio);
writeln('cant aprobadas');
readln (cantaprobadas);
end;
end;
//------------------------------------------------------
procedure agregarAd (var li: lista; dato: alumno);
var nue: lista;
begin
new (nue);
nue^.dato:= dato;
nue^.sig:= li;
li:= nue;
end;
//-----------------------------------------------------
procedure cargar (var l: lista);
var
a: alumno;
begin
repeat 
leer(a);
cargarvec(a.cantaprobadas, a.vecnotas);
agregarAd (l, a);
until (a.num = 111);
end;
//_----------------------------------------------------------
function promedio(dl: integer ; v: vector): real;
var i, aux: integer;
begin
aux:=0;
for i:=1 to dl do begin
aux:= aux+ v[i];
end;
promedio:= aux/dl;
end;
//_----------------------------------------------------------
//retorne nunero y promedio de cada alumno
procedure nuevaLista(l: lista; var l2: lista2);
begin
while l<>nil do begin
l2^.dat.nume:= l^.dato.num;
promedio (l^.dato.cantaprobadas,l^.dato.vecnotas);
end;
end;



//_----------------------------------------------------------
var
l: lista;
BEGIN
 l := nil;
  cargar(l);
	
END.

