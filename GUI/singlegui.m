function varargout = singlegui(varargin)
% Last Modified by GUIDE v2.5 03-May-2017 13:27:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @singlegui_OpeningFcn, ...
                   'gui_OutputFcn',  @singlegui_OutputFcn, ...
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


% --- Executes just before singlegui is made visible.
function singlegui_OpeningFcn(hObject, eventdata, handles, varargin)
%Imports workspace variables
handles.training = evalin('base', 'training');
handles.testing = evalin('base', 'testing');

%Reads image
img = imread('digits.png');
handles.img = img;
imshow(img);
set(handles.status, 'string', ['Select a number' ...
    ' from this image using select']);

% Choose default command line output for singlegui
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = singlegui_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in select.
function select_Callback(hObject, eventdata, handles)
% hObject    handle to select (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s = 'Box your choice, right click ON the box';
s2 = ' and press crop image,';
s3 = ' then press View Cropped Image. If you want to retry, press reset';
set(handles.status, 'string',[s s2 s3]);

%Crop image
imgCrop = imcrop(handles.img);
handles.img = imgCrop;
guidata(hObject, handles)

% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)
%Show cropped image
img = handles.img;
imshow(img);
set(handles.status, 'string', 'Classify it by pressing Classify');

% --- Executes on button press in classify.
function classify_Callback(hObject, eventdata, handles)
% hObject    handle to classify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.status, 'string', 'Classifying...')
pause(0.01)
img = handles.img;

%Call classification function
k = 5;
cd ./knn
classif = knnSingle(handles.training, img, k);
cd ../

set(handles.result, 'string', classif)
s = sprintf('Classified. If wrong, try another example.');
d = sprintf(' For best results, choose clearly identifiable numbers.');
f = sprintf(' Note that classifier has been optimized for images of dataset');
g = sprintf(' which is why accuracy here is lower than in dataset');
set(handles.status, 'string', [s d f g]);

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(handles.single);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Revert Back to original layout
img = imread('digits.png');
imshow(img);
handles.img = img;
set(handles.result, 'string', ' ');
set(handles.status, 'string', ['Either load an image or select a number' ...
    ' from this image using select']);
guidata(hObject, handles);
