function varargout = Cholesky_GUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Cholesky_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Cholesky_GUI_OutputFcn, ...
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

function Cholesky_GUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = Cholesky_GUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

resim=imread('Devre.jpg');
imshow(resim);


function calculate_Callback(hObject, eventdata, handles)

global data m;
resistance=data(:,2);

A=createCircuit(m,resistance);

set(handles.circuitResMatrix,'data',A);

[L,U]=LU_Cholesky(A);

set(handles.Lmatrix,'data',L);
set(handles.Umatrix,'data',U);
