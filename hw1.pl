% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

male(me).
%male(mybrother).
male(dad).
%male(uncle).
male(son).
male(haha).
%female(uncleWife).
%female(widowMom).
female(widow).
female(daughter).
%female(daughter2).
%female(dadDaughter).

parent(dad,me).
parent(dad,mybrother).
parent(dad,dadDaughter).
%parent(widowMom,dad).
%parent(widowMom,uncle).
%parent(widowMom,widow).
%parent(widowMom,widdersister).
parent(widow,daughter).
%parent(widow,daughter2).
parent(me,son).
parent(widow,son).

married(dad,daughter).
married(me,widow).
%married(uncle,uncleWife).

father(Dad,Kid):-
	parent(Dad,Kid),
	male(Dad).

mother(Mom,Kid):-
	parent(Mom,Kid),
	female(Mom).
%Kid2 is the brother of Kid1
brother(Kid1,Kid2):-
	parent(Parent,Kid1),
	parent(Parent,Kid2),
	male(Kid2),
	Kid1 \= Kid2.


sibling(Kid1,Kid2):-
	parent(Parent,Kid1),
	parent(Parent,Kid2),
	Kid1 \= Kid2.

%Kid2 is the sister of Kid1
sister(Kid1,Kid2):-
	parent(Parent,Kid1),
	parent(Parent,Kid2),
	female(Kid2),
	Kid1 \= Kid2.


cousin(Who, Whom):-
	parent(Parent1,Who),
	parent(Parent2,Whom),
	sibling(Parent1,Parent2).

%Who is Whom's brother-in-law
brother_in_law(Who,Whom):-
	sibling(Whom,Spouse),
	married(Spouse,Who),
	male(Who);
	married(Whom,Spouse),
	brother(Spouse,Who).


%Who is Whom's sister-in-law
sister_in_law(Who,Whom):-
	married(Whom,Spouse),
	sister(Spouse,Who).

%Who is Whom's sister-in-law
sister_in_law(Who,Whom):-
	sibling(Whom,Spouse),
	married(Spouse,Who),
	female(Who).

uncle(Kid,Uncle):-
	parent(Parent,Kid),
	brother(Parent,Uncle).

aunt(Kid,Aunt):-
	parent(Parent,Kid),
	sister(Parent,Aunt).
