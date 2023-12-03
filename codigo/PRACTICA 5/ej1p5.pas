{
   
   1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total de las expensas.
}
program ej1p5repaso;
const
df= 3;
type
ofi= record
cod: integer;
dni: integer;
valorExp: real;
 end;
vec= array [1..df] of ofi;

procedure leerF(var f: ofi);
begin
with f do begin
 writeln('codigo de identificacion de la oficina');readln(cod);
 writeln('dni del propietario');readln(dni);
 writeln('valor de la expensa');readln(valorExp);
 end;
 end;
 procedure cargarV(var v: vec;var dl: integer);
 var ofic: ofi;
 begin
 dl:= 0;
 leerF(ofic);
 while (ofic.dni<> -1) and (dl < df) do begin
   dl:= dl+1;
   v[dl]:= ofic;
 leerF(ofic);
 end;
 end;
 procedure imprimir( v: vec; dim: integer);
 var i: integer;
 begin
 for i:= 1 to dim do
 writeln(v[i].cod);
 end;
 procedure ordenarRec(var v: vec; dim: integer);
 var 
 i, j, pos: integer;
 info: ofi;
 begin
  for i:= 1 to dim-1 do begin
  pos:= i;
   for j:= i+1 to dim do begin
   if (v[j].cod < v[pos].cod )then 
     pos:= j;
   info:= v[pos];
   v[pos]:=v[i];
   v[i]:= info;
   end;
   end;
 end;
 Procedure busquedaDicotomica (v: vec;  dato:integer; var pos: integer);
var ini, fin, medio: integer;
begin 
pos:= -1;;
ini:=1; fin:=df; medio:= (ini+fin) div 2;
while (ini <= fin) and (dato <> v[medio].cod) do begin
if dato< v[medio].cod then
fin:= medio -1
else ini:= medio +1;
medio:= (ini+ fin) div 2;
end;
if (ini<= fin) and (dato = v[medio].cod) then begin 
  pos:= medio;
  writeln(v[pos].dni)
  end
  else begin
  pos:= 0;
  writeln('no se encontro la oficina');
  end;
end;
function incisoD(v: vec; diml: integer): real;
begin
if diml=0 then incisoD:=0
 else incisod:= incisoD(v,diml-1)+ v[diml].valorExp;
end;
 var dimL, num, pos: integer; 
total: real;
 v: vec;
BEGIN
	cargarV(v,dimL);
	imprimir(v, dimL);// extra para ver si guarda bien
	ordenarRec(v, dimL); // inciso b retorna el vec ordenado por algun metodo, seleccion o insercion
  writeln('leer codigo de oficina a buscar');readln(num);
	busquedaDicotomica(v, num, pos);
	writeln(pos);
	writeln('diml quedo en',dimL);
	total:= incisoD(v, dimL); writeln(total:2:0);
END.

