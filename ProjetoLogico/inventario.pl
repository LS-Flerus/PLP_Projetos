:- ['itens.pl'].

% IVETARIO = [(Idex do item, quatidade)]

% remove item (idex do item, invetario, invetario alterado) 
removeItem(_,[],_).
removeItem(X,[(X,Y)|Tail], R) :- Z is Y - 1,
    (Z =:= 0 -> R = Tail; R = [(X, Z)| Tail]),!.
removeItem(X,[(C,Y)|Tail], [(C,Y)|Rabo]) :- removeItem(X,Tail,Rabo).

% add item (idex do item, invetario, invetario mudado, invetario alterado) 
addItem(Index,[], R) :- R = [(Index,1)],!.
addItem(X,[(X,Z)|Tail], [(X,Q)|Tail]) :- Q is Z + 1,!.
addItem(X,[(C,Y)|Tail], [(C,Y)|Rabo]) :- addItem(X,Tail,Rabo).

printInventario(Lista) :- writeln("INVENTARIO:"), pritIvetario(Lista, 1). 
pritIvetario([],_):-!.
pritIvetario([(Id,Quatidade)|ProximoItem], Indice) :- item(Id, Nome, _),
    IdiceProximo is Indice+1,
    write(Indice),
    write(".  "),
    write(Nome),
    write("  "),
    writeln(Quatidade),
    pritIvetario(ProximoItem, IdiceProximo).

printInventarioFerramenta(Lista) :- writeln("INVENTARIO:"), pritIvetarioFerramenta(Lista, 1). 
pritIvetarioFerramenta([],_):-!.
pritIvetarioFerramenta([(Id,_)|ProximoItem], Indice) :- item(Id, Nome, _),
    IdiceProximo is Indice+1,
    write(Indice),
    write(".  "),
    writeln(Nome),
    pritIvetarioFerramenta(ProximoItem, IdiceProximo).

printReceitas() :- writeln("RECEITAS:"), findall(X, receita(X, _, _, _), Lista), pritReceitas(Lista). 
pritReceitas([]):-!.
pritReceitas([Id|Proximo]) :- 
    receita(Id, A, B, R), item(A, NomeA, _), item(B, NomeB, _), item(R, NomeR, _),
    write(Id), write(".  "), write(NomeA), write(" + "), write(NomeB), write(" -> "), writeln(NomeR),
    pritReceitas(Proximo).