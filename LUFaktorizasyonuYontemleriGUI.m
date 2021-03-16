function varargout = LUFaktorizasyonuYontemleriGUI(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LUFaktorizasyonuYontemleriGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LUFaktorizasyonuYontemleriGUI_OutputFcn, ...
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

function LUFaktorizasyonuYontemleriGUI_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = LUFaktorizasyonuYontemleriGUI_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

resim=imread('Devre.jpg');
imshow(resim);

function doolittleGUI_Callback(hObject, eventdata, handles)

doolittleInsertData_GUI;

function croutGUI_Callback(hObject, eventdata, handles)

croutInsertData_GUI;

function choleskyGUI_Callback(hObject, eventdata, handles)

choleskyInsertData_GUI;

function lineerSystemSolution_Callback(hObject, eventdata, handles)

lineerSystemSolutionInsertData_GUI;
