{- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.
* 
* 
* 
* BIEN 
* }program ej2p1;
const
  df= 300;
type
  reg= record
    cod:integer;
    dni: integer;
    valor: real;
  end;
  vec= array [1..df] of reg;
procedure leer(var r: reg);
begin
writeln('ingrese el codigo de id');
r.cod:=random(10)-1;
if (r. cod <> -1) then begin
writeln('ingrese el dni');
r.dni:=random(32000);
writeln('ingrese valor'); 
r.valor:=random(10000);
end;
end;
procedure cargarV(var v: vec; var dl:integer);
var r: reg;
i: integer;
begin
leer(r);
i:=0;
while (r.cod<>-1)and(i<= df) do begin
i:=i+1;
v[i]:= r;
leer(r);
end;
dl:=i;
end;
procedure seleccion (var ve: vec; dl:integer );
var 
i, j, pos: integer;
info: reg;
begin
for i:=1 to dl-1 do begin
pos:= i;
  for j:=i +1 to dl do 
     if (ve[j].cod) < (ve[pos].cod) then
       pos:= j;
     info:= ve[pos];
       ve[pos]:=  ve[i] ;
        ve[i]:= info;
end;
end;
procedure insercion (var v: vec; dl: integer);
var 
i, j: integer;
act: reg;
begin
for i:=2 to dl do begin
act:= v[i];
 j:= i-1;
  while (j> 0) and (v[j].cod>act.cod) do begin
  v[j+1]:= v[j];
  j:= j-1;
  end;
  v[j+1]:= act;
end;
end;
var 
ve: vec; 
dl,i: integer;
begin
randomize;
cargarV(ve, dl);
seleccion(ve, dl);
insercion(ve, dl);
for i:=1 to dl do begin
  writeln(ve[i].cod);
  writeln(ve[i].dni);
  writeln(ve[i].valor:3:3);
end;
end.
