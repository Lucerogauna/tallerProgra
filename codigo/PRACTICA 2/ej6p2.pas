{
6.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.
   
}
program ej6p2;
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

procedure descomponerRECURSIVO(n: integer);
var
dig: integer;
begin
  if (n > 0) then begin  // caso base 
  dig:= n mod 2;                                                                                                                                                                                                                                       
  n:= n div 2; 
  descomponerRECURSIVO(n); 
  write(dig);
  end;
end;
{
if num=0 then
  imprimirbinario(num)
   else begin
    dig:= num mod 2;
     writeln(dig);
     num:= num div 2;
end;
end}
procedure binario(l: lista);
begin
 while (l <> nil) do begin
 writeln('mando a descomponer el numero', l^.elem);
  descomponerRECURSIVO(l^.elem);
  l:=l^.sig;
  end;
end;
var l:lista;
BEGIN
	l:=nil;
	cargarl(l);
	binario(l);
	
END.

