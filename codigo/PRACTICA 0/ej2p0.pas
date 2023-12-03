{
   Implementar un programa que procese información de propiedades que están a la venta 
en una inmobiliaria. 
Se pide:
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades 
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas 
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de 
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo 
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza 
cuando se ingresa el precio del metro cuadrado -1.
b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de 
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido
   
}

program Ejercicio2PracticaInicialNUEVO;
type
rango= 1..5;
rango2= 1..3; //1:casa, 2: depto, 3: hotel
propiedad= record
cod: integer;
tipo: rango2;
precioT: real;
end;

pro = record
zona: rango;
c: integer; // se almacena
t: integer;// se almacena
cantdemetros: real;
precioxmetro: real;// se almacena el precio total OJO
end;
lista=^nodo;
nodo= record
dato: propiedad;
sig:lista;
end;

vector= array [rango] of lista;

procedure leer(var p: pro );
begin
with p do begin
writeln('precio por metro cuadrado');
readln (precioxmetro);
if (precioxmetro<> -1) then begin
writeln('zona');
readln (zona);
writeln('codigo');
readln (c); 
writeln('tipo');
readln (t);
writeln('cant de  metro cuadrado');
readln (cantdemetros);
end;
end;
end;


procedure inicializarVectorDeLista(var v: vector);
var i: integer;
begin
 for i:=1 to 5 do
 v[i]:=nil;
end;

  

{procedure agregarVec (var ve: vector; dato: lista);
 begin 
ve:= dato;
 end;
}

procedure insertarO (var l: lista; cod:integer; tipo: integer; prec: real);
var nue, act, ant: lista;
begin
new (nue);
nue^.dato.cod:= cod;
nue^.dato.tipo:= tipo;
nue^.dato.precioT:= prec;
act:=l;
ant:= l;
while (act<>nil) and (nue^.dato.tipo> act^.dato.tipo) do begin
ant:= act;
act:= act^.sig;
end;
if act= ant then
l:= nue
else 
ant^.sig:= nue;
nue^.sig:= act;
 end;

procedure cargar(var l: lista);
var prop: pro;
v: vector;
begin
leer(prop);
while (prop.precioxmetro<>-1) do begin
  insertarO(l,prop.c, prop.t, (prop.cantdemetros * prop.precioxmetro));
 // agregarVec(v[pro.zona], l^.dato)
  leer(prop);
end;
end;
var 
li:lista;

BEGIN
	
	
END.

