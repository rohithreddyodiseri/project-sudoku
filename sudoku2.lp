% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

#const n = 3.

pos(1..n*n).
value(1..n*n).

% Step 1: Subgrid Mapping
subgrid(X, Y, 1+(((X-1)/n)*n + (Y-1)/n)) :- pos(X), pos(Y).

% Step 2: Generator (from 1a)
{ sudoku(X, Y, V) : value(V) } = 1 :- pos(X), pos(Y).

% Step 3: Constraints (from 1a)
:- initial(X, Y, V), not sudoku(X, Y, V).
:- sudoku(X, Y1, V), sudoku(X, Y2, V), Y1 != Y2.
:- sudoku(X1, Y, V), sudoku(X2, Y, V), X1 != X2.
:- sudoku(X1, Y1, V), sudoku(X2, Y2, V), (X1,Y1) != (X2, Y2), subgrid(X1, Y1, G), subgrid(X2, Y2, G).

% Output Display (1b requires subgrid facts to be shown)
#show sudoku/3.