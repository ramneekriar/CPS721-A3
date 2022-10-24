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

person(flossie). person(elsie). person(daisy). person(bossie). person(maybelle).

%%%%% HELPER PREDICATES
% Put any helper predicates here (leave empty if you do not have any

all_diff([]).
all_diff([H|T]) :- all_diff(T), not member(H, T).

%%%%% RULE: solve( ListOfVars )
% Add the rules defining your solve program
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

solve([Brown, Jones, Smith, Nelson, Ford, Eight, Seven, Six, Five, Two, Slipped, Gravity, SoreHoof, MoonMoved, Headache]) :-

    % Reasoning
    % As a person(X) value is assigned to each variable, we immediately check if
    % the value that was assigned was unique to each Farmer, Jump and Excuse.
    % This is done using the helper function all_diff(List) which checks if every
    % value in the list is unique.
    % By doing this, we mitigate the amount of backtracking needed when incorrectly
    % assigning values to each variable.
    
    person(Brown), person(Jones), person(Smith), person(Nelson), person(Ford),
    all_diff([Brown, Jones, Smith, Nelson, Ford]),

    person(Eight), person(Seven), person(Six), person(Five), person(Two),
    all_diff([Eight, Seven, Six, Five, Two]),

    person(Slipped), person(Gravity), person(SoreHoof), person(MoonMoved), person(Headache),
    all_diff([Slipped, Gravity, SoreHoof, MoonMoved, Headache]),

    % Clue 1
    Smith = Slipped,

    % Clue 2
    Headache = Six,

    % Clue 3
    Ford = Two,
    all_diff([maybelle, Ford, elsie]),
    all_diff([maybelle, Two, elsie]),

    % Clue 4
    all_diff([bossie, flossie, elsie, Headache]),

    % Clue 5
    all_diff([flossie, Smith, Nelson, Ford]),

    % Clue 6
    all_diff([maybelle, flossie, Jones]),
    all_diff([maybelle, flossie, Gravity]),

    % Clue 7
    not MoonMoved = Nelson,

    % Clue 8
    Slipped = Five,

    % Clue 9
    Brown = MoonMoved,

    % Clue 10
    all_diff([Nelson, flossie, elsie, daisy, bossie]),

    % Clue 11
    all_diff([Jones, flossie, elsie, bossie, maybelle]),

    % Clue 12
    not Headache = MoonMoved,
    not Headache = Gravity,
    not Headache = Two,

    not Gravity = MoonMoved,
    not Gravity = Headache,
    not Gravity = Seven,
    not Gravity = Eight.

%%%%% RULE: print_solution ( ListOfVars )
%  Add rules the prints your solution in a readable format
% MAKE SURE IT TAKES A LIST AS INPUT, SUCH THAT THAT LIST IS CONTAINS ALL VARIABLES

print_solution :-
    solve([Brown, Jones, Smith, Nelson, Ford, Eight, Seven, Six, Five, Two, Slipped, Gravity, SoreHoof, MoonMoved, Headache]),

    Height = [Eight, Seven, Six, Five, Two],
    Farmer = [Brown, Jones, Smith, Nelson, Ford],
    Excuse = [Slipped, Gravity, SoreHoof, MoonMoved, Headache],

    write('-------------------'), nl,
    write('Cow is Flossie'), nl,
    ownerMatch([flossie, A1], Farmer),
    jumpMatch([flossie, B1], Height),
    excuseMatch([flossie, C1], Excuse),
    write('-------------------'), nl,

    write('Cow is Elsie'), nl,
    ownerMatch([elsie, A2], Farmer),
    jumpMatch([elsie, B2], Height),
    excuseMatch([elsie, C2], Excuse),
    write('-------------------'), nl,
    
    write('Cow is Daisy'), nl,
    ownerMatch([daisy, A3], Farmer),
    jumpMatch([daisy, B3], Height),
    excuseMatch([daisy, C3], Excuse),
    write('-------------------'), nl,

    write('Cow is Bossie'), nl,
    ownerMatch([bossie, A4], Farmer),
    jumpMatch([bossie, B4], Height),
    excuseMatch([bossie, C4], Excuse),
    write('-------------------'), nl,

    write('Cow is Maybelle'), nl,
    ownerMatch([maybelle, A5], Farmer),
    jumpMatch([maybelle, B5], Height),
    excuseMatch([maybelle, C5], Excuse),
    write('-------------------'), nl.

jumpMatch([Cow, JumpName], [Eight, Seven, Six, Five, Two]) :-
    member([Cow, JumpName],
    [[Eight, '8'],
    [Seven, '7'],
    [Six, '6'],
    [Five, '5'],
    [Two, '2']]),
    write('The cow jumped '), write(JumpName), write(' feet high.'), nl.

excuseMatch([Cow, ExcuseName], [Slipped, Gravity, SoreHoof, MoonMoved, Headache]) :-
    member([Cow, ExcuseName],
    [[Slipped, 'Slipped'],
    [Gravity, 'Gravity'],
    [SoreHoof, 'Sore Hoof'],
    [MoonMoved, 'Moon Moved'],
    [Headache, 'Headache']]),
    write('The excuse is '), write(ExcuseName), write('.'), nl.

ownerMatch([Cow, OwnerName], [Brown, Jones, Smith, Nelson, Ford]) :-
    member([Cow, OwnerName],
    [[Brown, 'Brown'],
    [Jones, 'Jones'],
    [Smith, 'Smith'],
    [Nelson, 'Nelson'],
    [Ford, 'Ford']]),
    write('The owner is '), write(OwnerName), write('.'), nl.

% pmatch(X, OwnerName, X, CowName X, HeightName, X, ExcuseName) :-
%    nl, write(OwnerName), write('is the owner of '),
%    write(CowName), write(' who jumped '),
%    write(HeightName), write(' feet with excuse '),
%    write(ExcuseName), write('.').

%%%%% END
% DO NOT PUT ANY ATOMIC PROPOSITIONS OR LINES BELOW
