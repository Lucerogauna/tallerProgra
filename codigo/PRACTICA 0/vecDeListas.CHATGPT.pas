program VectorDeListassss;

type
  Nodo = record
    dato: Integer;
    sig: ^Nodo;
  end;
  Lista = ^Nodo;
  VectorDeListas = array[1..10] of Lista;

var
  vector: VectorDeListas;

// Procedimiento para agregar un elemento a una lista
procedure AgregarElemento(var lista: Lista; elemento: Integer);
var
  nuevoNodo, actual: Lista;
begin
  new(nuevoNodo);          // Crea un nuevo nodo
  nuevoNodo^.dato := elemento;  // Asigna el dato al nodo
  nuevoNodo^.sig := nil;        // Establece el siguiente nodo como nulo

  if lista = nil then        // Si la lista está vacía
    lista := nuevoNodo      // El primer nodo de la lista es el nuevo nodo
  else
  begin
    actual := lista;
    while actual^.sig <> nil do   // Encuentra el último nodo en la lista
      actual := actual^.sig;
    actual^.sig := nuevoNodo;    // Conecta el nuevo nodo al último nodo
  end;
end;

// Procedimiento para imprimir los elementos de una lista
procedure ImprimirLista(lista: Lista);
var
  actual: Lista;
begin
  actual := lista;
  while actual <> nil do      // Recorre la lista
  begin
    writeln(actual^.dato);   // Imprime el dato del nodo actual
    actual := actual^.sig;   // Avanza al siguiente nodo
  end;
end;

var
  i: Integer;
begin
  // Inicializar el vector de listas
  for i := 1 to 10 do
    vector[i] := nil;    // Inicializa cada elemento del vector como nulo

  // Agregar elementos a las listas
  AgregarElemento(vector[1], 5); //agregar el número 5 a la lista que está en la primera posición del array vector
  AgregarElemento(vector[1], 10);

  AgregarElemento(vector[5], 20);

  // Imprimir las listas
  writeln('Lista en la posición 1:');
  ImprimirLista(vector[1]);

  writeln('Lista en la posición 5:');
  ImprimirLista(vector[5]);
end.
