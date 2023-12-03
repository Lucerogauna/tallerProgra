{ACTUAL
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
* listo! :)
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
infoB= record
dnib: integer;
anioinB: integer;
end;
lista2= ^nodo2;
nodo2= record
dato2: infoB;
sig:lista2;
end;
infoF= record
prom: real;
leg: integer;
end;
lista3= ^nodo3;
nodo3= record
dato3:infoF;
sig:lista3;
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
procedure agregar_a_lista(dni: integer; anio: integer; var l:lista2);
var nue: lista2;
begin
new(nue);
nue^.dato2.dnib:=dni; nue^.dato2.anioinB:= anio;
nue^.sig:=l;
l:= nue;
end;
procedure incisob(a: arbol; x: integer;var l:lista2); //preguntar 
//b. Un módulo que reciba la estructura generada en a. y retorne los DNI y año de ingreso de 
//aquellos alumnos cuyo legajo sea inferior a un valor ingresado como parámetro.

begin 
if a<>nil then begin
 if a^.info.leg < x then 
 begin
  agregar_a_lista(a^.info.dni, a^.info.anioingreso, l);
  incisob(a^.hi, x,l);
  incisob(a^.hd, x,l)
 end
 else  incisob(a^.hi, x, l);
  end;
end; 
function incisoc(a: arbol): integer; //retorna  el legajo mas grande smt wrong
begin
if (a^.hd= nil) then
   incisoc:= a^.info.leg
 else 
   incisoC:= incisoC(a^.hd);
end;
procedure  incisoD(a: arbol;  var maxdni: integer);//d. Un módulo que reciba la estructura generada en a. y retorne el DNI más grande.

begin
if (a<>nil) then begin
 if (a^.info.dni > maxdni) then 
   maxdni:= a^.info.dni;
  incisoD(a^.hi, maxdni);
  incisoD(a^.hd,maxdni);
  writeln('el dni maximo leido es', maxdni)
end
else
 maxdni:= -1;
 
end;

function incisoe(a: arbol): integer; //chequear algo devuelve mal
begin
if a=nil then incisoe:=0
 else if ( a^.info.dni mod 2 = 0 )then // podria ser otra funcion donde devuelva boolean para que quede modularizado
 incisoe:= 1+ incisoe(a^.hd)+incisoe(a^.hi) //solucion poco legible ver cuaderno
 else incisoe:=0 + incisoe(a^.hd)+incisoe(a^.hi);
end;


//f. Un módulo que reciba la estructura generada en a. y un valor entero. Este módulo debe
//retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado
 
procedure calcularProm(l: lista; var p: real);
var suma, cantM: integer;
begin
suma:=0; cantM:=0;
 while l<> nil do begin
    suma:= l^.dato.nota + suma;
    cantM:= cantM + 1;
    l:= l^.sig;
    end;
end;
procedure agregarl3(prome: real; leg: integer; var l:lista3);
var nue: lista3;
begin
new(nue);
nue^.dato3.prom:=prome; nue^.dato3.leg:= leg;
nue^.sig:=l;
l:= nue;
end;
procedure incisoF(a: arbol; x: integer; var l3:lista3);
var promedio: real;
begin
  if a<>nil then begin
   calcularProm(a^.info.mater, promedio);
     if promedio > x then
       agregarl3(promedio, a^.info.leg, l3);
     incisoF(a^.hi, x, l3);
     incisoF(a^.hd, x, l3);
  end;
end;
 var a: arbol; l2: lista2; l3:lista3;
 mdni,num, legajomax, e, valor: integer;
BEGIN
	a:=nil; 
	l2:=nil;
	l3:=nil;
	cargarARBOL(a);
	{imprimir(a);
	writeln('ingresa un numero');
	readln(num);
	incisob(a,num,l2); ///
	incisob(a,num,l2); ///
	legajomax:=incisoc(a); write('legajo mas grande es', legajomax);
	incisoD(a, mdni); writeln('el dni max leido fue ', mdni);
	writeln('ingresa un valor para el inciso f');
	readln(valor);
	incisoF(a, valor, l3);}
	e:= incisoe(a);
	writeln('la cantidad de alumnos con legajo impar es de', e);
END.

