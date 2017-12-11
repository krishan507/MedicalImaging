%Created by: Krishan Desai, Ryan Morales, Aaron Grewal

function varargout = projectGUI(varargin)
% PROJECTGUI MATLAB code for projectGUI.fig
%      PROJECTGUI, by itself, creates a new PROJECTGUI or raises the existing
%      singleton*.
%
%      H = PROJECTGUI returns the handle to a new PROJECTGUI or the handle to
%      the existing singleton*.
%
%      PROJECTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECTGUI.M with the given input arguments.
%
%      PROJECTGUI('Property','Value',...) creates a new PROJECTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projectGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projectGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projectGUI

% Last Modified by GUIDE v2.5 10-Dec-2017 21:56:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projectGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @projectGUI_OutputFcn, ...
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


% --- Executes just before projectGUI is made visible.
function projectGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projectGUI (see VARARGIN)

% Choose default command line output for projectGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes projectGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
display_images(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = projectGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function image_to_display_Callback(hObject, eventdata, handles)
% hObject    handle to image_to_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
display_images(hObject, handles);



% --- Executes during object creation, after setting all properties.
function image_to_display_CreateFcn(hObject, eventdata, handles)
% hObject    handle to image_to_display (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

N=32; % number of the images in the DATA folder
set(hObject, 'Min', 1);
set(hObject, 'Max', N);
set(hObject, 'Value', 1);
set(hObject, 'SliderStep', [1/N , 10/N ]);



% --- Executes on selection change in iradon_interp.
function iradon_interp_Callback(hObject, eventdata, handles)
% hObject    handle to iradon_interp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns iradon_interp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from iradon_interp
display_iradon_transform(handles);


% --- Executes during object creation, after setting all properties.
function iradon_interp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iradon_interp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in iradon_filter.
function iradon_filter_Callback(hObject, eventdata, handles)
% hObject    handle to iradon_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns iradon_filter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from iradon_filter
display_iradon_transform(handles);


% --- Executes during object creation, after setting all properties.
function iradon_filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iradon_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function num_projections_Callback(hObject, eventdata, handles)
% hObject    handle to num_projections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of num_projections as text
%        str2double(get(hObject,'String')) returns contents of num_projections as a double

%Make sure that the number of projections is within bounds
num_proj = str2double(get(hObject, 'String'));
if num_proj < 2
    num_proj= 2;
elseif num_proj > 180
    num_proj = 180;
end

set(handles.num_projections, 'String', num_proj);
handles.num_proj = num_proj;

%Update the radon transform
radon_transform = display_radon_transform(handles);
handles.current_radon = radon_transform;

%Update the iradon transform
display_iradon_transform(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function num_projections_CreateFcn(hObject, eventdata, handles)
% hObject    handle to num_projections (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function display_images(hObject, handles)

%Get the image we need
image = get_image_from_file(handles);
handles.current_img = image;

%Display the image
axes(handles.original_image);
imshow(handles.current_img, []);

%Display radon transfrom
handles.num_proj = str2double(get(handles.num_projections, 'String'));
radon_transform = display_radon_transform(handles);
handles.current_radon = radon_transform;

%Display iradon transform
display_iradon_transform(handles);
guidata(hObject, handles);

function image = get_image_from_file(handles)
img_dir = './'; % folder of the stack images
imageNumberSelected = int32(get(handles.image_to_display, 'Value'));
strfile = sprintf('IM_%04d',imageNumberSelected);
image = dicomread(fullfile(img_dir, strfile));

function radon_transform = display_radon_transform(handles)
axes(handles.radon_transform);

theta = 0:handles.num_proj;
[R,xp] = radon(handles.current_img,theta);
imagesc(theta,xp,R);
title('R_{\theta} (X\prime)');
xlabel('\theta (degrees)');
ylabel('X\prime');
set(gca,'XTick',0:20:180);
colormap(hot);
colorbar
radon_transform = R;

function display_iradon_transform(handles)
interp = get(handles.iradon_interp, 'String');
interp = lower(interp);
interpIndex = get(handles.iradon_interp, 'Value');

filter = get(handles.iradon_filter, 'String');
filterIndex = get(handles.iradon_filter, 'Value');

I = iradon(handles.current_radon,0:handles.num_proj,char(interp(interpIndex)),char(filter(filterIndex)));
axes(handles.iradon_transform);
imshow(I, []);








