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

person(1). person(2). person(3). person(4). person(5).

%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any

all_diff([]).
all_diff([H|T]) :- person(H), all_diff(T), not member(H, T).

higher(1, 2). higher(2, 3). higher(3, 4). higher(4, 5).

five_feet(4).
third_highest(3).
lowest(5).

jumped_higher(X, Y) :- higher(X, Y).
jumped_higher(X, Y) :- higher(Y, X).

%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([Cow, Farmer, Jump, Excuse]) :-

    Cow = [Flossie, Elsie, Daisy, Bossie, Maybelle],
    all_diff(Cow),
    
    Farmer = [Brown, Jones, Smith, Nelson, Ford],
    all_diff(Farmer),

    Jump = [Eight, Seven, Six, Five, Two],
    all_diff(Jump),

    Excuse = [Slipped, Gravity, SoreHoof, MoonMoved, Headache],
    all_diff(Excuse),

    % Clue 1
    Smith = Slipped,

    % Clue 2
    third_highest(Headache),

    % Clue 3
    not Maybelle = Ford,
    not Elsie = Ford,
    lowest(Ford),

    % Clue 4
    not Bossie = Headache,
    not Flossie = Headache,
    not Elsie = Headache,

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
    five_feet(Slipped),

    % Clue 9
    Brown = MoonMoved,

    % Clue 10
    Nelson = Maybelle,

    % Clue 11
    Jones = Daisy,

    % Clue 12
    jumped_higher(MoonMoved, Headache),
    jumped_higher(Headache, Gravity).

%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

print_solution :-
    solve([[Flossie, Elsie, Daisy, Bossie, Maybelle], [Brown, Jones, Smith, Nelson, Ford], [Eight, Seven, Six, Five, Two], [Slipped, Gravity, SoreHoof, MoonMoved, Headache]]).

    write('Cow is Flossie'),
    ownerMatch([Flossie, A1]),
    jumpMatch([Flossie, B1]),
    excuseMatch([Flossie, C1]),

    write('Cow is Elsie'),
    ownerMatch([Elsie, A2]),
    jumpMatch([Elsie, B2]),
    excuseMatch([Elsie, C2]),
    
    write('Cow is Flossie'),
    ownerMatch([Daisy, A3]),
    jumpMatch([Daisy, B3]),
    excuseMatch([Daisy, C3]),

    write('Cow is Flossie'),
    ownerMatch([Bossie, A4]),
    jumpMatch([Bossie, B4]),
    excuseMatch([Bossie, C4]),

    write('Cow is Flossie'),
    ownerMatch([Maybelle, A5]),
    jumpMatch([Maybelle, B5]),
    excuseMatch([Maybelle, C5]).

jumpMatch([CowNum, JumpName]) :-
    member([CowNum, JumpName],
    [[Eight, '8'],
    [Seven, '7'],
    [Six, '6'],
    [Five, '5'],
    [Two, '2']]),
    write('The cow jumped '), write(JumpName), write(' feet high.').

excuseMatch([CowNum, ExcuseName]) :-
    member([CowNum, ExcuseName],
    [[Slipped, 'Slipped'],
    [Gravity, 'Gravity'],
    [SoreHoof, 'Sore Hoof'],
    [MoonMoved, 'Moon Moved'],
    [Headache, 'Headache']]),
    write('The excuse is '), write(ExcuseName), write('.').

ownerMatch([CowNum, OwnerName]) :-
    member([CowNum, OwnerName],
    [[Brown, 'Brown'],
    [Jones, 'Jones'],
    [Smith, 'Smith'],
    [Nelson, 'Nelson'],
    [Ford, 'Ford']]),
    write('The owner is '), write(OwnerName), write('.').

% pmatch(X, OwnerName, X, CowName X, HeightName, X, ExcuseName) :-
%    nl, write(OwnerName), write('is the owner of '),
%    write(CowName), write(' who jumped '),
%    write(HeightName), write(' feet with excuse '),
%    write(ExcuseName), write('.').

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
