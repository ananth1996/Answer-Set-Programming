% CS-E4800 Artificial intelligence
% Round: Applications via Logic Programming
%
% Base Encoding for the ASP Exercise: Tournament Scheduling
%
% Some parts of the encoding have been deleted and indicated by
% question marks "???". You are supposed to fill in the missing details
% on the basis of descriptions given as well as general understanding of
% the problem.
% Parameters: the number of teams (silently assumed to be even)

#const n=4.
% Declare the domains for the teams, fields, and weeks

team(1..n).
field(1..n/2).
week(1..n-1).

% Define matches (an ordered pair of teams)
match(X,Y) :- team(X), team(Y), X<Y.

% Choose the week W for the match between T1 and T2 by default,
% unless the match is organized some other week. Encode exceptions
% using an appropriate auxiliary predicate.
thisweek(T1,T2,W) :- week(W), match(T1,T2), not noconflict(T1,T2,W).
noconflict(T1,T2,W) :- thisweek(T1,T2,W2), W2!= W, week(W). 

%noconflict(T1,T2,W) :- not thisweek(T1,T2,V): week(V), V!=W; match(T1,T2),week(W).

% Add rules as needed 


% Choose the field F for the match between T1 and T2 by default,
% unless the match takes place in some other field. Encode exceptions
% using an appropriate auxiliary predicate.
thisfield(T1,T2,F) :- field(F), match(T1,T2), not fieldfree(T1,T2,F).

%fieldfree(T1,T2,F) :- not thisfield(T1,T2,G): field(G), G!=F; match(T1,T2), field(F).
fieldfree(T1,T2,F) :- thisfield(T1,T2,G) ,field(G), G!=F,field(F).

% Add rules as needed


% Every slot (F,W) in the schedule, identified by a field F and a week W,
% must have a match scheduled
occupied(W,F) :- thisweek(T1,T2,W), thisfield(T1,T2,F).
:- not occupied(W,F),week(W),field(F).


% A team may have only one match per week
opponent(T1,W,T2) :- thisweek(T1,T2,W).
opponent(T2,W,T1) :- thisweek(T1,T2,W).
:- opponent(T,W,T1), opponent(T,W,T2), T1!=T2.


% Combine the schedule into a single relation for the ease of understanding
match(T1,T2,F,W) :- thisweek(T1,T2,W), thisfield(T1,T2,F).


% Extract solution (the following predicates are used in the evaluation)
%#show occupied/2.
#show match/4.
#show team/1.