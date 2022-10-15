% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: 
%%%%% NAME:
%%%%% NAME:
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC
% Put any atomic statements needed here



%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any



%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([S,T,R,A,W,O,C,H,I]) :- dig(S), dig(T), dig(R), dig(A), dig(W), dig(O), dig(C), dig(H), dig(I),

S>0, T>0, W>0,
S is (W*O) mod 10, C1 is (W*O) // 10,
T is (A*O+C1) mod 10, C10 is (A*O+C1) //10,
R is (R*O+C10) mod 10, C100 is (A*O+C10) //10,
A is (T*O+C100) mod 10, C1000 is (A*O+C100) //10,
W is (S*O+C1000) //10,
I is (R+A+((T+W)//10)),
H is (W+T+((A+R)//10)),
C is (S+((W+T)//10)),

all_diff([S,T,R,A,W,O,C,H,I]).

dig(0). dig(1). dig(2). dig(3). dig(4). dig(5). dig(6). dig(7). dig(8). dig(9).

all_diff([]).
all_diff([N|L]) :- not member(N,L), all_diff(L).



%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES



%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
