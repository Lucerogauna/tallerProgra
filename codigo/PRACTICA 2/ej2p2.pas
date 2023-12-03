{2- Realizar un programa que lea números hasta leer el valor 0 e imprima, para cada número
leído, sus dígitos en el orden en que aparecen en el número. Debe implementarse un módulo
recursivo que reciba el número e imprima lo pedido. Ejemplo si se lee el valor 256, se debe
imprimir 2 5 6 

   
}
program e2p2;
type
lista= ^nodo;
nodo= record
num:integer;
sig: lista;
end;
procedure agregarAd(var l: lista; n: integer);
var nue: lista;
begin
 new(nue);
 nue^.num:= n;
 nue^.sig:= l;
 l:=nue;
end;
procedure procesar(var l: lista);
var n: integer;
begin
 writeln('leer un numero');
 readln(n);
 while (n<>0) do 
  begin
   agregarAd(l, n);
   writeln('leer un numero');
   readln(n);
   end;
end;
procedure descomponerRECURSIVO(  n: integer);
var dig: integer;
    begin
  if (n > 0) then begin  // caso base 
  dig:= n mod 10; write( 'el digito 	ue queda es', dig);
  n:= n div 10; write( 'el numero  	ue queda es', n);
  descomponerRECURSIVO(n); 
  writeln('el digito ess ', dig);
  end;
end;
procedure inciso(l: lista);
begin
while (l<>nil) do begin
write('mando a descomponeer el numero', l^.num);
descomponerRECURSIVO(l^.num);
l:=l^.sig;
end;
end;
var
  l: lista;
BEGIN
	l:=nil;
	procesar(l);
	inciso(l);
END.

