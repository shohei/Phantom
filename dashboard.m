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

% Last Modified by GUIDE v2.5 09-Dec-2015 15:33:41

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

% Declare global variable
handles.final_D = 70; % Distance between 2 slider of the pair
handles.final_lc = 580; % Length of rod
handles.final_rb = 500; % Distance between origin and actuator on X-Y plane
handles.final_re = 200; % Radius of table
handles.final_Pz = 800;
handles.final_ls = 700;

% Initialize instance variable
handles.D = handles.final_D; % Distance between 2 slider of the pair
handles.lc = handles.final_lc; % Length of rod
handles.rb = handles.final_rb; % Distance between origin and actuator on X-Y plane
handles.re = handles.final_re; % Radius of table
handles.Pz = handles.final_Pz;
handles.ls = handles.final_ls;

% initialize EditText
set(handles.edit_D,'String',num2str(handles.D));
set(handles.edit_lc,'String',num2str(handles.lc));
set(handles.edit_rb,'String',num2str(handles.rb));
set(handles.edit_re,'String',num2str(handles.re));
set(handles.edit_Pz,'String',num2str(handles.Pz));


% initialize Sliders
set(handles.slider_D,'Max',handles.D*2);
set(handles.slider_lc,'Max',handles.lc*2);
set(handles.slider_rb,'Max',handles.rb*2);
set(handles.slider_re,'Max',handles.re*2);
set(handles.slider_Pz,'Max',handles.Pz*2);

set(handles.slider_D,'Value',handles.D);
set(handles.slider_lc,'Value',handles.lc);
set(handles.slider_rb,'Value',handles.rb);
set(handles.slider_re,'Value',handles.re);
set(handles.slider_Pz,'Value',handles.Pz);

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
set(handles.slider_D,'Value',str2double(get(hObject,'String')));
guidata(hObject,handles);


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


function edit_lc_Callback(hObject, eventdata, handles)
% hObject    handle to edit_lc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_lc as text
%        str2double(get(hObject,'String')) returns contents of edit_lc as a double
set(handles.slider_lc,'Value',str2double(get(hObject,'String')));
guidata(hObject,handles);


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
set(handles.slider_rb,'Value',str2double(get(hObject,'String')));
guidata(hObject,handles);

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
set(handles.slider_re,'Value',str2double(get(hObject,'String')));
guidata(hObject,handles);


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

function edit_Pz_Callback(hObject, eventdata, handles)
% hObject    handle to edit_Pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_Pz as text
%        str2double(get(hObject,'String')) returns contents of edit_Pz as a double
set(handles.slider_Pz,'Value',str2double(get(hObject,'String')));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function edit_Pz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_Pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function slider_D_Callback(hObject, eventdata, handles)
% hObject    handle to slider_D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
D = get(hObject,'Value');
set(handles.slider_D,'Value',D);
set(handles.edit_D,'String',num2str(D));
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
lc = get(hObject,'Value');
set(handles.slider_lc,'Value',lc);
set(handles.edit_lc,'String',num2str(lc));
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
rb = get(hObject,'Value');
set(handles.slider_rb,'Value',rb);
set(handles.edit_rb,'String',num2str(rb));
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
re = get(hObject,'Value');
set(handles.slider_re,'Value',re);
set(handles.edit_re,'String',num2str(re));
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


