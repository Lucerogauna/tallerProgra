{
1. Escribir un programa que:
a. Implemente un módulo que lea información de socios de un club y las almacene en un árbol
binario de búsqueda. De cada socio se lee número de socio, nombre y edad. La lectura finaliza
con el número de socio 0 y el árbol debe quedar ordenado por número de socio.
b. Una vez generado el árbol, realice módulos independientes que reciban el árbol como
parámetro y que :
i. Informe el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informe los datos del socio con el número de socio más chico. Debe invocar a un módulo
recursivo que retorne dicho socio.
iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que
retorne dicho valor.
iv. Aumente en 1 la edad de todos los socios.
v. Lea un valor entero e informe si existe o no existe un socio con ese valor. Debe invocar a
un módulo recursivo que reciba el valor leído y retorne verdadero o falso.
vi. Lea un nombre e informe si existe o no existe un socio con ese nombre. Debe invocar a
un módulo recursivo que reciba el nombre leído y retorne verdadero o falso.
vii. Informe la cantidad de socios. Debe invocar a un módulo recursivo que retorne dicha
cantidad.
viii. Informe el promedio de edad de los socios. Debe invocar al módulo recursivo del inciso
vii e invocar a un módulo recursivo que retorne la suma de las edades de los socios.
xi. Informe los números de socio en orden creciente.
x. Informe los números de socio pares en orden decreciente.
   
}

program ej1p3;
type
socio= record
nro: integer;
nombre: string;
edad: integer;
end;
arbol= ^nodo;
nodo= record
dato: socio;
hi: arbol;
hd: arbol;
end;
procedure leerSocio(var s: socio);
 begin
  writeln('leer numero de socio');
  readln(s.nro);
    if s.nro<>0 then 
     begin
      writeln('lee nombre');
      readln(s.nombre);
      writeln('lee edad');
      readln(s.edad);
     end;
 end;
procedure agregarARBOL(var a : arbol; s: socio);
 begin
   if (a = nil) then begin
     new (a);
     a^.dato:= s;
     a^.hi:=nil;
     a^.hd:= nil;
     end
   else if (s.nro <= a^.dato.nro) then 
     agregarARBOL(a^.hi, s)
     else  
     agregarARBOL(a^.hd, s);
  end;
procedure cargarARBOL(var  a: arbol);
var 
so: socio;
begin
 a:= nil;
 leerSocio(so);
 while (so.nro<> 0) do begin
   agregarARBOL(a, so);
   leerSocio(so);
end;
end;
procedure informaarmax(a: arbol);

function maximo(a: arbol): integer; // como puedo hacer con una funcion y donde inicializo]???????????????
begin
 if a= nil then maximo:=-1
      else if (a^.hd = nil) then maximo:= a^.dato.nro
                          else maximo:= maximo (a^.hd);
  end;
begin 
writeln('el numero de socio mas gracnde es:', maximo(a));
end;

var a : arbol;
BEGIN	
cargarARBOL(a);
informaarmax(a);
END.

