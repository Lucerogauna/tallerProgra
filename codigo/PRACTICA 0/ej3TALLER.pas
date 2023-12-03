{Implementar un programa que procese las ventas de un supermercado. El supermercado 
dispone de una tabla con los precios y stocks de los 1000 productos que tiene a la venta.
a) Implementar un módulo que retorne, en una estructura de datos adecuada, los tickets de las ventas. 
De cada venta se lee código de venta y los productos vendidos. Las ventas finalizan con el código de 
venta -1. De cada producto se lee código y cantidad de unidades solicitadas. Para cada venta, la lectura 
de los productos a vender finaliza con cantidad de unidades vendidas igual a 0. El ticket debe contener:
- Código de venta
- Detalle (código de producto, cantidad y precio unitario) de los productos que se pudieron vender. En 
caso de no haber stock suficiente, se venderá la máxima cantidad posible.
- Monto total de la venta.
c) Implementar un módulo que reciba la estructura generada en el inciso a) y un código de 
producto y retorne la cantidad de unidades vendidas de ese código de producto}
program ej3TPinicial; //algo esta mal
type
info= record
precio: real;
stock: integer;
end;
producto= record
codProducto: integer;
 cus: integer;{cant unidades solicitadas}
end;
 listaPRO = ^nodop;
  nodop = record
    datos: producto; 
    sigg: listaPRO;
  end;
venta= record
codVenta: integer;
pv: listaPro; //apunta a la lista   REGISTRO CON UN CAMPO LISTA
end;
 lista = ^nodo;
  nodo = record
    dato: venta;
    sig: lista;
    end;
//se dispone tabla de 1000 productos 
vect = array[1..100]of info;
//------------------------------------------------------
{procedure cargar vec();} // SE DISPONE
procedure cargarVector(var v:vect);
  var
    x:integer;
  begin
    for x:=1 to 100 do
    begin
      v[x].stock:=random(100);
      v[x].precio:=random(200) + 10;
    end;
  end;
  
  

//------------------------------
procedure leerpro(var p: producto); //BIEN 
begin
writeln('cant uidades solicitadas');
readln(p.cus);
if p.cus<> 0 then
writeln('codigo de produc');
readln(p.codProducto);
end;
//------------------------------------------------------
procedure mandarLP(var l2:listaPRO; pr: producto);
  var
    nue: listaPRO;
  begin
    new(nue);
    nue^.datos:= pr;
    nue^.sigg:= l2;
    l2:= nue;
  end;
procedure cargarlpro(var lp: listaPro);
var p: producto;
begin
leerpro(p);
while p.cus<> 0 do begin
mandarLP(lp, p);
leerpro(p);
end;
end;
//------------------------------------------------------
//cargar Lista inciso A
procedure agregarAd (var l: lista; codP: integer);
var nue: lista;
begin
new (nue);
nue^.dato.codVenta:= codp;
nue^.dato.pv:= nil;
cargarlpro(nue^.dato.pv);
nue^.sig:= l;
l:= nue;
end;
//------------------------------
procedure leerVenta(var v: venta);
var p: producto;
begin 
writeln('codigo de venta');
readln(v.codVenta);
if (v.codVenta  <> -1) then 
writeln('ingresa los productos vendidos');
leerPro(p);
writeln('codigo de venta');
readln(v.codVenta);
end;
//----------------------------------------------------------
procedure cargarVentas (var l: lista);
var
 v: venta;
p: producto;
begin

leerVenta(v);
while (v.codVenta<> -1) do begin
  leerpro(p);
  while (p.cus <> 0) do begin
  agregarAd(l, v.codVenta);
   leerpro(p);
   end;
   leerVenta(v);
end;

   writeln('se ingreso todos los prductos de las ventas en general');
end;
//----------------------------------------------------------
procedure tickets (l: lista; v: vect);
var 
act: lista;
begin

end;
//----------------------------------------------------------
//----------------------------------------------------------
var 
L: lista;
v: vect;
begin
randomize;
L:=NIL;
cargarVector(v);
cargarVentas(L);
tickets(L, v);
end.
