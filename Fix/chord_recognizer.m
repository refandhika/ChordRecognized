function varargout = chord_recognizer(varargin)
% CHORD_RECOGNIZER MATLAB code for chord_recognizer.fig
%      CHORD_RECOGNIZER, by itself, creates a new CHORD_RECOGNIZER or raises the existing
%      singleton*.
%
%      H = CHORD_RECOGNIZER returns the handle to a new CHORD_RECOGNIZER or the handle to
%      the existing singleton*.
%
%      CHORD_RECOGNIZER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHORD_RECOGNIZER.M with the given input arguments.
%
%      CHORD_RECOGNIZER('Property','Value',...) creates a new CHORD_RECOGNIZER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chord_recognizer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chord_recognizer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chord_recognizer

% Last Modified by GUIDE v2.5 02-Jul-2015 08:55:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chord_recognizer_OpeningFcn, ...
                   'gui_OutputFcn',  @chord_recognizer_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before chord_recognizer is made visible.
function chord_recognizer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chord_recognizer (see VARARGIN)

set(handles.chord,'String', 'Chord X');

% Choose default command line output for chord_recognizer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chord_recognizer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chord_recognizer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in recordbutton.
function recordbutton_Callback(hObject, eventdata, handles)
% hObject    handle to recordbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Fs = 11000;
new_signal = wavrecord(3*Fs,Fs);
new_signal = preprocessing(new_signal);
new_signal = mfcc(new_signal);
new_signal = mean(new_signal');
v = evalin('base', 'lvqnya');
for outpu = 1 : 24
	for kof = 1 : 13
		inputnya = new_signal(kof);
		bobotmax = v{outpu}(kof,3);
		bobotmid = v{outpu}(kof,2);
		bobotmin = v{outpu}(kof,1);
		if inputnya <= bobotmax && inputnya >= bobotmid
			sim_dim(kof) = (inputnya - bobotmax) / (bobotmid - bobotmax);
		elseif inputnya < bobotmid && inputnya >= bobotmin
			sim_dim(kof) = (inputnya - bobotmin) / (bobotmid - bobotmin);
		else
			sim_dim(kof) = 0;
		end
	end
	sim_out(outpu) = min(sim_dim);
end
[besar, pemenang] = max(sim_out);

if pemenang == 1
	set(handles.chord,'String', 'Chord A');
elseif pemenang == 2
	set(handles.chord,'String', 'Chord Am');
elseif pemenang == 3
	set(handles.chord,'String', 'Chord A#');
elseif pemenang == 4
	set(handles.chord,'String', 'Chord A#m');
elseif pemenang == 5
	set(handles.chord,'String', 'Chord B');
elseif pemenang == 6
	set(handles.chord,'String', 'Chord Bm');
elseif pemenang == 7
	set(handles.chord,'String', 'Chord C');
elseif pemenang == 8
	set(handles.chord,'String', 'Chord Cm');
elseif pemenang == 9
	set(handles.chord,'String', 'Chord C#');
elseif pemenang == 10
	set(handles.chord,'String', 'Chord C#m');
elseif pemenang == 11
	set(handles.chord,'String', 'Chord D');
elseif pemenang == 12
	set(handles.chord,'String', 'Chord Dm');
elseif pemenang == 13
	set(handles.chord,'String', 'Chord D#');
elseif pemenang == 14
	set(handles.chord,'String', 'Chord D#m');
elseif pemenang == 15
	set(handles.chord,'String', 'Chord E');
elseif pemenang == 16
	set(handles.chord,'String', 'Chord Em');
elseif pemenang == 17
	set(handles.chord,'String', 'Chord F');
elseif pemenang == 18
	set(handles.chord,'String', 'Chord Fm');
elseif pemenang == 19
	set(handles.chord,'String', 'Chord F#');
elseif pemenang == 20
	set(handles.chord,'String', 'Chord F#m');
elseif pemenang == 21
	set(handles.chord,'String', 'Chord G');
elseif pemenang == 22
	set(handles.chord,'String', 'Chord Gm');
elseif pemenang == 23
	set(handles.chord,'String', 'Chord G#');
elseif pemenang == 24
	set(handles.chord,'String', 'Chord G#m');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.chord,'String', 'Chord X');
