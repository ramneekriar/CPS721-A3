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

person(1). person(2). person(3). person(4). person(5).

is_not(X, Y) :- 

%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any

all_diff([]).
all_diff([H|T]) :- person(H), all_diff(T), not member(H, T).

%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([Cow, Farmer, Jump, Excuse]) :-

    Cow = [Flossie, Elsie, Daisy, Bossie, Maybelle],
    Farmer = [Brown, Jones, Smith, Nelson, Ford],
    Jump = [Eight, Seven, Six, Five, Two],
    Excuse = [Slipped, Gravity, SoreHoof, MoonMoved, Headache],

    % Clue 1
    Smith = Slipped,

    % Clue 2
    Six = Headache,

    % Clue 3
    not Maybelle = Ford,
    not Elise = Ford,
    Ford = Two,

    % Clue 4
    not Bossie = Headache,
    not Flossie = Headache,
    not Elise = Headache,

    % Clue 5
    not Smith = Flossie,
    not Nelson = Flossie,
    not Ford = Flossie,

    % Clue 6
    not Maybelle = Jones,
    not Flossie = Jones,
    not Maybelle = Gravity,
    not Flossie = Gravity,

    % Clue 7
    not MoonMoved = Nelson,

    % Clue 8
    Slipped = Five,

    % Clue 9
    Brown = MoonMoved,

    % Clue 10
    Nelson = Maybelle,

    % Clue 11
    Jones = Daisy,

    % Clue 12
    not Six = MoonMoved,
    not Five = MoonMoved,
    not Two = MoonMoved,
    not Gravity = MoonMoved,

    all_diff(Cow),
    all_diff(Farmer),
    all_diff(Jump),
    all_diff(Excuse).

%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

print_solution([Cow, Farmer, Jump, Excuse]) :-
    solve([Cow, Farmer, Jump, Excuse]),
    Farmer = [Brown, Jones, Smith, Nelson, Ford].

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
