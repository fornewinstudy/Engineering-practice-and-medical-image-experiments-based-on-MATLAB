function varargout = Curve_cjh(varargin)
% CURVE_CJH MATLAB code for Curve_cjh.fig
%      CURVE_CJH, by itself, creates a new CURVE_CJH or raises the existing
%      singleton*.
%
%      H = CURVE_CJH returns the handle to a new CURVE_CJH or the handle to
%      the existing singleton*.
%
%      CURVE_CJH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CURVE_CJH.M with the given input arguments.
%
%      CURVE_CJH('Property','Value',...) creates a new CURVE_CJH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Curve_cjh_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Curve_cjh_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Curve_cjh

% Last Modified by GUIDE v2.5 09-Jun-2023 18:04:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Curve_cjh_OpeningFcn, ...
                   'gui_OutputFcn',  @Curve_cjh_OutputFcn, ...
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


% --- Executes just before Curve_cjh is made visible.
function Curve_cjh_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Curve_cjh (see VARARGIN)

% Choose default command line output for Curve_cjh
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Curve_cjh wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Curve_cjh_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
cla(handles.axes1);
cla(handles.axes2);
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
x = linspace(-5, 5, 100);
y = (1/(2*pi)) * exp(-x.^2/2);
plot(handles.axes1, x, y, 'b');
title(handles.axes1, 'y=(1/2pi)*e^(-x^2/2)');
xlabel(handles.axes1, 'x');
ylabel(handles.axes1, 'y');
grid(handles.axes1, 'on');
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
t = linspace(-1, 1, 100);
x = t.^2;
y = 5 * t.^3;
plot(handles.axes2, x, y, 'r');
title(handles.axes2, 'x=t^2, y=5*t^3');
xlabel(handles.axes2, 'x');
ylabel(handles.axes2, 'y');
grid(handles.axes2, 'on');

% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
