/*  zpd_criteria.pl

    Zone of Proximal Development (ZPD) + Criteria Checker
    with numeric scores for Lucian Academy essays.


swipl zpd_criteria.pl
?- run_default.
?- default_criteria(C),
   evaluate_all_students(C, Reports),
   print_student_reports(Reports).
   
?- default_criteria(C),
   evaluate_all_students(C, Reports),
   class_average_for_skill(counter_argument, Reports, AvgCA),
   failing_students_for_skill(counter_argument, Reports, Names).
   */

:- use_module(library(lists)).
:- use_module(library(apply)).

/* =========
   SKILL MODEL
   ========= */

skill(thesis_statement).
skill(topic_sentences).
skill(evidence).
skill(analysis).
skill(counter_argument).
skill(cohesion).

/* =========
   STUDENT DATABASE (EXAMPLE)
   ========= */

% In practice you will replace / extend these with your own data.

% student(Name, EssayText).

student(lucian,
"In this essay, I argue that manual neuronets improve learning.
For example, they expose reasoning steps. However, they also require
careful design. In conclusion, they support deeper understanding.").

student(alex,
"This paper will examine the benefits of group work.
Firstly, students learn to cooperate. Secondly, they share ideas.
In conclusion, group work can be useful in education.").

/* =========
   DEFAULT CRITERIA
   ========= */

default_criteria([
    criterion(thesis_statement, present),
    criterion(topic_sentences, present),
    criterion(evidence, present),
    criterion(analysis, present),
    criterion(counter_argument, present),
    criterion(cohesion, present)
]).

/* =========
   SENTENCE PROCESSING
   ========= */

%% split_sentences(+Text, -Sentences:list(string)) is det.
%
%  Naive sentence splitter on . ! ?
%
split_sentences(Text, Sentences) :-
    split_string(Text, ".!?", ".!?\n\r\t ", Raw),
    exclude(string_empty, Raw, Sentences).

string_empty(S) :- string_length(S, L), L =:= 0.

/* =========
   FEATURE DETECTION
   ========= */

%% essay_zpd(+EssayText:string, -ZPDPlan:list) is det.
%
%  EssayText: a string containing the whole essay.
%  ZPDPlan:   list of zpd(Skill, Status, Scaffolds).
%
%  Status is one of: present, absent.
%
essay_zpd(EssayText, ZPDPlan) :-
    split_sentences(EssayText, Sentences),
    detect_all_features(Sentences, Features),
    build_zpd_plan(Features, ZPDPlan).

detect_all_features(Sentences, Features) :-
    findall(Skill, skill(Skill), Skills),
    maplist(detect_feature(Sentences), Skills, Features).

detect_feature(Sentences, thesis_statement, feature(thesis_statement, Status)) :-
    (   has_thesis(Sentences)
    ->  Status = present
    ;   Status = absent
    ).
detect_feature(Sentences, topic_sentences, feature(topic_sentences, Status)) :-
    (   has_topic_sentences(Sentences)
    ->  Status = present
    ;   Status = absent
    ).
detect_feature(Sentences, evidence, feature(evidence, Status)) :-
    (   has_evidence(Sentences)
    ->  Status = present
    ;   Status = absent
    ).
detect_feature(Sentences, analysis, feature(analysis, Status)) :-
    (   has_analysis(Sentences)
    ->  Status = present
    ;   Status = absent
    ).
detect_feature(Sentences, counter_argument, feature(counter_argument, Status)) :-
    (   has_counter_argument(Sentences)
    ->  Status = present
    ;   Status = absent
    ).
detect_feature(Sentences, cohesion, feature(cohesion, Status)) :-
    (   has_cohesion(Sentences)
    ->  Status = present
    ;   Status = absent
    ).

/* --- Heuristic detectors --- */

has_thesis(Sentences) :-
    member(S, Sentences),
    contains_any(S, [
        "in this essay",
        "this essay argues",
        "i argue that",
        "i will argue",
        "the purpose of this essay",
        "this paper argues",
        "this paper will"
    ]), !.

has_topic_sentences(Sentences) :-
    length(Sentences, Len),
    Len >= 3,
    include(starts_like_topic_sentence, Sentences, TopicSents),
    length(TopicSents, TSCount),
    TSCount >= 2.

starts_like_topic_sentence(S) :-
    contains_any(S, [
        "firstly",
        "secondly",
        "thirdly",
        "another reason",
        "in addition",
        "furthermore",
        "moreover"
    ]).

has_evidence(Sentences) :-
    member(S, Sentences),
    contains_any(S, [
        "for example",
        "for instance",
        "according to",
        "research shows",
        "studies show",
        "evidence suggests",
        "("  % crude proxy for citations like (Smith, 2020)
    ]), !.

has_analysis(Sentences) :-
    member(S, Sentences),
    contains_any(S, [
        "this shows that",
        "this suggests that",
        "this implies that",
        "therefore",
        "hence",
        "as a result",
        "consequently"
    ]), !.

has_counter_argument(Sentences) :-
    member(S, Sentences),
    contains_any(S, [
        "however",
        "on the other hand",
        "although",
        "while it is true that",
        "some may argue",
        "critics might say",
        "a common objection"
    ]), !.

has_cohesion(Sentences) :-
    member(S, Sentences),
    contains_any(S, [
        "however",
        "therefore",
        "thus",
        "furthermore",
        "moreover",
        "in conclusion",
        "overall"
    ]), !.

/* =========
   HELPER: STRING SEARCH
   ========= */

contains_any(Sentence, Keywords) :-
    string_lower(Sentence, Lower),
    member(K, Keywords),
    string_lower(K, LowerK),
    sub_string(Lower, _, _, _, LowerK),
    !.

/* =========
   ZPD PLAN CONSTRUCTION
   ========= */

build_zpd_plan(Features, ZPDPlan) :-
    maplist(feature_to_zpd, Features, ZPDPlan).

feature_to_zpd(feature(Skill, Status), zpd(Skill, Status, Scaffolds)) :-
    scaffolds_for(Skill, Status, Scaffolds).

/* =========
   SCAFFOLDS
   ========= */

scaffolds_for(thesis_statement, present, [
    "Your thesis statement is detectable; next, refine it to be more specific and debatable.",
    "Check that every body paragraph clearly links back to your thesis.",
    "Consider re-writing the thesis in one concise sentence and placing it near the beginning."
]).
scaffolds_for(thesis_statement, absent, [
    "Write one sentence that clearly states your main argument or position.",
    "Place that sentence in the introduction using a phrase like 'This essay argues that ...'.",
    "Check that each paragraph relates directly to this central claim."
]).

scaffolds_for(topic_sentences, present, [
    "Ensure each topic sentence announces the main idea of the paragraph.",
    "Add transition phrases (e.g., 'Firstly', 'In addition') to make the flow clearer.",
    "Check that each topic sentence supports the thesis and is not too vague."
]).
scaffolds_for(topic_sentences, absent, [
    "At the start of each body paragraph, write one sentence that summarises that paragraph's key idea.",
    "Use transitions like 'Firstly', 'Secondly' or 'Another reason is' to guide the reader.",
    "After writing topic sentences, re-read them in order to see if they form a logical path from thesis to conclusion."
]).

scaffolds_for(evidence, present, [
    "Add more varied sources (e.g., academic articles, data, examples) to strengthen your argument.",
    "Introduce each piece of evidence with context, not just a quote or a number.",
    "Explain why each piece of evidence is relevant to your argument."
]).
scaffolds_for(evidence, absent, [
    "For each main point, add at least one concrete example, quotation, or reference to research.",
    "Use phrases like 'For example', 'According to X' or 'Research shows' to introduce evidence.",
    "After adding evidence, explicitly connect it back to your main argument."
]).

scaffolds_for(analysis, present, [
    "After presenting evidence, add sentences beginning with 'This shows that...' or 'This suggests that...' to deepen analysis.",
    "Look for any places where you summarise instead of analysing, and expand them.",
    "Ask yourself 'Why is this important?' and add that answer to your paragraph."
]).
scaffolds_for(analysis, absent, [
    "After each example or quotation, add a sentence that starts with 'This shows that...' or 'This suggests that...'.",
    "Explain why your evidence supports your thesis, not just what the evidence says.",
    "Ask 'so what?' after each piece of evidence and write the answer as analysis."
]).

scaffolds_for(counter_argument, present, [
    "Make sure you respond clearly to the counter-argument and show why your position still stands.",
    "Use respectful language when stating opposing views (e.g., 'Some may argue that...').",
    "End the counter-argument section by reinforcing your thesis."
]).
scaffolds_for(counter_argument, absent, [
    "Add a paragraph that begins with 'Some may argue that...' or 'A common objection is...'.",
    "Briefly explain this opposing view as fairly as you can.",
    "Then respond to it, showing why your original argument remains strong."
]).

scaffolds_for(cohesion, present, [
    "Check that each paragraph ends with a sentence that links smoothly to the next paragraph.",
    "Use linking words (however, therefore, moreover) to show relationships between ideas.",
    "Re-read your essay aloud to hear whether the flow feels natural and logical."
]).
scaffolds_for(cohesion, absent, [
    "Add linking words such as 'However', 'Therefore', 'Furthermore' to show how ideas connect.",
    "End each paragraph with a sentence that prepares the reader for the next point.",
    "Write a concluding paragraph that starts with 'In conclusion' or 'Overall' and summarises your key points."
]).

/* =========
   CRITERIA CHECK (WITH NUMERIC SCORES)
   ========= */

%% check_essay_against_criteria(+EssayText, +Criteria, -Results) is det.
%
%  Criteria: [criterion(Skill, RequiredStatus), ...]
%  Results:  [result(Skill, RequiredStatus, ActualStatus, Outcome, Score), ...]
%
%  Outcome:
%    - ok          : ActualStatus = RequiredStatus
%    - needs_work  : otherwise
%
%  Score:
%    - 1 if Outcome = ok
%    - 0 otherwise
%
check_essay_against_criteria(EssayText, Criteria, Results) :-
    essay_zpd(EssayText, ZPDPlan),
    maplist(check_one_criterion(ZPDPlan), Criteria, Results).

check_one_criterion(ZPDPlan,
                    criterion(Skill, Required),
                    result(Skill, Required, Actual, Outcome, Score)) :-
    (   member(zpd(Skill, Actual, _), ZPDPlan)
    ->  true
    ;   Actual = unknown
    ),
    (   Actual = Required
    ->  Outcome = ok,
        Score   = 1
    ;   Outcome = needs_work,
        Score   = 0
    ).

/* ==================================
   CRITERIA CHECKER FOR MANY STUDENTS
   ================================== */

evaluate_students_for_criteria(StudentNames, Criteria, Reports) :-
    maplist(evaluate_one_student(Criteria), StudentNames, Reports).

evaluate_one_student(Criteria, StudentName, student_report(StudentName, Results)) :-
    student(StudentName, EssayText),
    check_essay_against_criteria(EssayText, Criteria, Results).

evaluate_all_students(Criteria, Reports) :-
    findall(Name, student(Name, _), Names),
    evaluate_students_for_criteria(Names, Criteria, Reports).

/* =========
   NUMERIC SUMMARY FUNCTIONS
   ========= */

student_summary_from_results(Results, Total, Max, Percent) :-
    maplist(result_score, Results, Scores),
    sum_list(Scores, Total),
    length(Scores, Max),
    (   Max > 0
    ->  Percent is 100.0 * Total / Max
    ;   Percent is 0.0
    ).

result_score(result(_Skill, _Req, _Act, _Outcome, Score), Score).

/* =========
   CLASS AVERAGE PER SKILL
   ========= */

class_average_for_skill(Skill, Reports, Average) :-
    findall(Score,
            ( member(student_report(_Name, Results), Reports),
              member(result(Skill, _Req, _Act, _Outcome, Score), Results)
            ),
            Scores),
    (   Scores = []
    ->  Average = 0.0
    ;   sum_list(Scores, Total),
        length(Scores, N),
        Average is Total / N
    ).

/* =========
   FAILING STUDENTS FOR A SKILL
   ========= */

failing_students_for_skill(Skill, Reports, Names) :-
    findall(Name,
            ( member(student_report(Name, Results), Reports),
              member(result(Skill, _Req, _Act, needs_work, _Score), Results)
            ),
            Names).

/* =========
   PRETTY PRINTING
   ========= */

print_student_reports([]).
print_student_reports([student_report(Name, Results)|Rest]) :-
    format("~n===============================~n", []),
    format("Student: ~w~n", [Name]),
    print_criteria_results(Results),
    student_summary_from_results(Results, Total, Max, Percent),
    format("Total score: ~w / ~w (~2f%%)~n", [Total, Max, Percent]),
    print_student_reports(Rest).

print_criteria_results([]).
print_criteria_results([result(Skill, Required, Actual, Outcome, Score)|Rest]) :-
    format("  Skill:    ~w~n", [Skill]),
    format("    Required: ~w~n", [Required]),
    format("    Actual:   ~w~n", [Actual]),
    format("    Outcome:  ~w~n", [Outcome]),
    format("    Score:    ~w~n", [Score]),
    print_criteria_results(Rest).

/* =========
   CONVENIENCE ENTRY POINT
   ========= */

run_default :-
    default_criteria(C),
    evaluate_all_students(C, Reports),
    print_student_reports(Reports).