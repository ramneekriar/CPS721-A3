% Enter the names of your group members below.
% If you only have 2 group members, leave the last space blank
%
%%%%%
%%%%% NAME: Karanvir Heer
%%%%% NAME: Ramneek Riar
%%%%% NAME: Shruti Sharma
%
% Add the required atomic propositions and rules in the corresponding sections. 
% If you put the propositions and rules in the wrong sections, you may lose marks.
%
% You may add additional comments as you choose but DO NOT MODIFY the comment lines below

%%%%% ATOMIC
% Put any atomic statements needed here

num(1). num(2). num(3). num(4).

%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any

allowed([]).
allowed([Num1|Rest]) :- not member(Num1, Rest),  allowed(Rest).

sub(X, Y, Z) :- Z is X - Y.
sub(X, Y, Z) :- Z is Y - X.

dv(X, Y, Z) :- 0 is mod(X, Y), Z is X // Y.
dv(X, Y, Z) :- 0 is mod(Y, X), Z is Y // X.

%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve(ListOfVars) :- 
	ListOfVars = [[C1R1, C1R2, C1R3, C1R4],
				[C2R1, C2R2, C2R3, C2R4], 
				[C3R1, C3R2, C3R3, C3R4],
				[C4R1, C4R2, C4R3, C4R4]],
	
    num(C1R1), num(C2R1),
	sub(C1R1, C2R1, 1),

	num(C1R2), num(C1R3),
	12 is (C1R2 * C1R3),

	num(C1R4), num(C2R4),
	sub(C1R4, C2R4, 3),
	allowed([C1R1, C1R2, C1R3, C1R4]),

	num(C2R2), num(C3R2),
	dv(C2R2, C3R2, 2),

	num(C2R3), num(C3R3),
	sub(C2R3, C3R3, 2),
	allowed([C2R1, C2R2, C2R3, C2R4]),

	num(C3R1), num(C4R1),
	sub(C3R1, C4R1, 3),
	allowed([C1R1,C2R1,C3R1, C4R1]),

	num(C3R4), num(C4R4),
	sub(C3R4, C4R4, 1),
	allowed([C1R4, C2R4, C3R4, C4R4]),
	allowed([C3R1, C3R2, C3R3, C3R4]),
    
	num(C4R2), num(C4R3),
	3 is (C4R2 + C4R3),
	allowed([C4R1, C4R2, C4R3, C4R4]),
	allowed([C1R3, C2R3, C3R3, C4R3]),
	allowed([C1R2, C2R2, C3R2, C4R2]).

%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

print_solution(ListOfVars):-
    solve([[C1R1, C1R2, C1R3, C1R4],
				[C2R1, C2R2, C2R3, C2R4], 
				[C3R1, C3R2, C3R3, C3R4],
				[C4R1, C4R2, C4R3, C4R4]]),

    write(" ---------------"), nl,
    write("| "), write(C1R1), write(" | "), write(C1R2), write(" | "),
        write(C1R3), write(" | "), write(C1R4), write(" |"),  nl,
    write("|---------------|"), nl,
    write("| "), write(C2R1), write(" | "), write(C2R2), write(" | "),
        write(C2R3), write(" | "), write(C2R4), write(" |"),  nl,
    write("|---------------|"), nl,
    write("| "), write(C3R1), write(" | "), write(C3R2), write(" | "),
        write(C3R3), write(" | "), write(C3R4), write(" |"),  nl,
    write("|---------------|"), nl,
    write("| "), write(C4R1), write(" | "), write(C4R2), write(" | "),
        write(C4R3), write(" | "), write(C4R4), write(" |"),  nl,
    write(" ---------------"), nl. 


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
