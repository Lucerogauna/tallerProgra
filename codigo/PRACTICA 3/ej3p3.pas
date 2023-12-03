{
   3. Implementar un programa que contenga:
a. Un módulo que lea información de alumnos de Taller de Programación y los almacene en
una estructura de datos. De cada alumno se lee legajo, DNI, año de ingreso y los códigos y
notas de los finales rendidos. La estructura generada debe ser eficiente para la búsqueda por
número de legajo. La lectura de los alumnos finaliza con legajo 0 y para cada alumno el ingreso
de las materias finaliza con el código de materia -1.
b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de
aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.
c. Un módulo que reciba la estructura generada en a. y retorne el legajo más grande.
d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.
e. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
e. Un módulo que reciba la estructura generada en a. y retorne el legajo y el promedio del
alumno con mayor promedio.
f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado
   
consultar inciso B y F, tienen que ser en una nueva estructura???????? oseas una lista?
}

program ej3p3;
type
regMaterias= record
 cod: integer;
 nota: integer;
 end;
 
lista= ^nodo;
nodo= record
dato: regMaterias;
sig: lista;
end;
alumno= record
leg: integer;
dni: integer;
anioingreso: integer;
mater: lista;
end;
arbol= ^nodoA;
nodoA= record
info: alumno;
hi: arbol;
hd: arbol;
end;
procedure agregarAd(var l: lista; d: regMaterias);
var nue: lista;
begin 
new (nue);
nue^.dato:= d;
nue^.sig:= l;
l:= nue;
end;
procedure cargarmaterias( var m: regMaterias);
var l:lista;
begin
writeln('leer codidifo de materia');
 readln(m.cod);
 while m.cod<> -1 do begin
writeln('leer NOTA de materia');
   readln(m.nota);
   agregarAd(l, m);
     writeln('leer codigo de materia');
    readln(m.cod);
    end;
    end;
// ALMACENA POR NUMERO DE LEGAJO 
procedure leera(var a: alumno);
var m:regMaterias;
begin
a.mater:= nil;
 writeln('legajo'); readln(a.leg);
 if a.leg <> 0 then begin
 writeln('leer dni'); readln(a.dni);
 writeln('leeer anio de ingreso'); readln(a.anioingreso);
 cargarmaterias(m);
 end;
 end;
 /// ESTA BIEN ALMACENADO ASI??
 procedure agregarARBOL(var a: arbol; d: alumno);
 begin
  if (a= nil) then begin
   new(a);
   a^.info:= d; 
   a^.hi:= nil;
   a^.hd:=nil;
   end
  else if d.leg <a^.info.leg then agregarARBOL(a^.hi, d)
   else agregarARBOL(a^.hd, d);
 end;
 procedure cargarARBOL(var ar: arbol);
 var a: alumno;
 begin
   leera(a);
   while (a.leg<> 0) do begin
     agregarARBOL(ar, a);
     leera(a);
   end;
 end;
 procedure imprimir(a: arbol);
 begin
 if a<> nil then begin
 writeln(a^.info.leg);
 imprimir(a^.hi);
 imprimir(a^.hd);
 end;
 end;
 
function incisoc(a: arbol): integer;
begin
if (a^.hd= nil) then
   incisoc:= a^.info.leg
 else 
   incisoC:= incisoC(a^.hd);
end;
function incisoD(a: arbol): integer;
var 
max: integer;
begin
if (a<>nil) then begin
 if (a^.info.dni > max) then
   max:= a^.info.dni;
  incisoD:= incisoD(a^.hi);
  incisoD:= incisoD(a^.hd);
end
else
 max:= -1;
end;
 var a: arbol;
BEGIN
	a:=nil; 
	cargarARBOL(a);
	imprimir(a);
END.

