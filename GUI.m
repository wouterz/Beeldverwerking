function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 16-Dec-2015 09:38:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @GUI_OpeningFcn, ...
    'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
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

%Read file
file = uigetfile('*.avi');
vid = VideoReader(file);

%Make vid accesable
handles.vid = vid;
guidata(hObject,handles)

%Initialize axes1
axes(handles.axes1);

image(read(vid, 1));





% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

tic
%Get handles
h1 = get(handles.axes1, 'Children');

%Get vid
vid = handles.vid;

%import the characters
characters = getRefChars();

index = 0;
frameNo = 0;

tempList = cell(25, 2);     %cell(40, 2);
tempIdx = 1;
wait = 0;
rFrame = 1;

totalFrames = vid.NumberOfFrames;
thr = [0.3, 0.35, 0.4, 0.45, 0.5];
%thr = [0.3, 0.4, 0.5];
x = 1;
while frameNo < totalFrames
    if (x > 5)
        x = 1;
    end
    
    frameNo = frameNo + 2;
    %Read frame
    frame = read(vid, frameNo);
    
    
    wait = wait + 1;
    
    %Display frame in axes1
    set(h1, 'CData', frame)
    
    %Sobel
    mask = Sobel(frame);
    
    %Apply mask
    object3D = repmat(mask, [1,1,3]);
    frameDouble = im2double(frame);
    plate = object3D .* frameDouble;
    
    %met isodata
    chars = readPlate(plate, characters);
    chars = addDashes(chars);
    
    str = get(handles.listbox1, 'String');
    
    if(length(chars) == 8) 
        %if new plate
        if(tempIdx == 1)
            tempList = {chars frameNo};
            tempIdx = 2;
        elseif(sum(char(tempList(tempIdx-1, 1)) == chars) < 4 || wait > 24 || frameNo >= totalFrames-2)
            %Find the most common string mcs
            [unique_strings, ~, string_map] = unique(tempList(:, 1));
            mcs = unique_strings(mode(string_map));
            
            %Find first found mcs
            idx = find(strcmp(tempList(:, 1), mcs));
            if(~isempty(idx))
                rFrame = cell2mat(tempList(idx(1), 2));
            end
            
            if(isempty(str))
                set(handles.listbox1, 'String', mcs)
                index = 1;
                table = {mcs, rFrame, toc};
            else
                set(handles.listbox1, 'String', [str; mcs])
                index = index +1;
                table(index, :) = {mcs, rFrame, toc};
            end
            tempList = cell(25, 2);
            tempIdx = 1;
            wait = 0;
        else
            tempList(tempIdx, :) = {chars, frameNo};
            tempIdx = tempIdx + 1;
        end
    end
    
    %fixed threshold
    chars = readPlate(plate, characters, thr(x));
    chars = addDashes(chars);
    
    str = get(handles.listbox1, 'String');
    
    if(length(chars) == 8) 
        %if new plate
        if(tempIdx == 1)
            tempList = {chars frameNo};
            tempIdx = 2;
        elseif(sum(char(tempList(tempIdx-1, 1)) == chars) < 4 || wait > 24 || frameNo >= totalFrames-2)
            %Find the most common string mcs
            [unique_strings, ~, string_map] = unique(tempList(:, 1));
            mcs = unique_strings(mode(string_map));
            
            %Find first found mcs
            idx = find(strcmp(tempList(:, 1), mcs));
            if(~isempty(idx))
                rFrame = cell2mat(tempList(idx(1), 2));
            end
            
            if(isempty(str))
                set(handles.listbox1, 'String', mcs)
                index = 1;
                table = {mcs, rFrame, toc};
            else
                set(handles.listbox1, 'String', [str; mcs])
                index = index +1;
                table(index, :) = {mcs, rFrame, toc};
            end
            tempList = cell(25, 2);
            tempIdx = 1;
            wait = 0;
        else
            tempList(tempIdx, :) = {chars, frameNo};
            tempIdx = tempIdx + 1;
        end
    end
    
x = x+1;

end
assignin('base','table',table)
checkSolution(table, 'trainingSolutions.mat');





% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

