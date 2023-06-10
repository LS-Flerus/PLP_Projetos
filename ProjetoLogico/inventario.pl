:- ['itens.pl'].

% IVETARIO = [(Idex do item, quatidade)]

% remove item (idex do item, ivetario, invetario alterado) 
removeItem(_,[],_).
removeItem(X,[(X,Y)|Tail], R) :- Z is Y - 1,
    (Z =:= 0 -> R = Tail; R = [(X, Z)| Tail]),!.
removeItem(X,[(C,Y)|Tail], [(C,Y)|Rabo]) :- removeItem(X,Tail,Rabo).

% add item (idex do item, ivetario, ivetario que ao e mudado, baragudu que esta sedo alterado, invetario alterado) 
addItem(Index,[], R) :- R = [(Index,1)],!.
addItem(X,[(X,Z)|Tail], [(X,Q)|Tail]) :- Q is Z + 1,!.
addItem(X,[(C,Y)|Tail], [(C,Y)|Rabo]) :- addItem(X,Tail,Rabo).

printInventario(Lista, 1) :- pritIvetario(Lista, 1). 
pritIvetario([],_):-!.
pritIvetario([(Id,Quatidade)|ProximoItem], Indice) :- item(Id, Nome, _),
    IdicePritado is Indice-1,
    IdiceProximo is Indice+1,
    write(IdicePritado),
    write(".  "),
    write(Nome),
    write("  "),
    writeln(Quatidade),
    pritIvetario(ProximoItem, IdiceProximo).