{
   2. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
 h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos). 
   ver inciso e
}


program ej2p4;
type 
//  estructura 1
Rfecha= record
dia: integer;
mes: integer;
 end;
pres= record
isbn: integer;
nroSoci: integer;
fecha: Rfecha;
cdp: integer;
end; 
arbol= ^nodo;
nodo= record
dato: pres;
hi: arbol;
hd: arbol; 
end;
// fin estructura 1



//empieza la segunda
regDato= record
nro: integer;
 dia: integer;
 cant: integer;
end;
lista = ^nodo1;
nodo1= record
dato: regDato;
sig: lista;
end;
reg3= record
isbn: integer;
prestamo: lista;
end;
arbol2= ^nodo2;
nodo2= record
dato2: reg3;
hi: arbol2;
hd: arbol2; 
end;
//////estructura f
reg4 = record
isbn2: integer;
canP: integer;
end;
arbol3 = ^nod;
nod= record
d: reg4;
hi: arbol3;
hd: arbol3;
end;
procedure leerf(var f: Rfecha);
begin
with f do begin
 writeln('dia');readln(dia);
 writeln('fecha');readln(mes);
 end;
 end;
procedure leerp(var p: pres);
var fec: Rfecha;
begin
with p do begin
 writeln('isbn');readln(isbn);
  if (isbn<> -1) then begin
 writeln('nro de socio');readln(nroSoci);
 leerf(fec);
 writeln('cant de dias prestados');readln(cdp);
 end;
 end;
 end;
 procedure agregarA(var a: arbol; p: pres); //bien inciso a.i
 begin
  if (a= nil) then begin
  new(a);
  a^.dato:= p;
  a^.hi:= nil; 
  a^.hd:= nil;
  end
   else if (p.isbn< a^.dato.isbn) then
    agregarA(a^.hi, p)
    else 
      agregarA(a^.hd, p)
 end;
 procedure mandarAlista(pnro: integer; canti: integer; var li: lista);
 var nue: lista;
 begin
 new(nue);
 nue^.dato.nro:= pnro;
 nue^.dato.cant:= canti;
 nue^.sig:= li;
 li:= nue;
 end;
 procedure agregarA2(var a2: arbol2; p: pres);
 begin
  if a2 = nil then begin
  new(a2);
  a2^.dato2.isbn:= p.isbn;
  a2^.dato2.prestamo:= nil;// inicalizo la lista en nil
  mandarAlista(p.nroSoci, p.cdp, a2^.dato2.prestamo ); // mando a cargar la lista de ese isbn
  a2^.hi:= nil;
  a2^.hd:= nil;
 end
 else if (p.isbn <a2^.dato2.isbn) then 
 agregarA2(a2^.hi, p)
    else 
      agregarA2(a2^.hd, p)
  
 end;
 procedure cargarA(var a: arbol; var a2: arbol2);
 var p: pres; 
 begin
  a:= nil;
  a2:= nil;
  leerp(p);
  while p.isbn <> -1 do begin
  agregarA(a, p);
  agregarA2(a2, p);
  leerp(p);
 end;
 end;
 {b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.}
 function incisob(ar: arbol): integer;
 begin
 if ar^.hd<>nil then  // si es el ultimo
 incisob:= ar^.dato.isbn // se queda con los datos del ultimo
 else //sino
   incisob:= incisob(ar^.hd); //llama reculsivamente hasta llegar al ultimo
   
 end;
 {c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.}
 function incisoc(ar2: arbol2): integer;
 begin
 if ar2^.hi<>nil then  // si es el ultimo
 incisoc:= ar2^.dato2.isbn // se queda con los datos del ultimo
 else //sino
   incisoc:= incisoc(ar2^.hi); //llama reculsivamente hasta llegar al ultimo
 end;
 {d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio}
function incisod(ar: arbol; sociox: integer): integer;
begin
if (ar= nil) then incisod:= 0 //bien
    else if  (ar^.dato.nroSoci = sociox) then  //bien
     incisod:=  incisod(ar^.hi, sociox) + 1 + incisod(ar^.hd , sociox)
     else 
     incisod:=  incisod(ar^.hi, sociox) + 0 + incisod(ar^.hd , sociox)
end;
{e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
function cantL(l:lista; x: integer): integer;
begin
if l= nil then cantL:=0 
  else if l^.dato.nro = x then
  cantL:= cantL+1;
  cantL:= cantL(l, x);
end;
function incisoe(a2: arbol2; sociox: integer): integer; //algo mallll
begin
if (a2 <> nil) then begin //bien
     incisoe:=  incisoe(a2^.hi, sociox) + cantL(a2^.dato2.prestamo, sociox) + incisoe(a2^.hd , sociox);
     incisoe:=  incisoe(a2^.hi, sociox) + cantL(a2^.dato2.prestamo, sociox) + incisoe(a2^.hd , sociox);
     end
   else
    incisoe:= 0
end;
{f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó}
procedure mandara3(var a3: arbol3; nro: integer; cant:integer);
var a: arbol3;
begin
if a3= nil then begin
new(a); 
a^.d.isbn2:= nro; 
a^.d.canP:= 1;
a^.hi:= nil;
a^.hd:= nil;
end
else if a^.d.isbn2> nro then 
 mandara3(a3^.hi, nro, cant)
 else if a^.d.isbn2 < nro then
 mandara3(a3^.hd, nro, cant)
 else 
   a3^.d.canP:=a3^.d.canP+1
end;
procedure incisof(a: arbol; var a3: arbol3);
var c: integer;
begin 
c:=0;
if a<>nil then begin
  mandara3(a3, a^.dato.isbn, c);
  incisof(a^.hi, a3);
  incisof(a^.hd, a3);
end;
end;
 var ar: arbol; ar2: arbol2;
 x, cantd, cante: integer;
BEGIN
	cargarA(ar, ar2);
	writeln('leer un numero '); readln(x);
	cantd:=incisod(ar, x);
	writeln('inciso d, la cantidad prestada al mismo socio fue ', cantd); 
	cante:=incisoe(ar2,x);
	writeln('inciso e, la cantidad prestada al mismo socio fue ', cante); 
END.

