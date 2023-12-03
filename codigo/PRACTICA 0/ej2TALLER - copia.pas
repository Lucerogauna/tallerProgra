{Implementar un programa que procese información de propiedades que están a la venta 
en una inmobiliaria. 
Se pide:
a) Implementar un módulo para almacenar en una estructura adecuada, las propiedades 
agrupadas por zona. Las propiedades de una misma zona deben quedar almacenadas 
ordenadas por tipo de propiedad. Para cada propiedad debe almacenarse el código, el tipo de 
propiedad y el precio total. De cada propiedad se lee: zona (1 a 5), código de propiedad, tipo 
de propiedad, cantidad de metros cuadrados y precio del metro cuadrado. La lectura finaliza 
cuando se ingresa el precio del metro cuadrado -1.
b) Implementar un módulo que reciba la estructura generada en a), un número de zona y un tipo de 
propiedad y retorne los códigos de las propiedades de la zona recibida y del tipo recibido}

program ej2TPinicial;
type
rang1= 1..5;
//actualizado 30/08 creo qiew esa bien

// no entiendo como cargar un vector de listas
propied = record
zona: rang1;
cod: integer; // se almacena
tipo: integer;// se almacena
cantdemetros: real; 
precioxmetro: real;// se almacena el precio total OJO
end;
pa= record
zona: rang1;
codigo: integer; // se almacena
tipoo: integer;// se almacena 
precio: real;
end;
 lista = ^nodo;
  nodo = record
    dato: pa;
    sig: lista;
  end;
  vec = array [1..5]of lista;
//________________________________________________________________
procedure leerPRO (var p: propied);
begin
with p do begin
writeln('zona');
readln (zona);
writeln('codigo');
readln (cod); 
writeln('tipo');
readln (tipo);
writeln('cant de  metro cuadrado');
readln (cantdemetros);
writeln('precio por metro cuadrado');
readln (precioxmetro);
 end;
 end;
 //________________________________________________________________
procedure insertarO (var l: lista; cod:integer; tipo: integer; prec: real);
var nue, act, ant: lista;
begin
new (nue);
nue^.dato.codigo:= cod;
nue^.dato.tipoo:= tipo;
nue^.dato.precio:= prec;
act:=l;
ant:= l;
while (act<>nil) and (nue^.dato.tipoo> act^.dato.tipoo) do begin
ant:= act;
act:= act^.sig;
end;
if act= ant then
l:= nue
else 
ant^.sig:= nue;
nue^.sig:= act;
 end;
//________________________________________________________________
function precio (valor: real; cant: real):real;
begin
precio:= valor * cant;
end;
//________________________________________________________________
procedure cargarV (var v:vec);
var pr: propied;
begin
leerPRO(pr);
while (pr.precioxmetro <> -1) do begin
insertarO (v[pr.tipo], pr.cod, pr.tipo, precio(pr.precioxmetro, pr.cantdemetros));
leerPRO(pr);
end;
 end;
 // imprimir vector de listas!!!!!!!!!!!!!!!!!!!!!!!!!!!!
procedure imprimirv(v: vec); 
var 
i: integer;
begin
for i:=1 to 5 do begin
  while( v[i] <>nil) do begin
  
    writeln('estas en la posicion numero',i);
    writeln(v[i]^.dato.codigo);
    writeln(v[i]^.dato.tipoo);
    writeln(v[i]^.dato.precio);
      v[i]:= v[i]^.sig;
  end;
end;
end;

procedure incisoB(v: vec; x: integer; tipobuscado: integer; var encontre: boolean);
begin
encontre:=false;
 while v[x]<>nil do begin
  while v[x]^.dato.tipoo <> tipobuscado do 
   v[x]:=v[x]^.sig;
   if v[x]^.dato.tipoo = tipobuscado then 
   encontre:= true;
     while v[x]^.dato.tipoo = tipobuscado do 
     writeln( v[x]^.dato.codigo)

end;
end;
 var 
 v: vec;
BEGIN
cargarV  (v);
imprimirv (v);
	
END.

