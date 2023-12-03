{ej correo argentino
   
}


program ej;
type
envio= record
 codCliente: integer;
 codPostal: integer;
 dia: integer;
 pesoPaquete: real;
 end;
 datosL= record
 cc: integer;
 day: integer;
 pp: real;
 end;
 lista= ^nod;
 nod= record
 dat: datosL;
 sig:lista;
 end;
 infoArbol= record
 cp: integer;
 infoExtra: lista;
 end;
 arbol=^nodo;
 nodo= record
 dato: infoArbol;
 hi, hd: arbol;
 end;
 procedure leer(var e: envio);
 begin
 with e do begin
 
writeln('leer peso paquete'); readln(pesoPaquete);
if pesoPaquete <> 0 then begin
writeln('leer cod cliente'); readln(codCliente);
writeln('leer cod postal'); readln(codPostal);
writeln('leer dia'); dia:= random(30); writeln(dia);
 end;
 end;
 end;

procedure AgregarL(var l: lista; e: datosL);
var nue: lista;
begin
new(nue);
nue^.dat:= e;
nue^.sig:= l;
l:= nue;
end;
 procedure abb(var a: arbol; codp: integer; datosE: datosL);
 begin
 if a= nil then begin
 new (a);
 a^.dato.cp:= codp;
 a^.dato.infoExtra:= nil;
 agregarL( a^.dato.infoExtra, datosE)
 end
  else if a^.dato.cp= codp then
 agregarL( a^.dato.infoExtra, datosE)
 else if codp > a^.dato.cp then
   abb(a^.hd, codp, datosE)
   else 
   abb(a^.hi, codp, datosE)
 end;
 procedure cargar(var a: arbol);
 var e: envio; d: datosL; cod: integer;
 begin
 leer(e);
 while e.pesoPaquete <> 0 do begin
  cod:= e.codPostal;
  d.cc:= e.codCliente; 
  d.pp:= e.pesoPaquete;
   d.day:= e.dia;
  abb(a, cod, d);
  leer(e);
  end;
 end;
 procedure imprimirL2(l:lista);
begin
while (l<> nil) do begin
writeln('el codigo cliente   ', l^.dat.cc );
writeln('el dia  ', l^.dat.day );
writeln('peso del paquete', l^.dat.pp:2:0);
l:=l^.sig;
end;
end;
procedure imprimira(a: arbol);
begin
if a <> nil then begin
writeln('estos son los datos del codigo postal',a^.dato.cp,'..................');
   imprimirL2(a^.dato.infoExtra);
imprimira(a^.hi);
imprimira(a^.hd);
end;
end;
procedure incisoB(a: arbol; c: integer; var l: lista);
begin
 if a= nil then writeln('no se encontro el codigo')
  else if a^.dato.cp= c then 
     l:=  a^.dato.infoExtra
    else if a^.dato.cp> c then
     incisoB(a^.hd, c, l)
     else 
     incisoB(a^.hi, c, l)
end;
procedure incisoC(l:lista; var c1: integer; var c2: integer; var max: real; var min: real);
begin
 if l <> nil then begin 
   if l^.dat.pp> max then begin
   max:= l^.dat.pp;
   c1:= l^.dat.cc;
   end; 
   if l^.dat.pp < min then begin
   min:= l^.dat.pp;
   c2:= l^.dat.cc;
   end;
   incisoC(l^.sig, c1, c2, max, min);
   end;
end;
 var a: arbol;codx: integer; li: lista;
 cod1, cod2: integer; max, min: real;
BEGIN
randomize;
li:= nil;
	cargar(a);
	imprimira(a);	
	writeln('leer ccodigo'); readln(codx);
	incisoB(a, codx, li);
	imprimirL2(li);
	max:= 1; min:= 999;
	incisoC(li, cod1, cod2, max, min);
	writeln('el codigo del cliente con paquete maximo es ', cod1);
	writeln('el codigo del cliente con paquete minimo es ', cod2); // bieeen :)
END.

