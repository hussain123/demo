function varargout = CompareImages(varargin)
% COMPAREIMAGES MATLAB code for CompareImages.fig
%      COMPAREIMAGES, by itself, creates a new COMPAREIMAGES or raises the existing
%      singleton*.
%
%      H = COMPAREIMAGES returns the handle to a new COMPAREIMAGES or the handle to
%      the existing singleton*.
%
%      COMPAREIMAGES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPAREIMAGES.M with the given input arguments.
%
%      COMPAREIMAGES('Property','Value',...) creates a new COMPAREIMAGES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CompareImages_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CompareImages_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CompareImages

% Last Modified by GUIDE v2.5 10-Dec-2015 04:17:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CompareImages_OpeningFcn, ...
                   'gui_OutputFcn',  @CompareImages_OutputFcn, ...
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


% --- Executes just before CompareImages is made visible.
function CompareImages_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CompareImages (see VARARGIN)

% Choose default command line output for CompareImages
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CompareImages wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CompareImages_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2 
[path,user_cancel] = imgetfile();
if user_cancel
    msgbox(sprinf('Error'),'Error','Error');
    return
end
im = imread(path);

 im2 = im;
im = im2double(im);
im2 = im; % for backup process
axes(handles.axes1);
imshow(im);


function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im3 
 
[path,user_cancel] = imgetfile();
if user_cancel
    msgbox(sprinf('Error'),'Error','Error');
    return
end
im = imread(path);

im = im2double(im);
im3 = im; % for backup process

axes(handles.axes2);
imshow(im);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles= guidata(hObject);

img1 = getimage(handles.axes1);
img2 = getimage(handles.axes2);
axes(handles.axes3);
imshowpair(img1,img2,'blend','Scaling','joint');
 
% axes(handles.axes3);
% imshow(result);
    
    







