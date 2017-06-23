function varargout = testing(varargin)
% Last Modified by GUIDE v2.5 02-May-2017 20:07:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @testing_OpeningFcn, ...
                   'gui_OutputFcn',  @testing_OutputFcn, ...
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

% --- Executes just before testing is made visible.
function testing_OpeningFcn(hObject, eventdata, handles, varargin)
%Import workspace variables
handles.training = evalin('base', 'training');
handles.testing = evalin('base', 'testing');

% Choose default command line output for testing
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = testing_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in testbut.
function testbut_Callback(hObject, eventdata, handles)
set(handles.text7, 'string', 'Loading...')
pause(0.01)

%Convert user input to doubles 
Ntest = str2double(get(handles.test, 'string'));
Ntrain = str2double(get(handles.train, 'string'));
k = str2double(get(handles.kay, 'string'));

%Call necessary classifying function
cd ./knn
knnAll(handles.training, handles.testing, k, Ntest, Ntrain);
cd ../

%Read results from stats file
fid = fopen('stats.txt');
results = textscan(fid, '%s', 'Delimiter', '');

set(handles.text7, 'string', results{1});
fclose(fid);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%Get user input as double
Ntest = str2double(get(handles.test, 'string'));
Ntrain = str2double(get(handles.train, 'string'));

%Plot without knnGraph (Had problems adding it here, see powerpoint)
kVec = 1:2:Ntest;
accuracy = [];
set(handles.text7, 'string', 'Loading...')
pause(0.01)
cd ./knn

%Changing values of k
for k = kVec
    %Classify using knnAll
    acc = knnAll(handles.training, handles.testing, k, Ntest, Ntrain);
    accuracy = [accuracy acc];
end

cd ../
%Plotting
plot(kVec, accuracy)
xlabel('Value of k')
ylabel('Accuracy')
ylim([0 1])
title('Effect of k on classifier accuracy');

%Some helpful comments
temp = sprintf(['As seen on graph, accuracy decreases as k increases. '...
    'Accuracy tends to decrease less for larger training sets']);
set(handles.text7, 'string', temp);

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
delete(handles.second)


%THE REST IS MATLAB BUILT IN. DON'T EDIT!!!

function test_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function test_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function train_Callback(hObject, eventdata, handles)
% hObject    handle to train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of train as text
%        str2double(get(hObject,'String')) returns contents of train as a double


% --- Executes during object creation, after setting all properties.
function train_CreateFcn(hObject, eventdata, handles)
% hObject    handle to train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function kay_Callback(hObject, eventdata, handles)
% hObject    handle to kay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of kay as text
%        str2double(get(hObject,'String')) returns contents of kay as a double


% --- Executes during object creation, after setting all properties.
function kay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to kay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
