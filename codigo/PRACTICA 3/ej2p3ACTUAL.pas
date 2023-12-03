{ACTUAL
2. Escribir un programa que:
a. Implemente un módulo que lea información de ventas de un comercio. De cada venta se lee
código de producto, fecha y cantidad de unidades vendidas. La lectura finaliza con el código de
producto 0.
*  Un producto puede estar en más de una venta. 
* Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendida.
Nota: El módulo debe retornar los dos árboles.
b. Implemente un módulo que reciba el árbol generado en i. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
* c. Implemente un módulo que reciba el árbol generado en ii. y un código de producto y retorne
la cantidad total de unidades vendidas de ese producto.
   
   
}


program ej2p3;
type
prod= record
cod: integer;
fecha: integer;
cantvendidas: integer;
end;
prod2= record
codigo: integer;
cuvTOTAL:integer;
end;
arbol= ^nodo;
nodo = record
dato: prod;
hi: arbol;
hd: arbol;
end;
arbol2= ^nodo2;
nodo2 = record
info: prod2;
hi: arbol2;
hd: arbol2;
end;
procedure leerp(var p: prod; var p2: prod2);
begin
with p do begin
writeln('leer cod'); readln(cod);
writeln('leer fecha'); readln(fecha);
writeln('leer cant de unidades vendidas'); readln(cantvendidas);
end;
p2.codigo:=p.cod; p2.cuvTOTAL:= p.cantvendidas;
end;
procedure mandarArbol(var a: arbol; dat: prod);
begin 
 if a = nil then begin 
 new (a);
 a^.dato:= dat;
 a^.hi:=nil; a^.hd:= nil;
 end;
 if dat.cod<= a^.dato.cod then mandarArbol(a^.hi, dat)
 else 
   mandarArbol(a^.hd, dat)
end;

procedure modificarA2(var a:arbol2;cuv: integer);
begin
a^.info.cuvTOTAL:= a^.info.cuvTOTAL + cuv;
end;
procedure mandarA2(var a2: arbol2; d: prod2);
begin 
 if a2= nil then begin 
 new (a2);
 a2^.info:= d;
 a2^.hi:=nil; a2^.hd:= nil;
 end
 else if (a2^.info.codigo =  d.codigo) then 
   modificarA2(a2, d.cuvTOTAL);
 if (d.codigo<= a2^.info.codigo) then mandarA2(a2^.hi, d)
 else 
   mandarA2(a2^.hd, d)
end;
procedure cargarA(var a: arbol; var a2: arbol2);
var p: prod; pp: prod2;
begin
leerp(p,pp);
while (p.cod<>0)do begin
 mandarArbol(a, p);
 mandarA2(a2,pp);
leerp(p, pp);
end;
end;
function incisoB(a: arbol; cod: integer): integer;
begin
 if (a = nil) then 
   incisoB:= -1
 else if (cod = a^.dato.cod) then 
   incisoB:= a^.dato.cantvendidas
   else if( cod < a^.dato.cod )then s
     incisoB:=incisoB(a^.hi, cod)
      else  incisoB:= incisoB(a^.hd, cod)
 end;
 
function incisoc(a2: arbol2; cod: integer): integer;
begin
 if (a2 = nil) then 
   incisoC:= -1
 else if (cod = a2^.info.codigo) then 
   incisoC:= a2^.info.cuvTOTAL
   else if( cod < a2^.info.codigo )then 
     incisoC:=incisoC(a2^.hi, cod)
      else  incisoC:= incisoC(a2^.hd, cod)
 end;
var 
a: arbol;
a2: arbol2 ;
x:integer;
BEGIN
	a:=nil; a2:=nil;
	cargarA(a, a2); //inciso i
	read(x);
	incisoB(a,x); // esta bien?
	incisoC(a2,x);
END.

