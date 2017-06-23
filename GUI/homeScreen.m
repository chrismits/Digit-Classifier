function varargout = homeScreen(varargin)
% Last Modified by GUIDE v2.5 10-May-2017 22:54:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homeScreen_OpeningFcn, ...
                   'gui_OutputFcn',  @homeScreen_OutputFcn, ...
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

% --- Executes just before homeScreen is made visible.
function homeScreen_OpeningFcn(hObject, eventdata, handles, varargin)
%Built in Matlab GUI operations done here 
handles.output = hObject;
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = homeScreen_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

%WHAT I HAVE DONE STARTS HERE

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
run('singlegui.m')

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%Open next GUI
run('testing.m')
