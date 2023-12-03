{
 3. Una facultad nos ha encargado procesar la información de sus alumnos de la carrera XXX.
Esta carrera tiene 30 materias. Implementar un programa con:
a. Un módulo que lea la información de los finales rendidos por los alumnos y los
almacene en dos estructuras de datos.
i. Una estructura que para cada alumno se almacenen sólo código y nota de las
materias aprobadas (4 a 10). De cada final rendido se lee el código del alumno, el
código de materia y la nota (valor entre 1 y 10). La lectura de los finales finaliza con
nota -1. La estructura debe ser eficiente para buscar por código de alumno.
ii. Otra estructura que almacene para cada materia, su código y todos los finales
rendidos en esa materia (código de alumno y nota).
b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.
c. Un módulo que reciba la estructura generada en i., dos códigos de alumnos y un valor
entero, y retorne la cantidad de alumnos con cantidad de finales aprobados igual al
valor ingresado para aquellos alumnos cuyos códigos están comprendidos entre los dos
códigos de alumnos ingresados.
   
}


program ej3p4;
type
rang = 4..10;
rang2 = 1..10;

alumno= record
cod: integer;
nota: rang;
end;
F_rendidos= record
codA: integer;
codM: integer;
notaf: rang2;
end;

arbol= ^nodo;
nodo= record
dato: alumno;
hi: arbol;
hd: arbol; 
end;
procedure leerF(var f: F_rendidos);
begin
with f do begin
 writeln('codigo de alumno');readln(codA);
 writeln('codigo de mATERIA');readln(codM);
 writeln('nota');readln(notaf);
 end;
 end;

 procedure agregarA(var a: arbol; alum: integer; n: integer);
 begin
  if (a= nil) then begin
  new(a);
  a^.dato.cod:= alum;
  a^.dato.nota:= n;
  a^.hi:= nil; 
  a^.hd:= nil;
  end
   else if (alum < a^.dato.cod) then
    agregarA(a^.hi, alum, n)
    else 
      agregarA(a^.hd, alum, n)
 end;
 procedure cargarA(var a: arbol);
 var f: F_rendidos;
 begin
  a:= nil;
  leerF(f);
  while (f.notaf <> -1) do begin
     if (f.notaf > 4 ) then
       agregarA(a, f.codA, f.notaf);
     leerF(f);
 end;
 end;
 {b. Un módulo que reciba la estructura generada en i. y un código de alumno y retorne los
códigos y promedios de los alumnos cuyos códigos sean mayor al ingresado.}
procedure incisoB(a: arbol; codA: integer; var l: lista);
begin
end
 var ar: arbol;
BEGIN
	cargarA(ar);
	
END.

