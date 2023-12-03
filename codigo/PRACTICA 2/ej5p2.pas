{
5.- Implementar un módulo que realice una búsqueda dicotómica en un vector, utilizando el
siguiente encabezado:
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector.
   
}


program untitled;
const
df= 6;
type
 indice=1..df;
 vector= array[indice] of integer;
 
procedure leern(var n: integer);
begin
writeln('ingresa un numero ');
 
//readln(n);
 n:= random(10);
 writeln('se leyo el numero ',n);
end;
procedure cargarv(var v: vector; i: integer);
var n:integer;
begin
leern(n);
 i:=i+1;
 if i<>df then begin
 cargarv(v, i);
 v[i]:= n;
 end;
 writeln('se leyeron tantos numeros', i);
end;
Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: integer);
var medio: integer;
begin 
pos:= -1;;
ini:=1; fin:=df; medio:= (ini+fin) div 2;
while (ini <= fin) and (dato<> v[medio]) do begin
if dato< v[medio] then
fin:= medio -1
else ini:= medio +1;
medio:= (ini+ fin) div 2;
end;
if (ini<= fin) and (dato = v[medio]) then pos:= medio;
end;
var v: vector;
pri, ult: indice;
dl, pos, x: integer;
BEGIN
	cargarv(v, dl);
	writeln('leer un numero');
	read(x);
	busquedaDicotomica(v, pri, ult, x, pos);
	writeln('la posicion en la que se encontro fue', pos);
END.

