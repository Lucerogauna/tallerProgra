{
   EJ 4 nota de clase
   * si se leen productos con el mismo codigo modifico el arbol 
   * cant y precio total : precio actual + prodxprecio del leido actual
 1. Implementar un programa modularizado para una librería que:
a. Almacene los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados la cantidad total de
unidades vendidas y el monto total. De cada venta se lee código de venta, código del
producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las
ventas finaliza cuando se lee el código de venta -1.
b. Imprima el contenido del árbol ordenado por código de producto.
c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el
código de producto con mayor cantidad de unidades vendidas.
d. Contenga un módulo que reciba la estructura generada en el punto a y un código de
producto y retorne la cantidad de códigos menores que él que hay en la estructura.
e. Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
producto y retorne el monto total entre todos los códigos de productos comprendidos
entre los dos valores recibidos (sin incluir).  
}

program p1e4;
type
prodVendidos= record
codP: integer;
canTotal: integer;
monTotal:real;
end;
venta= record
codVenta: integer;
codProd: integer;
cuv: integer;
precioU: real;
end;
arbol = ^nodo;
nodo= record
dato: prodVendidos;
hi: arbol;
hd: arbol;
end;
procedure leerV(var v: venta);
begin
with v do begin
  writeln('cod de Venta'); readln(codVenta);
  if (codVenta<>-1) then begin
  writeln('cod productos'); readln(codProd);
  writeln('cantidad de unidades vendidas'); readln(cuv);
  writeln('precio unitario'); readln(precioU);
  end;
end;
end;
procedure modificarA(var a: arbol; c: integer; m: real);
begin
writeln('l SUMA QUE HICE ES DE ',a^.dato.canTotal ,'MAS', c);
 a^.dato.canTotal:= a^.dato.canTotal + c;
 a^.dato.monTotal:= a^.dato.monTotal + (m *c);
end;
procedure agregarA(var a: arbol ;cod: integer; cant: integer; mon: real);
begin
if (a= nil) then begin 
new(a);
a^.dato.canTotal:= cant;
a^.dato.monTotal:= mon * cant ;
a^.dato.codP:= cod;

a^.hi:= nil;
a^.hd:= nil;
end
else if (cod < a^.dato.codP)then
  agregarA(a^.hi, cod, cant, mon)
  else if  (cod > a^.dato.codP) then 
  agregarA(a^.hd, cod, cant, mon)
  else 
  modificarA(a, cant, mon);
end;
procedure cargarA(var a: arbol);
var v: venta;
begin
leerV(v);
while (v.codVenta<> -1) do begin
 agregarA (a , v.codProd, v.cuv, v.precioU); // le cargo cod, cant Unidades, precio X unidad de la venta que leyo recien
leerV(v);
end;
end;
procedure imprimir(a: arbol);
begin
 if a<>nil then begin
  writeln('el codigo es', a^.dato.codP);
  writeln('la cantidad de unidades vendidas es de ', a^.dato.canTotal);
  writeln('el monto total es de',a^.dato.monTotal:2:0);
  imprimir(a^.hi);
  imprimir(a^.hd);
end;
end;
//c. Contenga un módulo que reciba la estructura generada en el punto a y retorne el código de producto con mayor cantidad de unidades vendidas.
procedure CALCULAR(cant: integer; cod: integer; var maxcod: integer; var maxv: integer);
begin
  if cant>maxv then begin
  maxv:= cant; 
  maxcod:= cod;
  end;
end;
procedure incisoC (a: arbol; var codM: integer; var maxvendid: integer);
begin
 if (a<> nil) then begin
   CALCULAR(a^.dato.canTotal, a^.dato.codP, codM, maxvendid);
   incisoC(a^.hi, codM, maxvendid);
   incisoC(a^.hd, codM, maxvendid);
   end;
end;
 function incisoD(a:arbol; x: integer): integer;//Contenga un módulo que reciba la estructura generada en el punto a y un código de 
 //producto y retorne la cantidad de códigos menores que él que hay en la estructura
 begin
 if (a<>nil) then begin
 if (a^.dato.codP < x) then  
   incisoD:= 1+ incisoD(a^.hd, x) + incisoD(a^.hi, x)
  else 
   incisoD:= 0 +incisoD(a^.hi, x)+ incisoD(a^.hd, x)// 
   end;
 end;
//Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de
//producto y retorne el monto total entre todos los códigos de productos comprendidos
//entre los dos valores recibidos (sin incluir).
function incisoE(a: arbol; n1: integer; n2: integer): real;
begin
 if (a <> nil) then begin
  if (a^.dato.codP > n1) and (a^.dato.codP < n2) then 
  incisoE:= 1+ incisoE(a^.hd, n1,n2) + incisoE(a^.hi, n1,n2)
  else 
   incisoE:= 0 +incisoE(a^.hi, n1, n2)+ incisoE(a^.hd, n1,n2)
   end;
end;
var ar: arbol;
 codMax, max, n, cantD: integer; 
 
BEGIN
max:= -1;
ar:= nil;
cargarA(ar);
imprimir(ar);//inciso b
incisoC(ar, codMax, max);
writeln ('el codigo con mas unidades vendidas es', codMax);
writeln('leer un numero random'); readln(n);
cantD:=incisoD(ar, n);
writeln(cantD);
END.

