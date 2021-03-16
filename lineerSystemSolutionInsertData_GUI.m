function varargout = lineerSystemSolutionInsertData_GUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lineerSystemSolutionInsertData_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @lineerSystemSolutionInsertData_GUI_OutputFcn, ...
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

function lineerSystemSolutionInsertData_GUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = lineerSystemSolutionInsertData_GUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

global say m n data L U;
say=0;
n=0;
m=0;
data=[];


function mValue_Callback(hObject, eventdata, handles)

function mValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function resValue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function resValue_Callback(hObject, eventdata, handles)

function insertValue_Callback(hObject, eventdata, handles)

global n m;

m=str2double(get(handles.mValue,'string'));

if(m>=60)
    f=msgbox('Maksimum Göz sayýsýndan fazla, göz sayýsý girildi!!!');
    error('Maksimum Göz sayýsýndan fazla, göz sayýsý girildi!!!');
end
n=2*m-1;
set(handles.nValue,'string',n);

set(handles.insertValue,'visible','off');
set(handles.dataTable,'visible','on');
set(handles.resValue,'visible','on');
set(handles.insertResValue,'visible','on');

function insertResValue_Callback(hObject, eventdata, handles)

global say n data;
say=say+1;   

res=str2double(get(handles.resValue,'string'));

data(say,1)=say;
data(say,2)=res;

set(handles.dataTable,'data',data);

if(say==n)
    f=msgbox('Direnç deðer giriþi tamamlanmýþtýr.');
    set(handles.insertResValue,'visible','off');
    set(handles.resValue,'visible','off');
    set(handles.goCalculate,'visible','on');
end

function goCalculate_Callback(hObject, eventdata, handles)

global L U;
global data m;

resistance=data(:,2);

A=createCircuit(m,resistance);

[L,U]=LU_Doolittle(A);

LineerSystemSolution_GUI;
