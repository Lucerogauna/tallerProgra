{4.- Escribir un programa con:
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 0 y
menores a 100.
b. Un módulo recursivo que devuelva el máximo valor del vector.
c. Un módulo recursivo que devuelva la suma de los valores contenidos en el vector.
}
program e4p2;
const
df= 5;
type
vector= array [1..df]of integer;
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
function max(v: vector; i: integer):integer; // ver lp de los maximos y minimos no me funciona
begin
if i <>df then begin
i:=i+1;
 max(v,i);
 end;
if v[i]> max then begin
 max:=v[i];
 end;
 end;
{
 if v[i]> ma then begin
 ma := v[i];
 i:= i+1;
 max(v, ma, i);
end;
max:=ma;
* function suma (v:vector; i: integer): boolean;
* if v[i]<>df then begin
* suma:=suma+v[i];
* i:=i+1;
* suma(v, i); }

var 
i, maximo, minimo, pos:integer;
vec: vector;
BEGIN
	pos:=0;
	minimo:=999;
	cargarv(vec, pos);
	i:=1;
	writeln('el maximo encontado es:',max(vec, i));

END.

