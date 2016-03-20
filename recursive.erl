-module(recursive).
-export([fac/1,len/1, fac_tail/1, duplicate/2, tail_duplicate/2, reverse/1,
tail_reverse/1, sublist/2, tail_sublist/2, lenient_zip/2, zip/2]).

%%Returns factorial of N.
fac(0)->1;
fac(N) when N > 0 -> N*fac(N-1).

%% Get length of list.
len([])->0;
len([_|T])-> 1+len(T).


%% Returns factorial using tail recursion.
fac_tail(N) -> fac_tail(N,1).
fac_tail(0, Acc) -> Acc;
fac_tail(N,Acc)->fac_tail(N-1,Acc*N).


%%Returns list with N copies of objects.
duplicate(0,_)->[];
duplicate(N,Term)->[Term|duplicate(N-1,Term)].

%%Returns list with N copies of objects using tail recursion.
tail_duplicate(N,Term)->tail_duplicate(N,Term,[]).
tail_duplicate(0,_,Arr)->Arr;
tail_duplicate(N,Term,Arr) when N > 0->tail_duplicate(N-1,Term,[Term|Arr]).

%%Reverse a list.
reverse([])->[];
reverse([H|T])->reverse(T)++H.

%%Reverse a list using tail recursion.
tail_reverse(L)->tail_reverse(L,[]).
tail_reverse([],Arr)->Arr;
tail_reverse([H|T],Arr)->tail_reverse(T,[H|Arr]).

sublist(0,_)->[];
sublist(_,[])->[];
sublist(N,[H|T])->H++sublist(N-1,T).

tail_sublist(N,L)->tail_sublist(N,L,[]).
tail_sublist(_,[],Acc)->Acc;
tail_sublist(0,[],Acc)->Acc;
tail_sublist(N,[H|T],Acc)->tail_sublist(N-1,T,[Acc|H]).

zip([],[])->[];
zip([X|Xs],[Y|Ys])->[{X,Y}|zip(Xs,Ys)].

lenient_zip([],_)->[];
lenient_zip(_,[])->[];
lenient_zip([X|Xs],[Y|Ys])->[{X,Y}|lenient_zip(Xs,Ys)].
