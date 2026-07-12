% trim_to_unique(Synonym_list, Unique_list)
% Removes duplicate key-value pairs, including reverse matches (A-B and B-A).

trim_to_unique(List, Unique) :-
    sort(List, Sorted),            % Removes exact duplicates (e.g., [a,b] == [a,b])
    trim_reverse(Sorted, [], Unique).

trim_reverse([], Acc, Unique) :-
    reverse(Acc, Unique).
trim_reverse([Pair | Rest], Acc, Unique) :-
    Pair = [Word, Synonym],
    % Skip if either the direct or reversed pair already exists in the accumulator
    (   memberchk([Word, Synonym], Acc)
    ;   memberchk([Synonym, Word], Acc)
    ),
    !,
    trim_reverse(Rest, Acc, Unique).
trim_reverse([Pair | Rest], Acc, Unique) :-
    trim_reverse(Rest, [Pair | Acc], Unique).
