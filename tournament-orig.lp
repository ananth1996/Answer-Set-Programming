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

team(1..???).
field(1..???).
week(1..???).

% Define matches (an ordered pair of teams)

match(???,???) :- ???.

% Choose the week W for the match between T1 and T2 by default,
% unless the match is organized some other week. Encode exceptions
% using an appropriate auxiliary predicate.

thisweek(T1,T2,W) :- ???.
% Add rules as needed 

% Choose the field F for the match between T1 and T2 by default,
% unless the match takes place in some other field. Encode exceptions
% using an appropriate auxiliary predicate.

thisfield(T1,T2,F) :- ???.
% Add rules as needed

% Every slot (F,W) in the schedule, identified by a field F and a week W,
% must have a match scheduled

occupied(W,F) :- ???.
:- ???.

% A team may have only one match per week

opponent(T1,W,T2) :- ???.
opponent(T2,W,T1) :- ???.
:- opponent(T,W,???), opponent(T,W,???).

% Combine the schedule into a single relation for the ease of understanding

match(T1,T2,F,W) :- thisweek(???), thisfield(???).

% Extract solution (the following predicates are used in the evaluation)

#show match/4.
#show team/1.
