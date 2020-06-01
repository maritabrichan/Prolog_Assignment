lucas(1, [2]).
lucas(2, [2, 1]).
lucas(N, Seq):- N > 2,lucas_more(N, S, 2, [1, 2]), reverse(S, Seq).
lucas_more(N, Seq, N, Seq).
lucas_more(N, Seq, N0, [B, A|F]) :- N>N0, N1 is N0 + 1, C is A + B,
 lucas_more(N, Seq, N1, [C, B, A|F]).
