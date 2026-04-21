function varargout = curve1(varargin)
% CURVE1 MATLAB code for curve1.fig
%      CURVE1, by itself, creates a new CURVE1 or raises the existing
%      singleton*.
%
%      H = CURVE1 returns the handle to a new CURVE1 or the handle to
%      the existing singleton*.
%
%      CURVE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CURVE1.M with the given input arguments.
%
%      CURVE1('Property','Value',...) creates a new CURVE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before curve1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to curve1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help curve1

% Last Modified by GUIDE v2.5 09-Jun-2023 17:17:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @curve1_OpeningFcn, ...
                   'gui_OutputFcn',  @curve1_OutputFcn, ...
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


% --- Executes just before curve1 is made visible.
function curve1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to curve1 (see VARARGIN)

% Choose default command line output for curve1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes curve1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = curve1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
x = linspace(-5, 5, 100);
y = (1/(2*pi)) * exp(-x.^2/2);
plot(handles.axes1, x, y, 'b');
title(handles.axes1, 'y=(1/2pi)*e^(-x^2/2)');
xlabel(handles.axes1, 'x');
ylabel(handles.axes1, 'y');
grid(handles.axes1, 'on');

% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
cla(handles.axes1);

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
t = linspace(-1, 1, 100);
x = t.^2;
y = 5 * t.^3;
plot(handles.axes1, x, y, 'r');
title(handles.axes1, 'x=t^2, y=5*t^3');
xlabel(handles.axes1, 'x');
ylabel(handles.axes1, 'y');
grid(handles.axes1, 'on');

% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