% --- Executes on slider movement.
function slider_Pz_Callback(hObject, eventdata, handles)
% hObject    handle to slider_Pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
Pz = get(hObject,'Value');
set(handles.slider_Pz,'Value',Pz);
set(handles.edit_Pz,'String',num2str(Pz));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function slider_Pz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_Pz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in checkbox_debug.
function checkbox_debug_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_debug (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_debug
handles.checkbox_debug = get(hObject,'Value');
guidata(hObject,handles);


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


% --- Executes on button press in pushbutton_run.
function pushbutton_run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% P = [0.1,0.2,1.1]; % Position Vector of the end effector
% phi = pi/12; % rotation around X axis
% theta = pi/12; % rotation around Y axis
% psi = pi/16; % rotation around Z axis
% main(P,phi,theta,psi);

% D=handles.slider_D.Value;
% lc=handles.slider_lc.Value;
% rb=handles.slider_rb.Value;
% re=handles.slider_re.Value;
D=str2double(handles.edit_D.String);
lc=str2double(handles.edit_lc.String);
rb=str2double(handles.edit_rb.String);
re=str2double(handles.edit_re.String);
Pz=str2double(handles.edit_Pz.String);
ls = handles.ls;

check=handles.checkbox_debug;

n_time = 20;

clearDebugMessage();
rotate3d on;
for i_time=1:n_time
    P = [0.1-i_time/200,0.2+i_time/200,Pz]; % Position Vector of the end effector
    phi = pi/12*(i_time/10); % rotation around X axis
    theta = pi/12*(i_time/10); % rotation around Y axis
    psi = pi/16*(i_time/10); % rotation around Z axis
    C = main(D,lc,ls,rb,re,P,phi,theta,psi);
    if check==1
        showDebugMessage(i_time,phi,theta,psi,C);
    end
    drawnow;
end

function clearDebugMessage()
uicontrol('Style', 'text',...
    'String', '',...
    'Units','normalized',...
    'FontSize', 10,....
    'HorizontalAlignment','left',...
    'Max',5,...
    'Position', [0.02 0.85 0.2 0.15]);

uicontrol('Style', 'text',...
    'String', '',...
    'Units','normalized',...
    'FontSize', 10,....
    'HorizontalAlignment','left',...
    'Max',5,...
    'Position', [0.4 0.85 0.2 0.15]);

function showDebugMessage(i_time,phi,theta,psi,C)
msg = sprintf(strcat('%d frame elapsed\n',...
    'x-angle: %.2f[rad]\n',...
    'y-angle: %.2f[rad]\n',...
    'z-angle: %.2f[rad]\n'),i_time,phi,theta,psi);

msg2 = sprintf(strcat('Slider control\n',...
    'c1: %.2f, c2: %.2f\n',...
    'c3: %.2f, c4: %.2f\n',...
    'c5: %.2f, c6: %.2f\n'),C(1),C(2),C(3),C(4),C(5),C(6));

h1 = uicontrol('Style', 'text',...
    'String', msg,...
    'Units','normalized',...
    'FontSize', 10,...
    'HorizontalAlignment','left',...
    'Max',5,...
    'Position', [0.02 0.85 0.2 0.15]);

h2 = uicontrol('Style', 'text',...
    'String', msg2,...
    'Units','normalized',...
    'FontSize', 10,...
    'HorizontalAlignment','left',...
    'Max',5,...
    'Position', [0.4 0.85 0.2 0.15]);


% --- Executes on button press in pushbutton_loadfile.
function pushbutton_loadfile_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_loadfile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
    {'*.g;*.gcode;*.mc;*.txt;',...
    'G-code files (*.g,*.gcode,*.nc,*.txt)';
    '*.*',  'All Files (*.*)'}, ...
    'Select g-code file',getenv('HOME'));
if(filename)
    fullpath = sprintf('%s%s',pathname,filename);
    set(handles.edit_disp_filepath,'String',fullpath);
    
    fullpath = sprintf('%s%s',pathname,filename);
    fid = fopen(fullpath,'r');
    tline = fgets(fid);
    lines = [tline];
    while ischar(tline)
        lines = [lines tline];
        tline = fgets(fid);
    end
    fclose(fid);
    
%     msg = sprintf(strcat(...
%         'G-code comes here\n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n',...
%         'G1 X10 Y10 Z10 \n'));

    progressDlg = waitbar(0.8,'Loading... Please wait.');% sorry, it's a bluff!
    set(handles.edit_disp_gcode,'String',lines);
    close(progressDlg); 
    
    handles.gcode = lines;
    
    guidata(hObject,handles);
end


function edit_disp_gcode_Callback(hObject, eventdata, handles)
% hObject    handle to edit_disp_gcode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_disp_gcode as text
%        str2double(get(hObject,'String')) returns contents of edit_disp_gcode as a double


% --- Executes during object creation, after setting all properties.
function edit_disp_gcode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_disp_gcode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_disp_filepath_Callback(hObject, eventdata, handles)
% hObject    handle to edit_disp_filepath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_disp_filepath as text
%        str2double(get(hObject,'String')) returns contents of edit_disp_filepath as a double


% --- Executes during object creation, after setting all properties.
function edit_disp_filepath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_disp_filepath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton_set_default.
function pushbutton_set_default_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_set_default (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit_D,'String',num2str(handles.final_D));
set(handles.edit_lc,'String',num2str(handles.final_lc));
set(handles.edit_rb,'String',num2str(handles.final_rb));
set(handles.edit_re,'String',num2str(handles.final_re));
set(handles.edit_Pz,'String',num2str(handles.final_Pz));
set(handles.slider_D,'Value',handles.D);
set(handles.slider_lc,'Value',handles.lc);
set(handles.slider_rb,'Value',handles.rb);
set(handles.slider_re,'Value',handles.re);
set(handles.slider_Pz,'Value',handles.Pz);
guidata(hObject,handles);


% --------------------------------------------------------------------
function m_file_Callback(hObject, eventdata, handles)
% hObject    handle to m_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_about_phantom_Callback(hObject, eventdata, handles)
% hObject    handle to m_about_phantom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
about();

% --------------------------------------------------------------------
function m_window_Callback(hObject, eventdata, handles)
% hObject    handle to m_window (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_help_Callback(hObject, eventdata, handles)
% hObject    handle to m_help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_preferences_Callback(hObject, eventdata, handles)
% hObject    handle to m_preferences (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_quit_Callback(hObject, eventdata, handles)
% hObject    handle to m_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_check_update_Callback(hObject, eventdata, handles)
% hObject    handle to m_check_update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_minimize_Callback(hObject, eventdata, handles)
% hObject    handle to m_minimize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_zoom_Callback(hObject, eventdata, handles)
% hObject    handle to m_zoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_full_screen_Callback(hObject, eventdata, handles)
% hObject    handle to m_full_screen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
