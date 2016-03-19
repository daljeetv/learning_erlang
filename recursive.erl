-module(recursive).
-export([fac/1,len/1, fac_tail/1, duplicate/2]).

fac(0)->1;
fac(N) when N > 0 -> N*fac(N-1).

len([])->0;
len([_|T])-> 1+len(T).

fac_tail(N) -> fac_tail(N,1).

fac_tail(0, Acc) -> Acc;
fac_tail(N,Acc)->fac_tail(N-1,Acc*N).
