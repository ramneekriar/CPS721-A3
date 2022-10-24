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

dance_section([[fri, 1], [fri, 2], [fri, 3]]).

art_section([[mon, 10], [wed, 10], [fri, 10]]).
art_section([[mon, 11], [wed, 11], [fri, 11]]).

math_section([[mon, 11], [wed, 3], [fri, 3]]).
math_section([[mon, 2], [wed, 2], [fri, 11]]).

cs_section([[mon, 11], [wed, 11], [fri, 12]]).
cs_section([[mon, 12], [wed, 12], [wed, 3]]).

%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any

check_conflict(Timetable) :-
    member(Class1, Timetable), member(Class2, Timetable), not Class1=Class2,
    member([Day, Hour], Class1), member([Day, Hour], Class2).

check_lunch_conflict(Timetable) :-
    member(Class1, Timetable), member(Class2, Timetable), not Class1=Class2,
    member([Day, Hour1], Class1), member([Day, Hour2], Class2), append([Hour1], [Hour2], [12, 1]).
    
%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve(List) :-
    List = [P1,P2,P3,P4],

    % Grab sections
    art_section(P1), math_section(P2), cs_section(P3), dance_section(P4),

    % Check conflicts
    not check_conflict([P1, P2, P3, P4]),
    not check_lunch_conflict([P1, P2, P3, P4]).


%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

print_solution([ [[Art_D1, Art_H1], [Art_D2, Art_H2], [Art_D3, Art_H3]],
                   [[Math_D1, Math_H1], [Math_D2, Math_H2], [Math_D3, Math_H3]],
                   [[CS_D1, CS_H1], [CS_D2, CS_H2], [CS_D3, CS_H3]],
                   [[Dance_D1, Dance_H1], [Dance_D2, Dance_H2], [Dance_D3, Dance_H3]]]) :- 
    
    solve([ [[Art_D1, Art_H1], [Art_D2, Art_H2], [Art_D3, Art_H3]],
                   [[Math_D1, Math_H1], [Math_D2, Math_H2], [Math_D3, Math_H3]],
                   [[CS_D1, CS_H1], [CS_D2, CS_H2], [CS_D3, CS_H3]],
                   [[Dance_D1, Dance_H1], [Dance_D2, Dance_H2], [Dance_D3, Dance_H3]]]),
    
    write("Art: "), write(Art_D1), write(" "), write("at "), write(Art_H1), write(":00"), write(", "), write(Art_D2), write(" "), write("at "), write(Art_H2), write(":00"),write(", "), write(Art_D3), write(" "), write("at "), write(Art_H3), write(":00"), nl,
    write("Math: "), write(Math_D1), write(" "), write("at "), write(Math_H1), write(":00"), write(", "), write(Math_D2), write(" "), write("at "), write(Math_H2), write(":00"), write(", "), write(Math_D3), write(" "), write("at "), write(Math_H3), write(":00"), nl,
    write("Computer Science: "), write(CS_D1), write(" "), write("at "), write(CS_H1), write(":00"), write(", "), write(CS_D2), write(" "), write("at "), write(CS_H2), write(":00"), write(", "), write(CS_D3), write(" "), write("at "), write(CS_H3), write(":00"), nl,
    write("Dance: "), write(Dance_D1), write(" "), write("at "), write(Dance_H1), write(":00"), write(" to "), write("4:00"), nl.


%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW