{
alg0 esta mal en la suma total
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
procedure calcularMax(dato: integer; var max: integer);
begin
 if dato> max then
 max:= dato;
 end;
function max(v: vector;diml: integer):integer; 
var maxim: integer;
begin
if diml= 0 then max:= -1 
else begin maxim:= max(v, diml-1);
 calcularMax(v[diml], maxim);
 max:= maxim;
 end;
 end;
 
procedure calcularminim(num: integer; var min: integer);
begin
 if num< min then
 min:= num;
 end;
function Min(v: vector; dl: integer): integer;
var minim: integer;
begin
if dl = df then min:= 99
 else begin minim:= min(v, dl+1);
  calcularminim(v[dl], minim);
  Min:=minim;
end;
end;
function suma(v: vector; dl: integer): integer;
var tot: integer;
begin
writeln('d l es ', dl);
writeln(df);
if (dl = df) then tot:=0
else    suma:= suma(v,dl+1); //// alo esta mal
    tot:= tot + v[dl];
    suma:=tot;
end;

var
 i, pos:integer;
vec: vector;
BEGIN
	pos:=0;
	cargarv(vec, pos);
	i:=df;
	writeln('el maximo encontado es:',max(vec,  i));
    i:=0;
    writeln('el min encontado es:',Min(vec,  i));
    writeln('queda en ',i );
    i:=0;
    writeln(' la suma que me devolvio es :', suma(vec,  i));
END.

