{
   - Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c). 
   bien creo 
   * 
}


program ej3p1;
type
rango= 1..8;
peli= record
cod: integer;
codgenero: rango;
puntajeprom: real;
end;
lista=^nodo;
nodo= record
dato:peli;
sig: lista;
end;
inciso = record
cod: integer;
pmax: real;
end;
nuevec= array [rango] of inciso;//tiene que informar el codigode peli con mayoor puntaje
vecLista = array [rango] of lista;
procedure agregarAtras(var l: lista; var ult: lista; a: peli);
var nue: lista;
begin
new(nue);
nue^.dato:=a;
    if (l = nil) then
      begin
        l:= nue;
        ult:= nue;
      end
      else begin
ult^.sig:=nue;
ult:= nue;
end;
end;
procedure leerPeli(var p: peli);
begin
writeln('codigo de peli');
readln(p.cod);
if (p.cod<> -1) then begin
writeln('codigo de genero');
readln(p.codgenero);
writeln('puntaje');
readln(p.puntajeprom);
end;
end;
procedure cargarvector(var v: vecLista);
var
pe:peli;
ult: lista;
begin
leerPeli(pe);
 while(pe.cod <> -1) do begin
 agregarAtras(v[pe.cod], ult, pe); //al vector en la pocicion x le guardo los datos
leerPeli(pe);
 end;
end;
procedure imprimir (v: vecLista; l: lista);
var i: integer;
begin
for i := 1 to 8 do begin
while( l<> nil) do begin
 writeln (v[i]^.dato.cod);
 l:=l^.sig;
end;
end;
end;
procedure calcularmax(n: real; var max: real; var cpmax: integer; cod: integer);
begin
if n>max then
max:=n;
end;
procedure nuevovector(var nv: nuevec; pos: integer;punt: real; codpelimax: integer);
begin
    nv[pos].cod:= codpelimax;
    nv[pos].pmax:= punt;
    end;

procedure incisoB(v: vecLista; num:integer; var nv:nuevec);
var 
i, cm:integer; max:real;
begin
for i:= 1 to 8 do begin
max:=0;
  while v[i]<>nil do begin
  calcularmax(v[i]^.dato.puntajeprom , max, cm,v[i]^.dato.cod );
  end;
  nuevovector(nv, i, max, cm );
end;
end;
procedure seleccion (var ve: nuevec);
var 
i, j, pos: integer;
info: inciso;
begin
for i:=1 to 7 do begin
pos:= i;
  for j:=i +1 to 8 do 
     if (ve[j].pmax) > (ve[pos].pmax) then
       pos:= j;
     info:= ve[pos];
       ve[pos]:=  ve[i] ;
        ve[i]:= info;
end;
end;
procedure mostrarVecOrdenado(v: nuevec);
begin
//como el vector ya esta ordenado nada mas accedo a las posiciones directamente
writeln(v[1].cod);
writeln(v[8].cod);
end;
var vl: vecLista;
l: lista;
BEGIN
l:=nil;
cargarvector(vl);
imprimir(vl, l);
	
END.

