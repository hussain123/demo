function varargout = TestApplication(varargin)
% TESTAPPLICATION MATLAB code for TestApplication.fig
%      TESTAPPLICATION, by itself, creates a new TESTAPPLICATION or raises the existing
%      singleton*.
%
%      H = TESTAPPLICATION returns the handle to a new TESTAPPLICATION or the handle to
%      the existing singleton*.
%
%      TESTAPPLICATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TESTAPPLICATION.M with the given input arguments.
%
%      TESTAPPLICATION('Property','Value',...) creates a new TESTAPPLICATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TestApplication_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TestApplication_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TestApplication

% Last Modified by GUIDE v2.5 30-Nov-2015 05:46:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TestApplication_OpeningFcn, ...
                   'gui_OutputFcn',  @TestApplication_OutputFcn, ...
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


% --- Executes just before TestApplication is made visible.
function TestApplication_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TestApplication (see VARARGIN)

% Choose default command line output for TestApplication
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TestApplication wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TestApplication_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% replace your images here
handles= guidata(hObject);

img1 = getimage(handles.axes1);
img2 = getimage(handles.axes2);
% img3 = imread('images/example_2/image_3.jpg');
% img4 = imread('images/example_2/image_4.jpg');

%% grayscaled
img1_gray = rgb2gray(img1);
img2_gray = rgb2gray(img2);

%black and white
img1_bw = im2bw(img1_gray);
img2_bw = im2bw(img2_gray);

% get array upper bounds
[x, y, z] = size(img1);

% initialize reconstructed image
reconstructed_img_bg = img1;
reconstructed_img_fg = zeros(x,y,z);

size(reconstructed_img_bg);

% imtool(reconstructed_img_bg)

oculuded1 = img2-img1;
oculuded2 = img1-img2;

% imtool(oculuded1)
% imtool(oculuded2)

for i=1:x
    for j=1:y
        
            if oculuded1(i,j,1) > 15 || oculuded1(i,j,2) > 0  || oculuded1(i,j,3) > 0 
                
                reconstructed_img_bg(i,j,1) = img2(i,j,1);
                reconstructed_img_bg(i,j,2) = img2(i,j,2);
                reconstructed_img_bg(i,j,3) = img2(i,j,3);
                
            elseif oculuded2(i,j,1) > 15 || oculuded2(i,j,2) >0   || oculuded2(i,j,3) > 0
                
                reconstructed_img_bg(i,j,1) = img1(i,j,1);
                reconstructed_img_bg(i,j,2) = img1(i,j,2);
                reconstructed_img_bg(i,j,3) = img1(i,j,3);
                
            end
                   
    end
end

axes(handles.axes3);
imshow(reconstructed_img_bg);



% figure; imshow(reconstructed_img_bg);
% figure('units','normalized','outerposition',[0 0 1 1])
% subplot(1,5,1),imshow(img1);title('Image 1 RGB')
% subplot(1,5,2),imshow(img2);title('Image 2 RGB')
% subplot(1,5,3),imshow(oculuded1);title('Ocluded region 1')
% subplot(1,5,4),imshow(oculuded2);title('Ocluded region 2')
% subplot(1,5,5),imshow(reconstructed_img_bg);title('Reconstructed Image')
% figure; imshow(reconstructed_img_bg);
% figure('units','normalized','outerposition',[0 0 1 1])
% subplot(1,5,1),imshow(img1);title('Image 1 RGB')
% subplot(1,5,2),imshow(img2);title('Image 2 RGB')
% subplot(1,5,3),imshow(oculuded1);title('Ocluded region 1')
% subplot(1,5,4),imshow(oculuded2);title('Ocluded region 2')
% subplot(1,5,5),imshow(reconstructed_img_bg);title('Reconstructed Image')


% figure; imshow(reconstructed_img_bg);
% figure('units','normalized','outerposition',[0 0 1 1])
% subplot(1,5,1),imshow(im2);title('Image 1 RGB')
% subplot(1,5,2),imshow(im3);title('Image 2 RGB')
% subplot(1,5,3),imshow(oculuded1);title('Ocluded region 1')
% subplot(1,5,4),imshow(oculuded2);title('Ocluded region 2')
% subplot(1,5,5),imshow(reconstructed_img_bg);title('Reconstructed Image')
