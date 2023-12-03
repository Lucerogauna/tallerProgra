{
   2. Una agencia dedicada a la venta de autos ha organizado su stock y, dispone en papel de la
información de los autos en venta. Implementar un programa que:
a) Lea la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.
* 
* 
* CREO QUE ESTA BIEN CHEQUEAR chusmear inciso F
}
program ej2p5;
type 
infoa= record
patent: integer;
af: integer;
marca: string;
modelo: string;
end;
arbol=^nodo;
nodo= record
dato: infoa;
hi,hd: arbol;
end;
//////////////inciso ii
infoa2= record
p: integer;
fabric: integer;
model: string;
end;
lista= ^nodo3;
nodo3= record
dat: infoa2;
sig: lista;
end;
info3= record
marca: string;
datosExtra: lista;
end;
arbol2=^nodo2;
nodo2= record
dato: info3;
hi,hd: arbol2;
end;
//////////////
procedure leerF(var f: infoa ); // tengo que aca leer info3, marca y pasarlo como parametro)??
begin
with f do begin
 writeln('patente');readln(patent);
 if patent<> -1 then begin
 writeln('anio de fabricacion');readln(af);
 writeln('marca');readln(marca);
 writeln('modelo');readln(modelo);
 writeln('-------------------------------------------');
 end;
 end;
 end;
 procedure agregara(var a: arbol; aut: infoa);
 begin 
 if a= nil then begin
 new(a);
 a^.dato:= aut;
 a^.hi:= nil;
 a^.hd:= nil;
 end
 else if a^.dato.patent < aut.patent then begin
  agregara(a^.hi, aut)
  end
  else 
    agregara(a^.hd, aut);
end;
procedure agregaraLista(var l: lista; pat: integer; anio: integer; mode: string);
var nue: lista;
begin
new(nue);
nue^.dat.p:= pat;
nue^.dat.fabric:= anio;
nue^.dat.model:= mode;
nue^.sig:= l;
l:= nue;
end;
 procedure agregara2(var a: arbol2; aut: infoa); //bieeeeeeeeeeeeeeeeeennnn :D
 begin
 if a = nil then begin
 new(a);
 a^.dato.marca:= aut.marca;
 a^.dato.datosExtra:= nil;
 agregaraLista( a^.dato.datosExtra,aut.patent, aut.af, aut.modelo); 
 a^.hi:= nil;
 a^.hd:= nil;
 end
 else if (a^.dato.marca = aut.marca)then
  agregaraLista( a^.dato.datosExtra,aut.patent, aut.af, aut.modelo)
 else if (a^.dato.marca < aut.marca) then 
  agregara2(a^.hi, aut)
  else  
    agregara2(a^.hd, aut);
end;
 procedure cargarA(var a: arbol; var a2: arbol2);
 var autos: infoa;
 begin
  leerF (autos);
  while autos.patent<> -1  do begin 
  agregara(a, autos);
  agregara2( a2, autos);
  leerF (autos);
  end;
  end;
  function incisob(a: arbol; m: string): integer;
begin
if a = nil then incisob:= 0 
else if a^.dato.marca= m then 
 incisob:= 1+ incisob (a^.hi, m)+ incisob (a^.hd, m)
 else incisob:= incisob (a^.hi, m)+ incisob (a^.hd, m)
end;

function incisoe(a: arbol; patente: integer): string;
begin
if a = nil then incisoe:= ''
else if a^.dato.patent = patente then 
  incisoe:= a^.dato.marca 
  else begin
  incisoe:= incisoe(a^.hi, patente);
  incisoe:= incisoe(a^.hd, patente);
  end;
end;
{Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.}
//____________________________________________________________________________
function calcularAutos(l: lista): integer; //chequear algo hay mal
begin
 if l = nil then calcularAutos:=0
 else 
  calcularAutos:= 1+ calcularAutos(l^.sig)
end;
function incisob2(a: arbol2; marcx:string): integer;
begin
if a<>nil then
  if (a^.dato.marca = marcx) then
    calcularAutos(a^.dato.datosExtra)
    else 
    incisob2:=incisob2(a^.hi, marcx)+incisob2(a^.hd, marcx)
 
end;
//____________________________________________________________________________
procedure imprimirL(l:lista);
begin
while l<> nil do begin
writeln('la patente leida fue ', l^.dat.p );
writeln('modelo del auto', l^.dat.model );
l:=l^.sig;
end;
end;
//____________________________________________________________________________
procedure imprimira2(a: arbol2);
begin
if a <> nil then begin
writeln('estos son los datos de la marca',a^.dato.marca,'..................');
imprimirL(a^.dato.datosExtra);
imprimira2(a^.hi);
imprimira2(a^.hd);
end;
end;
//____________________________________________________________________________
{f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}
{procedure buscarPatenteEnLista(l: lista; pa: integer;var modeloE: string; var ok: boolean);
begin
if l= nil then modeloE:=''
else if (l^.dat.p = pa) then
ok:= true
  else begin 
  ok:= false;
  buscarPatenteEnLista(l^.sig,pa,modeloE, ok)  
  end
end;
function incisoF(a2: arbol2; patenx: integer): string;
var mo:string; 
ok: boolean;
begin
if a2<> nil  then begin
  buscarPatenteEnLista(a2^.dato.datosExtra, patenx, mo, ok);
  if ok= false then
  incisoF:= incisoF(a2^.hi, patenx)+incisoF(a2^.hd, patenx);
end;
write(mo);
end;}
var
a: arbol;  a2:arbol2;cante,marca: string; cant,cant2, p, pat: integer;
BEGIN
	cargarA(a, a2);
	writeln('leer marca');
	readln(marca);
	cant:=incisob(a, marca);
	cant2:=incisob2(a2, marca);
	writeln('la caridad de autos de esa marca en el arbol2 es de',cant2);
	writeln('la cantidad de autos de esa marca en el arbol 1 es de', cant); //inciso B
	writeln('leer patente a buscar');
	readln(p);
	cante:=incisoe(a, p);
	writeln(cante); //inciso e 
	imprimira2(a2); //extra para chequear si estoiy cargarndo bien
	{writeln('leer patente a buscar');
	readln(pat);
	writeln('el numero de la patente pertenece al auto modelo', incisoF(a2, pat));}
END.

