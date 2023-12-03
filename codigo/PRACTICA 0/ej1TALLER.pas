
//TALLER DE PROGRAMACION 2023
//creo que esta bien, a corregir
program ejINICIAL;
type 
rang1= 1..36;
notas= 1..10;
vector = array [rang1] of notas;
alumno= record
nom: string;
num: integer;
anio: integer;
cantaprobadas: rang1;
vecnotas: vector;
end;
alumno2= record
nume: integer;
prom:real;
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
procedure cargarvec( dl:integer; var v: vector);
var i: integer;
begin
for i:= 1 to dl do begin
writeln('ingresa la nota numero:', i);
readln(v[i]);
end; 
end;
//---------------------------------------------------
procedure leer( var a: alumno{; var vec: vector});
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
//cargarvec(cantaprobadas, vec)
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
// v:vector;
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
writeln('nota',v[i]);
aux:= aux+ v[i];
end;
writeln(aux);
promedio:= aux/dl;
writeln('el promedio del alumno es ',promedio);
end;
//------------------------------------------------------
procedure agregarL2 (var l2: lista2; nro: integer; prome: real);
var 
nu: lista2;
begin
new (nu);
nu^.dat.nume:= nro;
nu^.dat.prom:= prome;
nu^.sig:= l2;
l2:= nu;
end;
//_----------------------------------------------------------
//retorne nunero y promedio de cada alumno
procedure nuevaLista(l: lista; var l2: lista2);
begin
while l<>nil do begin
agregarL2(l2, l^.dato.num,  promedio (l^.dato.cantaprobadas,l^.dato.vecnotas));
l:=l^.sig;
end;
end;



//_----------------------------------------------------------
procedure imprimirL2(l2:lista2);
var act: lista2;
begin
act:=l2;
while (act<>nil) do begin
writeln('alumno nro:', act^.dat.nume);
writeln('el promedio de todas las notas es:', act^.dat.prom);

act:=act^.sig;
end;
end;
procedure imprimirL(l:lista);
begin
while (l<>nil) do begin
writeln('alumno nro:', l^.dato.num);
writeln('nombre es:', l^.dato.nom);
l:=l^.sig;
end;
end;
//_----------------------------------------------------------
var
l: lista;
l2:lista2;
BEGIN
 l := nil;
 l2:=nil;
  cargar(l);
  nuevaLista(l,l2);
	imprimirL2(l2);
END.
