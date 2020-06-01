inv(1,0).
inv(0,1).

and(1,1,1).
and(1,0,0).
and(0,1,0).
and(0,0,0).

or(1,0,1).
or(1,1,1).
or(0,0,0).
or(0,1,1).

circuit(A,B,S,C):-and(A,B,C),or(A,B,AB),inv(C,Ci),and(AB,Ci,S).
