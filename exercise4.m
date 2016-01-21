function varargout = exercise4(varargin)
% EXERCISE4 MATLAB code for exercise4.fig
%      EXERCIuSE3, by itself, creates a new EXERCISE4 or raises the existing
%      singleton*.
%
%      H = EXERCISE4 returns the handle to a new EXERCISE4 or the handle to
%      the existing singleton*.
%
%      EXERCISE4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EXERCISE4.M with the given input arguments.
%
%      EXERCISE4('Property','Value',...) creates a new EXERCISE4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before exercise4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to exercise4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help exercise4

% Last Modified by GUIDE v2.5 23-Nov-2015 22:56:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @exercise4_OpeningFcn, ...
                   'gui_OutputFcn',  @exercise4_OutputFcn, ...
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


% --- Executes just before exercise4 is made visible.
function exercise4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to exercise4 (see VARARGIN)

% Choose default command line output for exercise4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes exercise4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
guidata(hObject,handles);



% --- Outputs from this function are returned to the command line.
function varargout = exercise4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%Stop Button
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



%Start Button
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Read file from ui
%file = uigetfile;
file = 'Trainingsvideo.avi';
vid = VideoReader(file);

%Initialize axes1
axes(handles.axes1);
image(read(vid, 1));

%Initialize axes2
axes(handles.axes2);
image(read(vid, 1));

%Re-instantiate vid for using hasFrame after read
vid = VideoReader(file);

%Get handles
h1 = get(handles.axes1, 'Children');
h2 = get(handles.axes2, 'Children');
characters = getRefChars();
frameNo = 0;
totalFrames = vid.NumberOfFrames;

while frameNo < totalFrames
    frameNo = frameNo + 2;

    %Read frame
    frame = read(vid, frameNo);
    
    %Display frame in axes1
    set(h1, 'CData', frame)
    
    mask = Sobel(frame);
  
    %grootste object in RGB terug halen
   % object = bwpropfilt(mask,'Area', 1, 'largest');
   
    object3D = repmat(mask, [1,1,3]);
    frameDouble = im2double(frame);
    plate = object3D .* frameDouble;
    
    thres = graythresh(plate);
    image2 = im2bw(plate, thres);
    image2 = imclearborder(image2);
    [f, c]=find(image2);
    
    gray = rgb2gray(plate);
    gray=gray(min(f):max(f),min(c):max(c));
    
    res = zeros(2);
    if (sum(gray(:) > 0))
    [img, y] = threshold(gray, 'isodata', 2);
    res = ~im2bw(gray, y(2));
    end
    
    %readPlate(res, characters)
    %Display frame in axes2
    set(h2, 'CData', res*255)
    
    % pause(0.1);

end



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
%if(strcmp(handles.vid.Loggings, 'off'))
%    stop(handles.vid);
%end
delete(hObject);
