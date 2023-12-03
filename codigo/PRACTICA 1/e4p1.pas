{
  Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).
   
}
program ej4p1;
type
rang= 1..8;
productos=record
cod: integer;
codR: rang;
precio: real;
end;
lista= ^nodo;
nodo= record
dato: productos;
sig: lista;
end;
vec= array [1..30]of productos;
procedure leerP(var v: productos);
begin 
writeln('cod');
read(v.cod);
if (v.cod  <> 0) then begin
writeln('codigo d rubro entre 1 a 8');
read(v.codR);
writeln('ingresa el precio');
read(v.precio);
end;
end;
//inciso D
procedure seleccion (var ve: vec; dl:integer );
var 
i, j, pos: integer;
info: productos;
begin
for i:=1 to dl-1 do begin
pos:= i;
  for j:=i +1 to dl do 
     if (ve[j].precio) < (ve[pos].precio) then
       pos:= j;
     info:= ve[pos];
       ve[pos]:=  ve[i] ;
        ve[i]:= info;
end;
end;
// inciso E
procedure imprimir(v: vec; dl: integer);
var
  i: integer;
begin
  for i:= 1 to dl do
    begin
      Writeln('En la pos',i, ' estan estos datos');
      Writeln('codigo de producto: ',v[i].cod);
      Writeln('precio: ',v[i].precio);
    end;
end;
//inciso F


procedure insertalO(var l: lista; p: productos);
var
nue, act, ant: lista;
begin
new(nue);
nue^.dato:= p;
act:= l;
ant:= l;
while (act<>nil) and (act^.dato.cod< nue^.dato.cod) do begin 
ant:= act;
act:= act^.sig;
end;
if (act = ant) then
 l:= nue
 else 
 ant^.sig:= nue;
 nue^.sig:= act;
 end;
BEGIN
	
	
END.

