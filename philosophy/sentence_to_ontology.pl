% s([i,ate,the,apple],O).
% O = [ate, [i, apple]].

% s([i,raked,the,lawn,with,the,rake],O).
% O = [raked, [i, lawn, [with, rake]]].

% s([i,watered,the,garden,while,walking,along,the,path],O).
% O = [watered,[i,garden,[while,walking,[along,path]]]]

s([S,V,Def_Art,O],[V,[S,O]]) :-
	n(S),v(V),def_art(Def_Art),n(O),!.

s([S,V,Def_Art,O,With,Def_Art,O2],[V,[S,O,[With,O2]]]) :-
	n(S),v(V),def_art(Def_Art),n(O),
	with(With),n(O2),!.

s([S,V,Def_Art,O,While,V2,Along,Def_Art,O2],[V,[S,O,[While,V2,[Along,O2]]]]) :-
	n(S),v(V),def_art(Def_Art),n(O),
	while(While),v(V2),along(Along),n(O2),!.

n(i).
n(apple).
n(lawn).
n(rake).
n(path).
n(garden).

v(ate).
v(watered).
v(raked).
v(walking).

def_art(the).
with(with).
while(while).
along(along).
