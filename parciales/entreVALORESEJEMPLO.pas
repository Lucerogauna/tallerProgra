{ejercicio inventado leer numeros y almacenar en un arbol binario 
* lee dos numeros e imprimi los valores que estan entre tales;
}


program ejInventado;
type

arbol= ^nodo;
nodo= record
dato: integer;
hi: arbol;
hd: arbol;
end;
procedure agregarA(var a: arbol; num: integer);
begin
if (a= nil) then begin
new(a);
a^.dato:= num;
a^.hi:=nil;
 a^.hd:= nil
 end
  else if (num > a^.dato) then 
     agregarA(a^.hd, num)
  else 
    agregarA(a^.hi, num)
end;
procedure cargar(var a: arbol);
var n: integer;
begin
writeln('ingrese un numero');
readln(n);
while (n <> 0) do begin
 agregarA(a, n);
writeln('ingrese un numero');
readln(n);
end;
end;
procedure imprimir(a: arbol);
begin
if (a <> nil) then begin
  writeln(a^.dato);
  imprimir(a^.hi);
  imprimir(a^.hd);
  end;
end;
procedure ImprimirEntreValores(a: arbol; n1: integer; n2: integer); //bieeeen 
begin
 if a <> nil then begin
  if (a^.dato> n1) and (a^.dato<n2) then
   writeln(a^.dato);
   if (a^.dato> n1) then
     ImprimirEntreValores(a^.hi, n1, n2);
    if( a^.dato< n2) then
     ImprimirEntreValores(a^.hd, n1, n2);
   
   end;
end;
var a:arbol;n1, n2: integer;
BEGIN
	a:= nil;
	cargar(a);
	imprimir(a);
	writeln ('leer valor de n1');
	readln(n1);
	writeln ('leer valor de n2');
	readln(n2);
	ImprimirEntreValores(a, n1, n2);
END.


