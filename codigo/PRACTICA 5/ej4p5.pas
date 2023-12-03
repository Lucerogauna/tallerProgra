
{4. Una oficina requiere el procesamiento de los reclamos de las personas. De cada reclamo
se lee código, DNI de la persona, año y tipo de reclamo. La lectura finaliza con el código de
igual a -1. Se pide:
a) Un módulo que retorne estructura adecuada para la búsqueda por DNI. Para cada DNI
se deben tener almacenados cada reclamo y la cantidad total de reclamos que realizó.
b) Un módulo que reciba la estructura generada en a) y un DNI y retorne la cantidad de
reclamos efectuados por ese DNI.
c) Un módulo que reciba la estructura generada en a) y dos DNI y retorne la cantidad de
reclamos efectuados por todos los DNI comprendidos entre los dos DNI recibidos.

d) Un módulo que reciba la estructura generada en a) y un año y retorne los códigos de
los reclamos realizados en el año recibido.* 
* 
* HECHO TODOOOO :)}

program ej4p5;
type
reclamo = record
cod: integer;
dni: integer;// dato inescesario porque ya esta ordenado el arbol por dni
anio: integer;
tipo: integer
end;
lista= ^nod; // lista de reclamos 
nod= record
d: reclamo;
sig: lista;
end;
listan= ^nod1; // lista de codigos 
nod1= record
cod: integer;
sig: listan;
end;
infoA= record
rec: lista; // tiene la lista de reclamos
cantR: integer; // cantidad de reclamos que va haciendo
end;
info1= record// el arbol tiene el dni
dni1: integer; 
extra: infoA; // los datos extra son la lista y cant de reclamos 
end;
arbol=^nodo;
nodo= record
dato: info1; 
hi,hd: arbol;
end;

procedure leerr(var r: reclamo);
begin
writeln('leer codigo');
read(r.cod);
if r.cod<> -1 then begin
writeln('leer dni');
read(r.dni);
writeln('leer anio');
read(r.anio);
writeln('leer tipo');
read(r.tipo);
end;
end;
procedure mandarALista(var l: lista; r: reclamo );
var nue: lista;
begin
  new(nue);
  nue^.d.cod:= r.cod;
  nue^.d.anio:= r.anio;
  nue^.sig:= l;
  l:= nue;
end;
procedure agregarA(var a: arbol; r: reclamo);
begin
if a = nil then begin
new(a);
a^.dato.dni1:= r.dni;
a^.dato.extra.cantR:= a^.dato.extra.cantR+ 1; 
mandarALista(a^.dato.extra.rec, r);
a^.hi:= nil; 
a^.hd:= nil;
end
else if (a^.dato.dni1 = r.dni) then  begin
mandarALista(a^.dato.extra.rec, r);
a^.dato.extra.cantR:= a^.dato.extra.cantR+ 1 // bieeeeeeeeeeeeeeeen aumento en uno la cantidad de reclamos
end
else if a^.dato.dni1 < r.dni then
  agregarA(a^.hd, r)
  else 
  agregarA(a^.hi, r)
end; 
procedure cargara(var a: arbol);
var r: reclamo;
begin
leerr(r);
while (r.cod <> -1 ) do begin
agregarA(a, r);
leerr(r);
end;
end;
procedure imprimirL(l: lista);
begin
while (l<> nil) do begin
writeln('el codigo es es', l^.d.cod);
l:= l^.sig;
end;
end;
procedure imprimir(a2: arbol);
begin
if (a2 <> nil) then begin
writeln('-------ESTOY EN EL ARBOL-----------');
writeln('el dni es', a2^.dato.dni1);
writeln('mando a imprimir la lista');
imprimirL(a2^.dato.extra.rec);
writeln('la cantidad de reclamos de este dni fue de:', a2^.dato.extra.cantR);
imprimir(a2^.hi);
imprimir(a2^.hd);
end;
end; 
function incisoc(a:arbol; dnix: integer): integer;
 begin
  if a = nil then  incisoc:= 0 
  else if a^.dato.dni1= dnix then
    incisoc:=a^.dato.extra.cantR
    else if dnix > a^.dato.dni1 then 
    incisoc:= incisoc(a^.hd, dnix)
    else
    incisoc:= incisoc(a^.hi, dnix )
 end;
procedure imprimirL2(l: listan);
begin
while (l<> nil) do begin
writeln('el codigo es es', l^.cod);
l:= l^.sig;
end;
end;
 procedure mandarALista2(var ln: listan; co: integer );
var nu: listan;
begin
  new(nu);
  nu^.cod:= co;
  nu^.sig:= ln;
  ln:= nu;
end;

 procedure incisoD(a: arbol; an: integer; var nl: listan); // bien
begin
 if a<> nil then begin
   while a^.dato.extra.rec <> nil do begin
    if (a^.dato.extra.rec^.d.anio = an) then 
    mandarALista2(nl, a^.dato.extra.rec^.d.cod);
    a^.dato.extra.rec:= a^.dato.extra.rec^.sig;
    end;
    incisoD(a^.hi, an, nl);
   incisoD(a^.hd, an, nl);
end;
end;
var a : arbol;
dniC, an: integer;
nl: listan;
Begin
nl:= nil;
a:= nil;
cargara(a);{
imprimir(a);
writeln('leer dni a buscar');
read(dniC);
writeln('la cantidad de reclamos de ese dni es:', incisoc(a, dniC));
writeln('leer otro dni a buscar');
read(dniC);
writeln('la cantidad de reclamos de ese dni es:', incisoc(a, dniC));}
writeln('leer anio buscar');
read(an);
incisoD(a, an, nl);
imprimirL2(nl);
END.

