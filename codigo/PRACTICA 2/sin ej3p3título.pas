{
 3.- Escribir un programa que:
a. Implemente un módulo recursivo que genere una lista de números enteros “random”
mayores a 0 y menores a 100. Finalizar con el número 0.
b. Implemente un módulo recursivo que devuelva el mínimo valor de la lista.
c. Implemente un módulo recursivo que devuelva el máximo valor de la lista.
d. Implemente un módulo recursivo que devuelva verdadero si un valor determinado se
encuentra en la lista o falso en caso contrario.
   DONE 
   * CONSULTAR
}
program ej3p2;
type 
lista= ^nodo;
nodo= record
elem: integer;
sig: lista;
end;
procedure leern(var n: integer);
begin
writeln('ingresa un numero ');
 readln(n);
 {n:= random(99);}
 writeln('se leyo el numero ',n);
end;
procedure agregarAd(var l: lista; n: integer);
var 
nue: lista;
begin
new(nue);
nue^.elem:=n;
nue^.sig:=l;
l:=nue;
end;
procedure cargarl(var li: lista);
var 
num: integer;
begin
leern(num);
if (num<>0) then begin
agregarAd(li,num);
cargarl(li);
end;
end;
procedure imprimir(original:lista);
var l:lista;
begin
l:= original;
while l<>nil do begin
writeln('el numero leido es', l^.elem);
l:=l^.sig;
end;
end;
procedure buscomin(l:lista; var min:integer);
begin
if (l<>nil) then begin //busco el ultimo
  buscomin(l^.sig, min);//avanza
  if l^.elem < min then  //ejecuto lo que quiero hacer
  min:= l^.elem
  end;
  end;
  procedure buscomax(l:lista; var max:integer);
begin
if (l<>nil) then begin //busco el ultimo
  buscomax(l^.sig, max);//avanza
  if l^.elem > max then  //ejecuto lo que quiero hacer
  max:= l^.elem
  end 
  else max:=-1;
  end;

function esta(l:lista; n:integer): boolean; //bien
begin 
if (l = nil) then
    esta:= false
 else if l^.elem = n then 
   esta:= true
 else
   esta:= esta(l^.sig,n);
end;
var l: lista;
min, max :integer;
BEGIN
min:=999;
 max:= -1; // es correcto mandar este parametro e inicializarlo por fuera del procedumiento
randomize;
l:=nil;	
cargarl(l);
imprimir(l); //para chequear si carga bien
buscomin(l,min);
writeln('el minimo encontrado es', min);
buscomax(l,max);
writeln('el maximo encontrado es', max);
writeln('es', esta(l, 9), 'que el numero 9 esta en la lista');
END.
