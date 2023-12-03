{
   3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
 a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
* ESTRUCTURA MAL NO SE COMO RECORREWR EL VEC DE ARBOLS
* me perdi, no se si hay que hacer un arbol dentro de un arbol o una lista dentro del arbol
}
program ej3p5;
type
rango = 1..10;
infoA= record
codig: integer;
stock: integer;
preciou: real;
end;
arbol2=^nodo2;
nodo2= record
dato2: infoA;
hi,hd: arbol2;
end;
vecRubro = array [rango] of arbol2;
procedure leerA(var a: infoA);
begin
writeln('leer codigo');
read(a.codig);
if a.codig<> -1 then begin
writeln('leer stock');
read(a.stock);
writeln('leer precio');
read(a.preciou);
end;
end;

procedure inicializarA(var v: vecRubro);
var i: integer;
begin
for i:= 1 to 10 do 
v[i]:= nil;
end;

procedure leer(var rub: integer; var a: infoA);
begin
writeln('leer rubro');
read(rub);
leerA(a);
end;
procedure agregarA2(var a2: arbol2; i: infoA);
begin
 if a2= nil then begin
 new(a2);
 a2^.dato2:= i;
 a2^.hi:= nil;
 a2^.hd:= nil;
 end
 else if (a2^.dato2.codig < i.codig) then 
  agregarA2(a2^.hi, i)
  else 
    agregarA2(a2^.hd, i);
 end;
procedure cargar(var a: arbol2; var v: vecRubro);
var 
rub: integer;
ai: infoA;
BEGIN
  inicializarA(v);
	leer(rub, ai);
	while (ai.codig <> -1 )do begin
	agregarA2(v[rub], ai); // el vector en la posiciion tiene un arbol, apunta a ese arbol y lo modiufica!!!
	leer(rub, ai);
	end;
END;

procedure mandaraImp(a2: arbol2);
begin
if a2 <> nil then begin
writeln('el cdigo de producto es de', a2^.dato2.codig);
writeln('el stoickj disponible es de', a2^.dato2.stock);
mandaraImp(a2^.hi);
mandaraImp(a2^.hd);
end;
end;  
procedure imprimira(  v: vecRubro);
var i: integer;
begin 
 for i:= 1 to 10 do begin
 writeln('estos son los datos de ', i);
if v[i] <> nil then 
  mandaraImp(v[i]);
end;
end;
function incisob(a: arbol2; cod: integer; rub: integer):boolean;
begin
if a <> nil then begin
if 
  a^.dato2.codig = cod then 
    incisob:= true
    else if a^.dato2.codig < cod  then 
      incisob:= incisob(a^.hd, cod, rub)
      else 
      incisob:= incisob(a^.hi, cod, rub)
      end
   else 
    incisob:= false 
end;

var ar: arbol2; 
v: vecRubro;
c, rub: integer;
begin
 cargar(ar, v);
 {
writeln('imprimir');
 imprimira(v); //algo anda mal
}
writeln('leer codigo a buscar');readln(c);
writeln('leer dentro de que rubro');readln(rub);
 writeln (incisob(ar, c, rub));
end.

