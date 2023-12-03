
program eje03;
const
  dimF = 10;

type
  rubros = 1..10;

  REG_producto = record
    cod,stock: integer;
    precio: real;
  end;

  Arbol = ^Nodo;
  Nodo = record
    dato: REG_producto;
    HI,HD: Arbol;
  end;

  vector = array [1..dimF] of Arbol;

  REG_vectorC = record
    cod,stock: integer;
  end;

  vectorC = array[1..dimF] of REG_vectorC;
  vectorD = array[1..dimF] of integer;

// ============ INCISO A
procedure incisoA (var v: vector);

  procedure cargarA (var a: Arbol; r: REG_producto);
    begin
      if (a = nil) then
        begin
          new(a);
          a^.dato:= r;
          a^.HI:= nil;
          a^.HD:= nil;
        end
      else
        if (a^.dato.cod > r.cod) then
          cargarA(a^.HI,r)
        else
          if (a^.dato.cod < r.cod) then
            cargarA(a^.HD,r);
    end;

  procedure leer (var r: REG_producto; var rubro: rubros);
    begin
      r.cod:= random(100) - 1;
      if (r.cod <> -1) then
        begin
          r.stock:= random(50);
          r.precio:= random(30) + 1;
          rubro:= random(10) + 1;
        end;
    end;

  var
    r: REG_producto;
    rubro: rubros;
  begin
    leer(r,rubro);
    while (r.cod <> - 1) do
      begin
        cargarA(v[rubro],r);
        leer(r,rubro);
      end;
  end;
// ============ INCISO A

// ============ INCISO B
procedure incisoB (v: vector);

  function buscar (a: Arbol; cod: integer): boolean;
    begin
      if (a <> nil) then
        begin
          if (a^.dato.cod > cod) then
            buscar:= buscar(a^.HI,cod)
          else
            if (a^.dato.cod < cod) then
              buscar:= buscar(a^.HD,cod)
            else
              if (a^.dato.cod = cod) then
                buscar:= true
              else
                buscar:= false;
        end
      else
        buscar:= false;
    end;

  var
    rubro: rubros;
    cod: integer;
  begin
    write('Rubro: '); readln(rubro);
    write('Codigo: '); readln(cod);
    if (buscar(v[rubro],cod)) then
      writeln('Producto encontrado')
    else
      writeln('Producto no listado');
  end;
// ============ INCISO B

// ============ INCISO C
procedure mayorCod (a: Arbol; var cod, stock: integer);
  begin
    if (a <> nil) then
      begin
        if (a^.dato.cod > cod) then
          begin
            cod:= a^.dato.cod;
            stock:= a^.dato.stock;
          end;
        mayorCod(a^.HI,cod,stock);
        mayorCod(a^.HD,cod,stock);
      end;
  end;

procedure incisoC (v: vector; var vc: vectorC);
  var
    x: integer;
    r: REG_vectorC;
  begin
    for x:=1 to dimF do
      begin
        r.cod:= 0;
        r.stock:= 0;
        mayorCod(v[x],r.cod,r.stock);
        vc[x]:= r;
      end;
  end;
// ============ INCISO C

// ============ INCISO D
procedure recorrer (a: Arbol; inf,sup: integer; var cant: integer);
  begin
    if (a <> nil) then
      if (a^.dato.cod > inf) then
        if (a^.dato.cod < sup) then
          begin
            cant:= cant + 1;
            recorrer(a^.HI,inf,sup,cant);
            recorrer(a^.HD,inf,sup,cant);
          end
        else
          recorrer(a^.HI,inf,sup,cant)
      else
        recorrer(a^.HD,inf,sup,cant);
  end;

procedure incisoD (v: vector; var vd: vectorD);
  var
    x,inf,sup,cant: integer;
  begin
    write('Cod inf: '); readln(inf);
    write('Cod sup: '); readln(sup);
    for x:= 1 to dimF do
      begin
        cant:= 0;
        recorrer(v[x],inf,sup,cant);
        vd[x]:= cant;
      end;
  end;
// ============ INCISO D


//Programa principal
var
  v: vector;
  vc: vectorC;
  vd: vectorD;
  x: integer;
begin
  Randomize;

  //Inciso A
  for x:=1 to dimF do
    v[x]:= nil;
  incisoA(v);

  //Inciso B
  incisoB(v);
  writeln();

  //Inciso C
  incisoC(v,vc);
  writeln();

  //Inciso D
  incisoD(v,vd);
end.
