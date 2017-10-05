function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 05-Oct-2017 14:51:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% -STRÄNG 1
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;
refHz = 329.6;  
mPH = 0.6;  
[string, fs] = audioread('ljudfiler\2nd_String_B.mp3');
mPH = 0.8;
%calculate frequency using autocorrelation
Hz = autocorr(string, fs, mPH);

%plot ref-frequency & recorded frequency
t= 0:0.01:10;    
plot(t,ones(size(t))*refHz, '-g');
hold on
plot(t,ones(size(t))*Hz, '-r')
xlim([0 10])
ylim([refHz-500 refHz+500])


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;
refHz = 246.9; 
mPH = 0.85;

[string, fs] = audioread('ljudfiler\2nd_String_B.mp3');
mPH = 0.8;

%calculate frequency using autocorrelation
Hz = autocorr(string, fs, mPH);

%plot ref-frequency & recorded frequency
t= 0:0.01:10;    
plot(t,ones(size(t))*refHz, '-g');
hold on
plot(t,ones(size(t))*Hz, '-r')
xlim([0 10])
ylim([refHz-500 refHz+500])

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;
refHz = 196;    
mPH = 0.8; 

[string, fs] = audioread('ljudfiler\2nd_String_B.mp3');
mPH = 0.8;

%calculate frequency using autocorrelation
Hz = autocorr(string, fs, mPH);

%plot ref-frequency & recorded frequency
t= 0:0.01:10;    
plot(t,ones(size(t))*refHz, '-g');
hold on
plot(t,ones(size(t))*Hz, '-r')
xlim([0 10])
ylim([refHz-500 refHz+500])

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;
refHz = 146.8;  
mPH = 0.7;  

[string, fs] = audioread('ljudfiler\2nd_String_B.mp3');
mPH = 0.8;

%calculate frequency using autocorrelation
Hz = autocorr(string, fs, mPH);

%plot ref-frequency & recorded frequency
t= 0:0.01:10;    
plot(t,ones(size(t))*refHz, '-g');
hold on
plot(t,ones(size(t))*Hz, '-r')
xlim([0 10])
ylim([refHz-500 refHz+500])

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;
refHz = 110;    
mPH = 0.75;

[string, fs] = audioread('ljudfiler\2nd_String_B.mp3');
mPH = 0.8;

%calculate frequency using autocorrelation
Hz = autocorr(string, fs, mPH);

%plot ref-frequency & recorded frequency
t= 0:0.01:10;    
plot(t,ones(size(t))*refHz, '-g');
hold on
plot(t,ones(size(t))*Hz, '-r')
xlim([0 10])
ylim([refHz-500 refHz+500])

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla reset;
refHz = 82.4; 
mPH = 0.8;

[string, fs] = audioread('ljudfiler\2nd_String_B.mp3');
mPH = 0.8;

%calculate frequency using autocorrelation
Hz = autocorr(string, fs, mPH);

%plot ref-frequency & recorded frequency
t= 0:0.01:10;    
plot(t,ones(size(t))*refHz, '-g');
hold on
plot(t,ones(size(t))*Hz, '-r')
xlim([0 10])
ylim([refHz-500 refHz+500])


