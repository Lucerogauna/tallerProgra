{
   3. Un supermercado requiere el procesamiento de sus productos. De cada producto se
conoce código, rubro (1..10), stock y precio unitario. Se pide:
 a) Generar una estructura adecuada que permita agrupar los productos por rubro. A su
vez, para cada rubro, se requiere que la búsqueda de un producto por código sea lo
más eficiente posible. La lectura finaliza con el código de producto igual a -1.
b) Implementar un módulo que reciba la estructura generada en a), un rubro y un código
de producto y retorne si dicho código existe o no para ese rubro.
c) Implementar un módulo que reciba la estructura generada en a), y retorne, para cada
rubro, el código y stock del producto con mayor código.
d) Implementar un módulo que reciba la estructura generada en a), dos códigos y
retorne, para cada rubro, la cantidad de productos con códigos entre los dos valores
ingresados.
   
}
program ej3p5;
type
rango = 1..10;
infoP= record
codig: integer;
stock: integer;
preciou: real;
end;
arbol=^nodo;
nodo= record
dato: infoP;
hi, hd: arbol;
end;
regC= record
cod1: integer;
stoc1: integer;
end;
vRubros= array [rango] of arbol;
vIncisoC= array[rango] of regC;
procedure leerP(var a: infoP; var r: rango);
begin
writeln('leer codigo');
read(a.codig);
if a.codig<> -1 then begin
writeln('leer stock');
read(a.stock);
writeln('leer precio');
read(a.preciou);
writeln('leer rubro');
read(r);
end;
end;
procedure inicializarA(var v: vRubros);
var i: integer;
begin
for i:= 1 to 10 do 
v[i]:= nil;

end;
procedure agregarA(var a: arbol; p: infoP);
begin
 if a= nil then begin
 new(a);
 a^.dato:= p;
 a^.hi:= nil;
 a^.hd:= nil;
 end
 else if (a^.dato.codig < p.codig) then 
  agregarA(a^.hi, p)
  else 
    agregarA(a^.hd, p);
 end;
procedure cargar( var v: vRubros);
var p: infoP; rub: rango;
begin
inicializarA(v);
leerP(p, rub);
while p.codig <> -1 do begin
agregarA(v[rub],p);
leerP(p, rub);
end;
end;
function buscarEnArbol(a: arbol; codx: integer): boolean; 
begin
 if a = nil then buscarEnArbol:= false
  else if a^.dato.codig = codx then 
  buscarEnArbol:= true
     else if codx > a^.dato.codig then
       buscarEnArbol:= buscarEnArbol ( a^.hd, codx)
       else 
     buscarEnArbol:= buscarEnArbol ( a^.hd, codx)
end; 

function buscar (v: vRubros; rubx: rango; codx: integer): boolean;
begin
if buscarEnArbol(v[rubx], codx) then buscar:= true  
else buscar:= false;
end;

Procedure imprimirArbol(A: arbol);
Begin
  If (A<>Nil) Then
    Begin
      imprimirArbol(A^.hi);
      writeln('Codigo: ',A^.dato.codig);
      writeln('Stock: ',A^.dato.stock);
      writeln('Precio: ',A^.dato.preciou:4:2);
      writeln('  -----------------  ');
      imprimirArbol(A^.hd);
    End;
End;
Procedure imprimirVector(V: vRubros);
Var 
  i: rango;
Begin
  For i:= 1 To 10 Do begin
writeln('info en el rubro', i);
    imprimirArbol(V[i]);
    end;
End;
procedure inicializarVC(var vc: vIncisoC);
var i: integer;
begin
for i:= 1 to 10 do begin
vc[i].cod1:= 0;
vc[i].stoc1:= 0;
end;
end;
procedure codMax(a: arbol; var cm: integer; var sm: integer);
begin
 if a^.hd <> nil then 
  codMax(a^.hd, cm, sm)
 else cm:= a^.dato.codig;
  sm:= a^.dato.stock;
 end;
procedure incisoC (v: vRubros; var nv: vIncisoC );
var i : integer; s, c: integer;
begin
c:= 0; s:=0;
for i:= 1 to 10 do begin
 codMax(v[i], c, s);
 nv[i].cod1:= c;
 nv[i].stoc1:= s;
 end;
 end;
 Procedure imprimirVectorCant(VC:vIncisoC);
Var 
  i: rango;
Begin
  For i:= 1 To 10 Do
    Begin
      If (VC[i].stoc1<>0) Then
        Begin
          writeln('Rubro: ',i);
          writeln('Codigo: ',VC[i].cod1);
          writeln('Stock: ',VC[i].stoc1);
          writeln('************');
        End;
    End;
End;
var v: vRubros;vc: vIncisoC; cod, rub: integer;
BEGIN
inicializarVC(vc);
	cargar(v);{ ESTO ESTA BIEN
	imprimirVector(v);
	writeln('leer codigo a buscar'); readln(cod);
	writeln('leer el rubro en donde buscar el codigo'); readln(rub);
	writeln('es el codigo ', buscar(v, rub, cod), 'que el codigo', cod, 'esta en el rubro ', rub);}
	incisoC(v, vc); // algo mal aca
	imprimirVectorCant(vc);
END.

