{1.- Se desea procesar la información de las ventas de productos de un comercio (como máximo
50).
Implementar un programa que invoque los siguientes módulos:
a. Un módulo que retorne la información de las ventas en un vector. De cada venta se conoce el
día de la venta, código del producto (entre 1 y 15) y cantidad vendida (como máximo 99
unidades). El código debe generarse automáticamente (random) y la cantidad se debe leer. El
ingreso de las ventas finaliza con el día de venta 0 (no se procesa).
b. Un módulo que muestre el contenido del vector resultante del punto a).
c. Un módulo que ordene el vector de ventas por código.
d. Un módulo que muestre el contenido del vector resultante del punto c).
e. Un módulo que elimine, del vector ordenado, las ventas con código de producto entre dos
valores que se ingresan como parámetros.
f. Un módulo que muestre el contenido del vector resultante del punto e).
g. Un módulo que retorne la información (ordenada por código de producto de menor a
mayor) de cada código par de producto junto a la cantidad total de productos vendidos.
h. Un módulo que muestre la información obtenida en el punto g).
* COMPLETAR
* }

program p1ORDENACION;
//preguntar inciso de eliminar
type
rang= 1..15;
rang2= 1..99;

infov= record
fecha: integer;
cod: rang; // se gener RAndom
cantV: rang2; //SE LEE
end;

 lista = ^nodo;
  nodo = record
    dato: infov;
    sig: lista;
  end;
vec = array [1..50]of lista;
//---------------------------------------
procedure leerVenta(var v: infov);
begin 
writeln('fecha');
read(v.fecha);
if (v.fecha  <> 0) then begin
writeln('codigo d producto');
v.cod:=random(15);
writeln('ingresa la cant de productos vendidos');
read(v.cantV);
end;
end;

//------------------------------------------
procedure agregaraLista(var l: lista; venta: infov);
var nue: lista;
begin
new(nue);
nue^.dato:= venta;
nue^.sig:= l;
l:=nue;
end;
//------------------------------------------
procedure cargarV( var ve: vec);
var v: infov; 
begin
leerVenta(v);
while (v.fecha <>0 ) do begin
AgregaraLista(ve[v.cod], v);
leerVenta(v);
end;
end;

//------------------------------------------
//MODULO B y D  MUESTRE EL CONTENIDO 
// imprimir vector de listas!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure imprimirv(v: vec); 
var 
i: integer;
begin
for i:=1 to 15 do begin
  while( v[i] <>nil) do begin
  
    writeln('estas en la posicion numero',i);
    writeln(v[i]^.dato.fecha);
    writeln(v[i]^.dato.cod);
    writeln(v[i]^.dato.cantV);
      v[i]:= v[i]^.sig;
  end;
end;
end;
//------------------------------------------
// ordene el vector de ventas por código ( HICE POR SELECCION )
procedure ordenar(dl:integer; var ve: vec);
var 
i, j, pos: integer;
info: infov;
begin
for i:=1 to 15 do begin
for i:=1 to dl-1 do begin
pos:= i;
  for j:=i +1 to dl do 
     if ((ve[j]^.dato.cod) < (ve[pos].^.dato.cod)) then
       pos:= j;
     info:= ve[pos];
       ve[pos]:=  ve[i] ;
        ve[i]:= info;
end;
end;
//PASOS PARA ELIMINAR
{1. BUSCO DESDE DONDE 
* 2. BUSCO HASTA DONDE
* 3. CORRIMIENTO
* 4.DECREMENTO DL}

//------------------------------------------
procedure eliminar (var v: vec; var dim: integer; n1: integer; n2: integer);
var i,x,y: integer;
begin
i:=1;
while v[i].cod <= n1 do  //mientras que el codigo de la posicion i sea menor que n1
   i:= i + 1; //avanza
x:= i; //posicion encontrada
while v[i].cod<= n2 do
 i:=i+1;
 y:= i; //tiene la posicion a eliminar n2
 //hago corrimientos
 for x:=x to y do 
 v[x]:=v[y+1]; // PREGUNTAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAR
end;
{
j:= n2;
if (n1 <dim ) and (n2<dim)then begin // chequea si existen la posicion de los numeros en el vector

   for j:= n2 to dim - 1 do begin  //desde la ubicacion maxima hasta dl 
            v[n1]:= v[j + 1]; //elemento de posn1 le asigno el  siguiente a n2, asi pisa el valor
            n1:= n1 + 1; //avanza 
          end;
        dim:= dim - (n2-n1); //dec dl
end;
end;
* }
var vect: vec;
dl: integer;
BEGIN
    randomize;
	cargarV(vect, dl);
	ordenar(dl, vect);
	eliminar (vect, dl, 1, 3);
	imprimir (vect, dl);
END.

