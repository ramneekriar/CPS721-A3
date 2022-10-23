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

dig(0). dig(1). dig(2). dig(3). dig(4). dig(5). dig(6). dig(7). dig(8). dig(9).

car(0). car(1). car(3).

%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any)

all_diff([]).
all_diff([H|T]) :- not member(H, T), all_diff(T).


%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([S,T,R,A,W,O,C,H,I]) :-
    
    dig(S), S > 0, car(CF100),
    C is S + CF100, C > 0,

    dig(T), T>0, dig(W), W > 0,
    H is (W+T+CF100) mod 10, CF1000 is (W+T+CF100)//10,

    dig(O),
    S is (O*W) mod 10, C1 is (O*W)//10,

    car(CT100),
    T is (T*T+CT100) mod 10, CT1000 is (T*T+CT100)//10,
    S is (T*S+CT1000) mod 10,
    S is S,

    car(C100),
    A is (O*T+C100) mod 10, C1000 is (O*T+C100)//10,

    R is (T+W) mod 10, CF1 is (T+W)//10,

    dig(R), car(CF10),
    A is (A+R+CF10) mod 10, CF100 is (A+R+CF10)//10,

    I is (R+A+CF1) mod 10, CF10 is (R+A+CF1)//10,

    car(CT10),
    R is (T*R+CT10) mod 10, CT100 is (T*R+CT10)//10,

    W is (T*W) mod 10, CT1 is (T*W)//10,
    A is (T*A+CT1) mod 10, CT10 is (T*A+CT1)//10,

    car(C1000),
    W is (O*S+C1000) mod 10,

    T is (O*A+C1) mod 10, C10 is (O*A+C1)//10,

    R is (O*R+C10) mod 10, C100 is (O*R+C10)//10,

    all_diff([S,T,R,A,W,O,C,H,I]).




%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES
print_solution :-
    solve([S,T,R,A,W,O,C,H,I]),
    write('    '), write(S), write(T), write(R), write(A), write(W), nl,
    write('X      '), write(T), write(O), nl,
    write('    '), write('______'), nl,
    write('    '), write(W), write(A), write(R), write(T), write(S), nl,
    write('   '), write(S), write(T), write(R), write(A), write(W), nl,
    write('+  '), write('________'), nl,
    write('   '), write(C), write(H), write(A), write(I), write(R), write(S), nl.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW