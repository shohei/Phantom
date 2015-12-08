function varargout = dashboard(varargin)
% DASHBOARD MATLAB code for dashboard.fig
%      DASHBOARD, by itself, creates a new DASHBOARD or raises the existing
%      singleton*.
%
%      H = DASHBOARD returns the handle to a new DASHBOARD or the handle to
%      the existing singleton*.
%
%      DASHBOARD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DASHBOARD.M with the given input arguments.
%
%      DASHBOARD('Property','Value',...) creates a new DASHBOARD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dashboard_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dashboard_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dashboard

% Last Modified by GUIDE v2.5 08-Dec-2015 20:57:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @dashboard_OpeningFcn, ...
    'gui_OutputFcn',  @dashboard_OutputFcn, ...
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

% --- Executes just before dashboard is made visible.
function dashboard_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dashboard (see VARARGIN)

% Choose default command line output for dashboard
handles.output = hObject;

% declare global variable
handles.D = 0.3; % Distance between 2 slider of the pair
handles.lc = 1.1; % Length of rod
handles.rb = 1; % Distance between origin and actuator on X-Y plane
handles.re = 0.4; % Radius of table

% initialize EditText
set(handles.edit_D,'String',num2str(handles.D));
set(handles.edit_lc,'String',num2str(handles.lc));
set(handles.edit_rb,'String',num2str(handles.rb));
set(handles.edit_re,'String',num2str(handles.re));

set(handles.slider_D,'Value',handles.D);
set(handles.slider_lc,'Value',handles.lc);
set(handles.slider_rb,'Value',handles.rb);
set(handles.slider_re,'Value',handles.re);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dashboard wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = dashboard_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function edit_D_Callback(hObject, eventdata, handles)
% hObject    handle to edit_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_D as text
%        str2double(get(hObject,'String')) returns contents of edit_D as a double

% --- Executes during object creation, after setting all properties.
function edit_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%set(hObject,'String',num2str(handles.D));

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String','hoge');


function edit_lc_Callback(hObject, eventdata, handles)
% hObject    handle to edit_lc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_lc as text
%        str2double(get(hObject,'String')) returns contents of edit_lc as a double


% --- Executes during object creation, after setting all properties.
function edit_lc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_lc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_rb_Callback(hObject, eventdata, handles)
% hObject    handle to edit_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_rb as text
%        str2double(get(hObject,'String')) returns contents of edit_rb as a double

% --- Executes during object creation, after setting all properties.
function edit_rb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_re_Callback(hObject, eventdata, handles)
% hObject    handle to edit_re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_re as text
%        str2double(get(hObject,'String')) returns contents of edit_re as a double


% --- Executes during object creation, after setting all properties.
function edit_re_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
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
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% P = [0.1,0.2,1.1]; % Position Vector of the end effector
% phi = pi/12; % rotation around X axis
% theta = pi/12; % rotation around Y axis
% psi = pi/16; % rotation around Z axis
% main(P,phi,theta,psi);
n_time = 20;
for i_time=1:n_time
    P = [0.1-i_time/200,0.2+i_time/200,1.1]; % Position Vector of the end effector
    phi = pi/12*(i_time/10); % rotation around X axis
    theta = pi/12*(i_time/10); % rotation around Y axis
    psi = pi/16*(i_time/10); % rotation around Z axis
    main(P,phi,theta,psi);
    msg = sprintf(strcat('%d frame elapsed\n',...
        'x-angle: %.2f.[rad]\n',...
        'y-angle: %.2f.[rad]\n',...
        'z-angle: %.2f.[rad]\n'),i_time,phi,theta,psi);
    
    msg2 = sprintf(strcat('%d frame elapsed\n',...
        'x-angle: %.2f.[rad]\n',...
        'y-angle: %.2f.[rad]\n',...
        'z-angle: %.2f.[rad]\n'),i_time,phi,theta,psi);
    
    uicontrol('Style', 'text',...
        'String', msg,... %replace something with the text you want
        'Units','normalized',...
        'FontSize', 10,....
        'FontName','OCR A Std',...
        'HorizontalAlignment','left',...
        'Max',5,...
        'Position', [0.02 0.85 0.2 0.15]);
    
    uicontrol('Style', 'text',...
        'String', msg2,... %replace something with the text you want
        'Units','normalized',...
        'FontSize', 10,....
        'FontName','OCR A Std',...
        'HorizontalAlignment','left',...
        'Max',5,...
        'Position', [0.4 0.85 0.2 0.15]);
        
    drawnow;
end


% --- Executes on slider movement.
function slider_D_Callback(hObject, eventdata, handles)
% hObject    handle to slider_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.slider_D = get(hObject,'Value');
set(handles.edit_D,'String',num2str(handles.slider_D));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider_D_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_lc_Callback(hObject, eventdata, handles)
% hObject    handle to slider_lc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.slider_lc = get(hObject,'Value');
set(handles.edit_lc,'String',num2str(handles.slider_lc));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider_lc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_lc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function slider_rb_Callback(hObject, eventdata, handles)
% hObject    handle to slider_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.slider_rb = get(hObject,'Value');
set(handles.edit_rb,'String',num2str(handles.slider_rb));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider_rb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_rb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider_re_Callback(hObject, eventdata, handles)
% hObject    handle to slider_re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.slider_re = get(hObject,'Value');
set(handles.edit_re,'String',num2str(handles.slider_re));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function slider_re_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_re (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
