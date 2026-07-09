:- use_module(library(pce)).
:- dynamic pixel/3. % Tracks pixel(X, Y, Color)

% ==========================================
% 1. GLOBAL CONFIGURATION CONSTANTS
% ==========================================
canvas_size(16).        % 16x16 Grid
pixel_display_size(30). % Each virtual pixel is a 30x30 screen pixel
default_color(white).   % Default blank canvas color

% ==========================================
% 2. STATE INITIALISATION
% ==========================================
init_pixel_db :-
    retractall(pixel(_, _, _)),
    canvas_size(Size),
    default_color(DefColor),
    forall(between(1, Size, X),
           forall(between(1, Size, Y),
                  assertz(pixel(X, Y, DefColor)))).

% ==========================================
% 3. SAVE / LOAD FUNCTIONS
% ==========================================
save_canvas(Filename) :-
    open(Filename, write, Stream),
    with_output_to(Stream, (
        forall(pixel(X, Y, Color), 
               format('pixel(~q, ~q, ~q).~n', [X, Y, Color]))
    )),
    close(Stream),
    send(@sandbox, inform, string('Canvas successfully saved to %s', Filename)).

load_canvas(Filename, Frame) :-
    exists_file(Filename),
    !,
    retractall(pixel(_, _, _)),
    open(Filename, read, Stream),
    read_facts(Stream),
    close(Stream),
    send(@sandbox, inform, string('Canvas loaded from %s', Filename)),
    refresh_all_ui_boxes(Frame).
load_canvas(Filename, _) :-
    send(@sandbox, report, error, string('File %s not found!', Filename)).

read_facts(Stream) :-
    read(Stream, Term),
    (   Term == end_of_file
    ->  true
    ;   assertz(Term),
        read_facts(Stream)
    ).

% ==========================================
% 4. XPCE GRAPHICAL GUI ENGINE
% ==========================================

start :-
    init_pixel_db,
    
    canvas_size(GridSize),
    pixel_display_size(PxSize),
    CanvasWidth is GridSize * PxSize,
    CanvasHeight is GridSize * PxSize,
    
    % 1. Create main window structure
    new(Frame, frame('Prolog Fine Arts Mouse Editor')),
    send(Frame, name, sandbox), 
    
    new(Canvas, window('Canvas', size(CanvasWidth, CanvasHeight))),
    send(Canvas, name, canvas_view), 
    send(Canvas, scrollbars, none),

    % 2. Create control panel dialog toolbar
    new(Dialog, dialog('Toolbar')),
    
    % Active drawing color tracking register variable
    new(@current_paint_color, var(value := red)),
    
    % Build Palette row buttons explicitly to guarantee distinct code blocks
    send(Dialog, append, label(palette_lbl, 'Color Palette: ')),
    send(Dialog, append, button(red,     message(@current_paint_color, value, red))),
    send(Dialog, append, button(green,   message(@current_paint_color, value, green))),
    send(Dialog, append, button(blue,    message(@current_paint_color, value, blue))),
    send(Dialog, append, button(yellow,  message(@current_paint_color, value, yellow))),
    send(Dialog, append, button(magenta, message(@current_paint_color, value, magenta))),
    send(Dialog, append, button(cyan,    message(@current_paint_color, value, cyan))),
    send(Dialog, append, button(black,   message(@current_paint_color, value, black))),
    send(Dialog, append, button(white,   message(@current_paint_color, value, white))),
    
    % Control Options 
    send(Dialog, append, label(io_lbl, ' | File Actions: ')),
    send(Dialog, append, button(save, message(@prolog, gui_save_prompt))),
    send(Dialog, append, button(load, message(@prolog, gui_load_prompt, Frame))),
    send(Dialog, append, button(clear, message(@prolog, gui_clear_canvas, Frame))),

    % 3. Build the clickable grid squares matrix layout dynamically
    forall(pixel(X, Y, Color), (
        PosX is (X - 1) * PxSize,
        PosY is (Y - 1) * PxSize,
        
        new(Box, box(PxSize, PxSize)),
        send(Box, fill, colour(Color)),
        send(Box, pen, 1),
        send(Box, colour, colour(dark_grey)),
        
        format(atom(BoxName), 'box_~w_~w', [X, Y]),
        send(Box, name, BoxName),
        
        send(Box, recogniser, 
             new(click_gesture(left, '', single, 
                               message(@prolog, click_pixel_action, Box, X, Y)))),
        
        send(Canvas, display, Box, point(PosX, PosY))
    )),

    % 4. Lock geometry layers into position frames
    send(Frame, append, Dialog),
    send(Canvas, below, Dialog),
    send(Frame, open).

% ==========================================
% 5. CLICK HANDLER ACTION ROUTINES
% ==========================================

click_pixel_action(BoxObj, X, Y) :-
    get(@current_paint_color, value, SelectedColor),
    retractall(pixel(X, Y, _)),
    assertz(pixel(X, Y, SelectedColor)),
    send(BoxObj, fill, colour(SelectedColor)).

% ==========================================
% 6. COMPLETE INTERFACE MATRIX REFRESHERS
% ==========================================

refresh_all_ui_boxes(Frame) :-
    get(Frame, member, canvas_view, Canvas),
    forall(pixel(X, Y, Color), (
        format(atom(BoxName), 'box_~w_~w', [X, Y]),
        get(Canvas, member, BoxName, BoxObj),
        (   BoxObj \== @nil
        ->  send(BoxObj, fill, colour(Color))
        ;   true
        )
    )).

% ==========================================
% 7. GUI DIALOG BOX INTERFACE ACTION WRAPPERS
% ==========================================
gui_save_prompt :-
    new(D, dialog('Save File As')),
    send(D, append, new(F, text_item(filename, 'my_art.txt'))),
    send(D, append, button(ok, message(D, return, F?selection))),
    send(D, append, button(cancel, message(D, return, @nil))),
    get(D, confirm, Answer),
    send(D, destroy),
    Answer \== @nil,
    save_canvas(Answer).

gui_load_prompt(Frame) :-
    new(D, dialog('Load Art File')),
    send(D, append, new(F, text_item(filename, 'my_art.txt'))),
    send(D, append, button(ok, message(D, return, F?selection))),
    send(D, append, button(cancel, message(D, return, @nil))),
    get(D, confirm, Answer),
    send(D, destroy),
    Answer \== @nil,
    load_canvas(Answer, Frame).

gui_clear_canvas(Frame) :-
    init_pixel_db,
    refresh_all_ui_boxes(Frame).
