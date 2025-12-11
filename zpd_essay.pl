/*  zpd_essay.pl

    Zone of Proximal Development (ZPD) helper
    for Lucian Academy essays.

    Usage example:

        ?- Essay = "In this essay, I argue that manual neuronets improve learning. \
                    For example, they expose reasoning steps. However, they also \
                    require careful design. In conclusion, they support deeper understanding.",
           essay_zpd(Essay, ZPDPlan),
           print_zpd_plan(ZPDPlan).



*/

:- use_module(library(lists)).
:- use_module(library(apply)).
:- use_module(library(pairs)).

/* =========
   ENTRY POINT
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

/* =========
   SKILL MODEL
   ========= */

% We model a small, structural skill set for essays.
% You can extend this with more skills if you like.

skill(thesis_statement).
skill(topic_sentences).
skill(evidence).
skill(analysis).
skill(counter_argument).
skill(cohesion).

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

%% detect_all_features(+Sentences, -Features:list) is det.
%
%  Features is a list of feature(Skill, Status).
%
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
    % very rough heuristic: check for cohesive markers
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

%% build_zpd_plan(+Features, -ZPDPlan) is det.
%
%  Convert feature list into a ZPD plan list.
%
build_zpd_plan(Features, ZPDPlan) :-
    maplist(feature_to_zpd, Features, ZPDPlan).

feature_to_zpd(feature(Skill, Status), zpd(Skill, Status, Scaffolds)) :-
    scaffolds_for(Skill, Status, Scaffolds).

/* =========
   SCAFFOLDS
   ========= */

% For each skill, define scaffolds for present / absent.
% You can enrich or localise these for the Academy.

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
   PRETTY PRINTER
   ========= */

%% print_zpd_plan(+ZPDPlan) is det.
%
%  Helper to display the plan nicely in the console.
%
print_zpd_plan(ZPDPlan) :-
    forall(member(zpd(Skill, Status, Scaffolds), ZPDPlan),
           ( format("~nSkill: ~w~nStatus: ~w~nScaffolds:~n", [Skill, Status]),
             print_scaffolds(Scaffolds)
           )).

print_scaffolds([]).
print_scaffolds([S|Rest]) :-
    format("  - ~s~n", [S]),
    print_scaffolds(Rest).
    
    
    
    
/* ================================
   STUDENT & CRITERIA REPRESENTATION
   ================================ */

% Example student database.
% In practice, you can assert/modify these or load from a file.

% student(Name, EssayText).
student(lucian,
"In this essay, I argue that manual neuronets improve learning.
For example, they expose reasoning steps. However, they also require
careful design. In conclusion, they support deeper understanding.").

student(alex,
"This paper will examine the benefits of group work.
Firstly, students learn to cooperate. Secondly, they share ideas.
In conclusion, group work can be useful in education.").

% Example criteria set: all key skills must be present.
default_criteria([
    criterion(thesis_statement, present),
    criterion(topic_sentences, present),
    criterion(evidence, present),
    criterion(analysis, present),
    criterion(counter_argument, present),
    criterion(cohesion, present)
]).



/* =======================
   SKILL STATUS FOR ESSAY
   ======================= */

%% skill_status_for_essay(+EssayText, +Skill, -Status) is det.
%
%  Status is whatever essay_zpd/2 reports (present/absent).
%
skill_status_for_essay(EssayText, Skill, Status) :-
    essay_zpd(EssayText, ZPDPlan),
    member(zpd(Skill, Status, _), ZPDPlan), !.
skill_status_for_essay(_EssayText, _Skill, unknown).


/* ============================
   CRITERIA CHECK FOR ONE ESSAY
   ============================ */

%% check_essay_against_criteria(+EssayText, +Criteria, -Results) is det.
%
%  Criteria: [criterion(Skill, RequiredStatus), ...]
%  Results:  [result(Skill, RequiredStatus, ActualStatus, Outcome), ...]
%
%  Outcome is one of:
%    - ok          : ActualStatus = RequiredStatus
%    - needs_work  : otherwise
%
check_essay_against_criteria(EssayText, Criteria, Results) :-
    essay_zpd(EssayText, ZPDPlan),
    maplist(check_one_criterion(ZPDPlan), Criteria, Results).

check_one_criterion(ZPDPlan,
                    criterion(Skill, Required),
                    result(Skill, Required, Actual, Outcome)) :-
    (   member(zpd(Skill, Actual, _), ZPDPlan)
    ->  true
    ;   Actual = unknown
    ),
    (   Actual = Required
    ->  Outcome = ok
    ;   Outcome = needs_work
    ).
    
    
    
/* ==================================
   CRITERIA CHECKER FOR MANY STUDENTS
   ================================== */

%% evaluate_students_for_criteria(+StudentNames, +Criteria, -Reports) is det.
%
%  StudentNames: [lucian, alex, ...]
%  Criteria:     list of criterion/2 terms
%  Reports:      [student_report(Name, Results), ...]
%
evaluate_students_for_criteria(StudentNames, Criteria, Reports) :-
    maplist(evaluate_one_student(Criteria), StudentNames, Reports).

evaluate_one_student(Criteria, StudentName, student_report(StudentName, Results)) :-
    student(StudentName, EssayText),
    check_essay_against_criteria(EssayText, Criteria, Results).

%% evaluate_all_students(+Criteria, -Reports) is det.
%
%  Convenience: run on every student/2 in the DB.
%
evaluate_all_students(Criteria, Reports) :-
    findall(Name, student(Name, _), Names),
    evaluate_students_for_criteria(Names, Criteria, Reports).
    
    
    
    
/* ======================
   PRETTY PRINTING REPORT
   ====================== */

print_student_reports([]).
print_student_reports([student_report(Name, Results)|Rest]) :-
    format("~n===============================~n", []),
    format("Student: ~w~n", [Name]),
    print_criteria_results(Results),
    print_student_reports(Rest).

print_criteria_results([]).
print_criteria_results([result(Skill, Required, Actual, Outcome)|Rest]) :-
    format("  Skill: ~w~n", [Skill]),
    format("    Required: ~w~n", [Required]),
    format("    Actual:   ~w~n", [Actual]),
    format("    Outcome:  ~w~n", [Outcome]),
    print_criteria_results(Rest).        