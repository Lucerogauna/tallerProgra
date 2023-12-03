{
g. Implemente un módulo recursivo que reciba la lista generada en e) e imprima los valores de
la lista en orden inverso al que están almacenad
}

program ej1p2;
const 
  df= 10;
type
  vector= array[1..df] of char;
  lista= ^nodo;
  nodo= record
    dato: char;
    sig: lista;
  end;
procedure cargarl(var l: lista; c: char);
var 
  nue: lista;
begin
  new(nue);
  nue^.dato:= c;
  nue^.sig:= l;
  l:=nue;
end;
procedure incisoe( var l: lista);
var 
  c: char;
begin
  writeln('Ingrese el caracter');
  readln(c);
  if (c<>'.') then begin
    cargarl(l, c);
    incisoe(l);
  end;
  if (c= '.') then
  cargarl(l,c);
end;
procedure incisog(l: lista);
begin
  if (l<>nil) then begin //busco el ultimo
    incisog(l^.sig);// // avanza 
    writeln(l^.dato); // guarda el dato 
  end;
end;
procedure imprimirL(l: lista);
begin
  if(l<>nil)then begin
    writeln(l^.dato);
    l:=l^.sig;
    imprimirL(l);
  end;
end;
procedure cargarv(var v: vector;var dl: integer);
begin
  dl:=dl+1;
  writeln('Ingrese el caracter');
  readln(v[dl]);
  if(dl<>10)and(v[dl]<>'.')then
    cargarv(v,dl);  
end;
procedure incisod(var car: integer);
var
  c: char;
begin
 writeln('Ingrese el caracter');
 readln(c);
 car:= car+1;
 if (c<> '.') then
  incisod(car);
end;
procedure imprimir(v:vector;dl:integer);
var
  i:integer;
begin
  	for i:=1 to dl do 
	  writeln(v[i]);
end;
procedure imprimirec(v: vector; dl: integer; var i: integer);
begin
  i:=i+1;
  if (i<=dl) then begin
    writeln(v[i]);
    imprimirec(v,dl,i);
  end;
end;
var 
  dl, i: integer;
  ve : vector;
  carac: integer;
  l:lista;
BEGIN
  l:=nil;
  dl:= 0;
  i:= 0;
  carac:=0;
  cargarv(ve,dl);
  incisod(carac);
  writeln('se leyeron ', carac, 'caracteres');
  imprimir(ve, dl); //imprimir b
  imprimirec(ve, dl, i);
  incisoe(l);
  imprimirL(l);	
  incisog(l);
end.

