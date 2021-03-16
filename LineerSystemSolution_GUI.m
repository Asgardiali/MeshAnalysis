function varargout = LineerSystemSolution_GUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LineerSystemSolution_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LineerSystemSolution_GUI_OutputFcn, ...
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

function LineerSystemSolution_GUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = LineerSystemSolution_GUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

resim=imread('Devre.jpg');
imshow(resim);

function v1_Callback(hObject, eventdata, handles)

function v1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function v2_Callback(hObject, eventdata, handles)

function v2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function calculateCurrent_Callback(hObject, eventdata, handles)

global m L U;
n=2*m-1;

data(1:m,1:2)=0;
v1=str2double(get(handles.v1,'string'));
v2=str2double(get(handles.v2,'string'));

b(1:m,1)=0;
b(1,1)=v1;
b(m,1)=v2;

x=LU_Solve(L,U,b);
[p q]=size(x);

for k=1:p
    data(k,1)=k;
    data(k,2)=x(k,1);
end

set(handles.dataTable,'data',data);
