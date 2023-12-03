  {ACTUAL
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
* 
* inicializa suma??????? 
* algo esta mal en buscar el nombre
* resuelto 
* en clase 7/9
   
   a  tener en cuenta busqueda aprovechar elorden del arbol
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
// inciso i
procedure informaarmax(a: arbol);

function maximo(a: arbol): integer; //
begin
 if a= nil then maximo:=-1
      else if (a^.hd = nil) then maximo:= a^.dato.nro
                          else maximo:= maximo (a^.hd);
  end;
begin 
writeln('el numero de socio mas gracnde es:', maximo(a));
end;
procedure datosmin(a: arbol);
function minimoNodo(a: arbol): arbol;
begin
 if (a= nil) then minimoNodo:= nil
   else if (a^.hi = nil) then minimoNodo:= a
                          else minimoNodo:= minimoNodo (a^.hi);
  end;
var 
 min:arbol;
begin
min:= minimoNodo(a);
if (min<>nil) then
writeln('el numero de socio menor es:', min^.dato.nombre);
writeln('el numero de socio menor es:', min^.dato.nro);
writeln('el numero de socio menor es:', min^.dato.edad);
end;

  procedure nro_max_edad(a: arbol;var max: integer; var nrosocio: integer); // iii. Informe el número de socio con mayor edad. Debe invocar a un módulo recursivo que retorne dicho valor.
  //nota de clase: tiene que ser un procedimiento para guardarse el maximo y comparar con eso

  begin 
  if (a <> nil) then begin
   if (a^.dato.edad > max) then 
   begin
    max:= a^.dato.edad;
    nrosocio:= a^.dato.nro;
    end;
    nro_max_edad(a^.hi,max, nrosocio);
    nro_max_edad(a^.hd,max, nrosocio);
    end
    else  max:=-1;
  end;
procedure arbolmodificado(var a: arbol); // use preorden 
begin
  if (a <> nil) then begin
   a^.dato.edad:= a^.dato.edad +1;
   writeln('la edad fue modificada',a^.dato.edad);
   arbolmodificado(a^.hi);
   arbolmodificado(a^.hd);
   end;
end;
function esta (a: arbol; n: integer):boolean; // bienn
begin
if (a = nil)  then 
 esta:= false
  else if (a^.dato.nro = n )then  // ACORDARSE DELOS ELSE IF Y ELSE E
    esta:= true
    else if (n < a^.dato.nro) then 
     esta:= esta (a^.hi, n)
       else esta:= esta (a^.hd, n);
     end;
     
function estaNOMBRE (a: arbol; nom: string):boolean; // 
begin
if (a = nil)  then 
 estaNOMBRE:= false
  else if (a^.dato.nombre = nom )then 
    estaNOMBRE:= true
    else  if (a^.dato.nombre <> nom )  then
     estaNOMBRE:= estaNOMBRE (a^.hi, nom)
     else
      estaNOMBRE:= estaNOMBRE (a^.hd, nom);
     end;
function cantSocios(a:arbol): integer;
begin
 if (a<>nil) then  
  cantSocios:=1 + cantSocios(a^.hi)+ cantSocios(a^.hd)
   else cantSocios:= 0;
   end;
var a : arbol;
ok, ok2: boolean;
x, total: integer;
nombre: string;
BEGIN	
cargarARBOL(a);
informaarmax(a); //inciso i
datosmin(a);//inciso ii
{nmax:= nro_max_edad(a); write('el numero de socio con mayor edad es ',nmax);//inciso iii}
 arbolmodificado(a); //inciso iv
writeln('leer un valor entero');
readln(x);
ok:= esta(a, x);
 writeln('el valor leido ', ok);//inciso v
writeln('leer un nombre');
readln(nombre);
ok2:= estaNOMBRE(a, nombre);
 writeln('es   ', ok2, 'que el  nombre esta en el  arbol');//inciso vi
 total:=cantSocios(a);
 writeln('la cantidadtotal leida es de', total);
END.

