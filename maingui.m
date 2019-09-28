function varargout = maingui(varargin)
warning off;
% MAINGUI MATLAB code for maingui.fig
%      MAINGUI, by itself, creates a new MAINGUI or raises the existing
%      singleton*.
%
%      H = MAINGUI returns the handle to a new MAINGUI or the handle to
%      the existing singleton*.
%
%      MAINGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINGUI.M with the given input arguments.
%
%      MAINGUI('Property','Value',...) creates a new MAINGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before maingui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to maingui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help maingui

% Last Modified by GUIDE v2.5 13-Dec-2012 23:58:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @maingui_OpeningFcn, ...
                   'gui_OutputFcn',  @maingui_OutputFcn, ...
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


% --- Executes just before maingui is made visible.
function maingui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to maingui (see VARARGIN)

% Choose default command line output for maingui
handles.output = hObject;

% handles to store original image
handles.images_array = 0;
% handles to store processed image
handles.imgbwarray = 0;
handles.imgedgearray = 0;
handles.imgnamesarray = 0;
handles.ptl = 0;
handles.ptr = 0;
handles.pbl = 0;
handles.pbr = 0;
handles.points = 0;
handles.points2 = 0;
handles.net = 0;
handles.distmat = 0;
handles.distmat_norm = 0;
handles.targetdata = 0;
handles.inputdata = 0;
handles.min_max = 0;
handles.net = 0;
handles.catdeg = 0;
handles.ncatdeg = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes maingui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = maingui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn1.
function btn1_Callback(hObject, eventdata, handles)
% hObject    handle to btn1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% user input the directory for database images
dire = uigetdir('','Directory where database images are stored');
if dire ~= 0
  set(handles.edt1,'String',dire);
end

% --- Executes on button press in btn2.
function btn2_Callback(hObject, eventdata, handles)
% hObject    handle to btn2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dire = uigetdir('','Directory where processed images are stored');
if dire ~= 0
  set(handles.edt2,'String',dire);  
end


function edt1_Callback(hObject, eventdata, handles)
% hObject    handle to edt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt1 as text
%        str2double(get(hObject,'String')) returns contents of edt1 as a double


% --- Executes during object creation, after setting all properties.
function edt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edt2_Callback(hObject, eventdata, handles)
% hObject    handle to edt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edt2 as text
%        str2double(get(hObject,'String')) returns contents of edt2 as a double


% --- Executes during object creation, after setting all properties.
function edt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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

%% btnTrain executed: train the network
% --- Executes on button press in btnTrain.
function btnTrain_Callback(hObject, eventdata, handles)
% hObject    handle to btnTrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
writeStatus(handles,'Training Artificial Neural Network ...')
handles = TrainANN(handles);
guidata(handles.figure1,handles);
writeStatus(handles,'Training Artificial Neural Network done.')

  
% --- Executes on button press in btnPredict.
function btnPredict_Callback(hObject, eventdata, handles)
% hObject    handle to btnPredict (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isempty(get(handles.edtYear,'String'))
  writeStatus(handles,'Error: Year to predict cannot be empty !');
  return
end
imgname = handles.imgnamesarray;
if isempty(imgname(1)) 
  writeStatus(handles,'Error: Please do image processing first !');
  return
end
year = str2double(get(handles.edtYear,'String'));
imgname = handles.imgnamesarray;
str = cell2mat(imgname(1));
year1 = str2double(str(1:4));
str = cell2mat(imgname(length(imgname)));
year2 = str2double(str(1:4));
if year < year1
  writeStatus(handles,'Error: Cannot predict backyear from available data training !');
  return
elseif year > year1 && year < year2
  names = handles.imgnamesarray;
  for i = 1:length(names)
    name = names(i);
    ye = cell2mat(name);
    ynum(i) = str2double(ye(1:4));    
  end
  fi = find(year-ynum==1);
  year3 = ynum(fi);
  writeStatus(handles,'-----------------------------');
  writeStatus(handles,['Predicting year ', num2str(year)]);
  handles = PredictNext(handles,year,year3,'between');
  guidata(handles.figure1,handles);
elseif year > year2
  writeStatus(handles,'-----------------------------');
  writeStatus(handles,['Predicting year ', num2str(year)]);
  handles = PredictNext(handles,year,year2,'future');
  guidata(handles.figure1,handles);
end

function edtYear_Callback(hObject, eventdata, handles)
% hObject    handle to edtYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edtYear as text
%        str2double(get(hObject,'String')) returns contents of edtYear as a double


% --- Executes during object creation, after setting all properties.
function edtYear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edtYear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
if (get(hObject,'Value') == 0)
  set(handles.btn2,'Enable','off');
  set(handles.edt2,'Enable','off');
else
  set(handles.btn2,'Enable','on');
  set(handles.edt2,'Enable','inactive');
end

% --- Executes on button press in btn5.
function btn5_Callback(hObject, eventdata, handles)
% hObject    handle to btn5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.listbox1,'String','')
drawnow;

function writeStatus(h,str)
contents = cellstr(get(h.listbox1,'String'));
if length(contents) == 1 && strcmp(contents{1},'')
  set(h.listbox1,'String',str)
else
  contents{length(contents)+1} = str;
  set(h.listbox1,'String',contents);
end
drawnow;

%% function ProcessImage
function handles = ProcessImage(handles)
% do image processing on original images if it is not being processed
% before >>>
% imgBWArray = 0;
% imgEdgeArray = 0;
%% >>> if user decides to store the processed images
% imgBWArray = {[]};
% imgEdgeArray = {[]};
if get(handles.checkbox1,'Value') == 1
  if ~isempty(get(handles.edt2,'String'))
    % check whether all images are already processed
    % access the directory contents
    dstruct = dir(get(handles.edt2,'String'));
    % get the number of the contents
    ldstruct = length(dstruct);
    number_of_processed_images = 0;    
    writeStatus(handles,'Begin image processing ...')
    for i = 1:ldstruct
      if ~(dstruct(i).isdir)
        imgName = fullfile(get(handles.edt2,'String'),dstruct(i).name);
        try          
          imgInfo = imfinfo(imgName);
          if strcmp(imgInfo.ColorType,'grayscale') && (strcmp(imgInfo.Format,'png') || strcmp(imgInfo.Format,'bmp') || strcmp(imgInfo.Format,'jpg'))
            number_of_processed_images = number_of_processed_images + 1;
            strImgNames{number_of_processed_images} = imgName;
          end
        catch
          continue;
        end        
      end
    end
    %% if there are existing processed images
    if number_of_processed_images > 0
      choice = questdlg('Processed images exist. What would you like to do for ANN training?', ...
                        'Please Choose', ...
                        'Overwrite existing','Use existing','Cancel','Overwrite existing');
      switch choice
        case 'Overwrite existing'
          % process new images, delete existing processed images
          writeStatus(handles,'Deleting images in Processed Images folder ...')
          drawnow;
          for i = 1:number_of_processed_images
            delete(strImgNames{i});
          end
          % begin image processing for original images, put processed images
          % inside processed image directory
          writeStatus(handles,'Begin image processing ...')
          drawnow;
          dstruct = dir(get(handles.edt1,'String'));
          ldstruct = length(dstruct);
          n = 0;
          for i = 1:ldstruct
            if ~(dstruct(i).isdir)
              imgName = fullfile(get(handles.edt1,'String'),dstruct(i).name);
              try          
                % try if it is an image. if it is not an image, then
                % continue (by using this syntax, it will reduce runtime)
                imgInfo = imfinfo(imgName);
                 % resize image to have height (or row) = 500;
                r = size(imread(imgName),1);
                scalesize = 500/r;
                img = imresize(imread(imgName),scalesize);
                % calculate the threshold for converting to BW image
                lev = graythresh(img);
                % convert to BW image
                imgResult = im2bw(img,lev);
                % image processing ... ################################
                imgResult = imdilate(imgResult,strel('disk',3));
                stats = regionprops(imgResult,'Area');
                matstats = cell2mat(struct2cell(stats));
                imgResult = bwareaopen(imgResult,max(matstats));
                imgResult = imdilate(imgResult,strel('disk',5));
                r = size(imgResult,1);
                imgResult(r,:) = 1;
                imgResult = imfill(imgResult,8,'holes');
                imgResult = imerode(imgResult,strel('disk',5));
                imgResult = imerode(imgResult,strel('disk',3));
                % #####################################################
                % edge detection in BW image to get the shoreline
                imgEdge = edge(imgResult);
                n = n + 1;
                imgBWArray{n} = imgResult;
                imgEdgeArray{n} = imgEdge;
                % append all edge images
                if n == 1                  
                  imgAppend = zeros(size(imgEdge,1),size(imgEdge,2));
                  imgAppend = imgAppend | imgEdge;
                end
                imgAppend = imgAppend | imgEdge;
                imgNamesArray{n} = dstruct(i).name;                
              catch err
                disp(err.message);
                continue
              end
            end
          end
          % write image to processed images directory
          writeStatus(handles,'Writing to Processed Images directory ...');
          drawnow;
          for i = 1:n
            % write BW image to disk
            imwrite(imgBWArray{i},fullfile(get(handles.edt2,'String'),strcat('bw_',imgNamesArray{i})),'png');
            % write edge image to disk
            imwrite(imgEdgeArray{i},fullfile(get(handles.edt2,'String'),strcat('edge_',imgNamesArray{i})),'png');
          end
          % write appended image
          imwrite(imgAppend,fullfile(get(handles.edt2,'String'),'append_img.png'),'png');
          writeStatus(handles,'Writing to Processed Images directory done.');
        case 'Use existing'
          % train the network using existing processed images
        case 'Cancel'
          % do nothing
          return
      end
    
    %% if there are no existing processed images, then do image processing
    else
      % begin image processing for original images, put processed images
      % inside processed image directory
      writeStatus(handles,'Begin image processing')
      dstruct = dir(get(handles.edt1,'String'));
      ldstruct = length(dstruct);
      n = 0;
      for i = 1:ldstruct
        if ~(dstruct(i).isdir)
          imgName = fullfile(get(handles.edt1,'String'),dstruct(i).name);
          try          
            % try if it is an image. if it is not an image, then
            % continue (by using this syntax, it will reduce runtime)
            imgInfo = imfinfo(imgName);
            % resize image to have height (or row) = 500;
            r = size(imread(imgName),1);
            scalesize = 500/r;
            img = imresize(imread(imgName),scalesize);
            % calculate the threshold for converting to BW image
            lev = graythresh(img);
            % convert to BW image
            imgResult = im2bw(img,lev);
           % image processing ... ################################
            imgResult = imdilate(imgResult,strel('disk',3));
            stats = regionprops(imgResult,'Area');
            matstats = cell2mat(struct2cell(stats));
            imgResult = bwareaopen(imgResult,max(matstats));
            imgResult = imdilate(imgResult,strel('disk',5));
            r = size(imgResult,1);
            imgResult(r,:) = 1;
            imgResult = imfill(imgResult,8,'holes');
            imgResult = imerode(imgResult,strel('disk',5));
            imgResult = imerode(imgResult,strel('disk',3));
            % #####################################################
            % edge detection in BW image to get the shoreline
            imgEdge = edge(imgResult);
            n = n + 1;
            imgBWArray{n} = imgResult;
            imgEdgeArray{n} = imgEdge;
            % append all edge images
            if n == 1                  
              imgAppend = zeros(size(imgEdge,1),size(imgEdge,2));
              imgAppend = imgAppend | imgEdge;
            end
            imgAppend = imgAppend | imgEdge;
            imgNamesArray{n} = dstruct(i).name;                
          catch err
            disp(err.message);
            continue
          end
        end
      end
      writeStatus(handles,'Writing to Processed Images directory ...');
      drawnow;
      for i = 1:n
        % write BW image to disk
        imwrite(imgBWArray{i},fullfile(get(handles.edt2,'String'),strcat('bw_',imgNamesArray{i})),'png');
        % write Edge image to disk
        imwrite(imgEdgeArray{i},fullfile(get(handles.edt2,'String'),strcat('edge_',imgNamesArray{i})),'png');        
      end
      % write appended image
      imwrite(imgAppend,fullfile(get(handles.edt2,'String'),'append_img.png'),'png');
      writeStatus(handles,'Writing to Processed Images directory done.');
    end
  else
    errordlg('Please provide a directory for processed images','Message','modal');
    return
  end

%% >>> if user decides not to store the processed images
% we don't have processed images yet, then do image processing for all
% original images without writing it to the local disk
else
  % if the directory of original images is valid, then get all images inside the directory
  dire = get(handles.edt1,'String');
  if ~isempty(dire)
    % access the directory contents
    dstruct = dir(dire);
    % get the number of the contents
    ldstruct = length(dstruct);
    j = 0;
    % iterate all directory contents, store only if it is an image
    writeStatus(handles,'Begin image processing ...')
    n = 0;
    for i = 1:ldstruct
      if ~(dstruct(i).isdir)
        imgName = fullfile(get(handles.edt1,'String'),dstruct(i).name);
        try          
          % try if it is an image. if it is not an image, then
          % continue (by using this syntax, it will reduce runtime)
          imgInfo = imfinfo(imgName);
          % resize image to have height (or row) = 500;
          r = size(imread(imgName),1);
          scalesize = 500/r;
          img = imresize(imread(imgName),scalesize);
          % calculate the threshold for converting to BW image
          lev = graythresh(img);
          % convert to BW image
          imgResult = im2bw(img,lev);
          % image processing ... ################################
          imgResult = imdilate(imgResult,strel('disk',3));
          stats = regionprops(imgResult,'Area');
          matstats = cell2mat(struct2cell(stats));
          imgResult = bwareaopen(imgResult,max(matstats));
          imgResult = imdilate(imgResult,strel('disk',5));
          r = size(imgResult,1);
          imgResult(r,:) = 1;
          imgResult = imfill(imgResult,8,'holes');
          imgResult = imerode(imgResult,strel('disk',5));
          imgResult = imerode(imgResult,strel('disk',3));
          % #####################################################
          % edge detection in BW image to get the shoreline
          imgEdge = edge(imgResult);
          n = n + 1;
          imgBWArray{n} = imgResult;
          imgEdgeArray{n} = imgEdge;
          % append all edge images
          if n == 1                  
            imgAppend = zeros(size(imgEdge,1),size(imgEdge,2));
            imgAppend = imgAppend | imgEdge;
          end
          imgAppend = imgAppend | imgEdge;
          imgNamesArray{n} = dstruct(i).name;                
        catch err
          disp(err.message);
          continue
        end
      end
    end
  end
  writeStatus(handles,'Saving processed images ...')  
end
handles.imgbwarray = imgBWArray;
handles.imgedgearray = imgEdgeArray;
handles.imgnamesarray = imgNamesArray;
save imgname.mat imgNamesArray;
% save imge.mat imgNamesArray imgEdgeArray;
writeStatus(handles,'Saving Images done.');

%% function BuildANNData
function handles = BuildANNData(handles)
writeStatus(handles,'Begin build ANN data ...');
handles = FromTopLeftCorner(handles);
handles = FromTopRightCorner(handles);
handles = FromBottomLeftCorner(handles);
handles = FromBottomRightCorner(handles);
handles = ConcatAllPoints(handles);
handles = RemoveRedundantPoints(handles);
handles = ConstructANNData(handles);
% update handles
writeStatus(handles,'Build ANN data done.');


%% function FromTopLeftCorner
function handles = FromTopLeftCorner(handles)
% iterate all edge array
edgeimg = handles.imgedgearray;
for img = 1:length(edgeimg)
  % find edge coordinate
  currimg = cell2mat(edgeimg(img));
  [y,x] = find(currimg==1);
  yn = 1:size(currimg,1);
  % iterate all degree (by 5 deg) to find cross point
  tancounter = 0;
  tancross = 0;
  for deg = 0:5:90
    tancounter = tancounter + 1;
    xn = yn*tan(deg2rad(deg));
    m = 1000;
    % iterate tan line point
    for i = 1:length(xn)
      % iterate edge line point
      for j = 1: length(x)
        d = sqrt(((xn(i)-x(j))^2)+((yn(i)-y(j))^2));
        m = min(m,d);
        if m == d
          xj = x(j);
          yj = y(j);
          xnn = xn(i);
          ynn = yn(i);
        end
      end
    end
    % for each tan line, find the cross point between the tan line and the
    % edge line
    tancross(tancounter,1) = xj;
    tancross(tancounter,2) = yj;
  end
  % for each image, get all tan-cross point
  point_coordinate(img,:,:) = tancross;
end
% update handles
handles.ptl = point_coordinate;
ptl = point_coordinate;
save ptl.mat ptl;


%% function FromTopRightCorner
function handles = FromTopRightCorner(handles)
% iterate all edge array
edgeimg = handles.imgedgearray;
for img = 1:length(edgeimg)
  % find edge coordinate
  currimg = cell2mat(edgeimg(img));
  [y,x] = find(currimg==1);
  yn = 1:size(currimg,1);
  left = size(currimg,2);
  % iterate all degree (by 5 deg) to find cross point
  tancounter = 0;
  tancross = 0;
  for deg = 0:5:90
    tancounter = tancounter + 1;
    xn = left-(yn*tan(deg2rad(deg)));
    m = 1000;
    % iterate tan line point
    for i = 1:length(xn)
      % iterate edge line point
      for j = 1: length(x)
        d = sqrt(((xn(i)-x(j))^2)+((yn(i)-y(j))^2));
        m = min(m,d);
        if m == d
          xj = x(j);
          yj = y(j);
          xnn = xn(i);
          ynn = yn(i);
        end
      end
    end
    % for each tan line, find the cross point between the tan line and the
    % edge line
    tancross(tancounter,1) = xj;
    tancross(tancounter,2) = yj;
  end
  % for each image, get all tan-cross point
  point_coordinate(img,:,:) = tancross;
end
% update handles
handles.ptr = point_coordinate;
ptr = point_coordinate;
save ptr.mat ptr;


%% function FromBottomLeftCorner
function handles = FromBottomLeftCorner(handles)
% iterate all edge array
edgeimg = handles.imgedgearray;
for img = 1:length(edgeimg)
  % find edge coordinate
  currimg = cell2mat(edgeimg(img));
  [y,x] = find(currimg==1);
  yn = 1:size(currimg,1);
  down = size(currimg,1);
  
  % iterate all degree (by 5 deg) to find cross point
  tancounter = 0;
  tancross = 0;
  for deg = 0:5:90
    tancounter = tancounter + 1;
    xn = yn*tan(deg2rad(deg));
    m = 1000;
    % iterate tan line point
    for i = 1:length(xn)
      % iterate edge line point
      for j = 1: length(x)
        d = sqrt(((xn(i)-x(j))^2)+(((down-yn(i))-y(j))^2));
        m = min(m,d);
        if m == d
          xj = x(j);
          yj = y(j);
          xnn = xn(i);
          ynn = yn(i);
        end
      end
    end
    % for each tan line, find the cross point between the tan line and the
    % edge line
    tancross(tancounter,1) = xj;
    tancross(tancounter,2) = yj;
  end
  % for each image, get all tan-cross point
  point_coordinate(img,:,:) = tancross;
end
% update handles
handles.pbl = point_coordinate;
pbl = point_coordinate;
save pbl.mat pbl;


%% function FromBottomRightCorner
function handles = FromBottomRightCorner(handles)
% iterate all edge array
edgeimg = handles.imgedgearray;
for img = 1:length(edgeimg)
  % find edge coordinate
  currimg = cell2mat(edgeimg(img));
  [y,x] = find(currimg==1);
  yn = 1:size(currimg,1);
  down = size(currimg,1);
  left = size(currimg,2);
  % iterate all degree (by 5 deg) to find cross point
  tancounter = 0;
  tancross = 0;
  for deg = 0:5:90
    tancounter = tancounter + 1;
    xn = left-(yn*tan(deg2rad(deg)));
    m = 1000;
    % iterate tan line point
    for i = 1:length(xn)
      % iterate edge line point
      for j = 1: length(x)
        d = sqrt(((xn(i)-x(j))^2)+(((down-yn(i))-y(j))^2));
        m = min(m,d);
        if m == d
          xj = x(j);
          yj = y(j);
          xnn = xn(i);
          ynn = yn(i);
        end
      end
    end
    % for each tan line, find the cross point between the tan line and the
    % edge line
    tancross(tancounter,1) = xj;
    tancross(tancounter,2) = yj;
  end
  % for each image, get all tan-cross point
  point_coordinate(img,:,:) = tancross;
end
% update handles
handles.pbr = point_coordinate;
pbr = point_coordinate;
save pbr.mat pbr;

%% function ConcatAllPoints
function handles = ConcatAllPoints(handles)
% concat all degree
% to make the differences between each degree and the line direction,
% we make an initial assumption:
% degree from top left corner => multiplied by -1
% degree from top right corner => multiplied by 1
% degree from bottom left corner => multiplied by -10
% degree from bottom right corner => multiplied by 10
tleft = (0:5:90).*-1;
tright = (0:5:90);
bleft = (0:5:90).*-1000;
bright = (0:5:90).*1000;
catdeg = vertcat(tleft',tright',bleft',bright');
%
p1 = handles.ptl;
p2 = handles.ptr;
p3 = handles.pbl;
p4 = handles.pbr;
% number of images
numimgs = size(p1,1);
% append all points for each image
for i = 1:numimgs
  p1_reshape = reshape(p1(i,:,:),size(p1,2),2); 
  p2_reshape = reshape(p2(i,:,:),size(p2,2),2);
  p3_reshape = reshape(p3(i,:,:),size(p3,2),2);
  p4_reshape = reshape(p4(i,:,:),size(p4,2),2);
  p = cat(1,p1_reshape,p2_reshape,p3_reshape,p4_reshape);
  ps(i) = {p};
end
% update handles
handles.points = ps;
handles.catdeg = catdeg;
% save points.mat ps;

%% function RemoveRedundantPoints
function handles = RemoveRedundantPoints(handles)
% assumption: using points data from 1st image, get the unique index, and
% then get data from the rest of images using those index data
ps = handles.points;
ps1 = cell2mat(ps(1));
[ps1a,index,c] = unique(ps1,'rows');
% populate corresponding points of the rest of images based on unique index
% found in image #1
for i = 1:length(ps)
  psn = cell2mat(ps(i));
  newpsn = psn(index,:);
  newps(i) = {newpsn};
end
% degree matrix
catdeg = handles.catdeg;
ncatdeg = catdeg(index);
% update handles
handles.ncatdeg = ncatdeg;
handles.points2 = newps;

function handles = ConstructANNData(handles)
% find a single value of maximum distance between a point on an image 
% and this corresponding point on the next image, for all images
ps = handles.points2;
% the distance between points is the distance between a point in 1st image
% and a corresponding point in 2nd image
% the distance matrix => 
%   number of rows = number of points in single image
%   number of columns = number of images - 1
distmat = zeros(length(ps(1)),length(ps)-1);
for i = 1:length(ps)-1
  % points in image #i
  ps1 = cell2mat(ps(i));
  % points in image #i+1
  ps2 = cell2mat(ps(i+1));
  % distance between corresponding points
  for j = 1:length(ps1)
    d = pdist2(ps1(j,:),ps2(j,:));
    distmat(j,i) = d;
  end  
end
% corresponding normalization value
% loop per row
distmat_norm = zeros(size(distmat,1), size(distmat,2));
min_max = zeros(size(distmat,1),2);
for i = 1:size(distmat,1)
  rowmat = distmat(i,:);
  minr = min(rowmat);
  maxr = max(rowmat);
  z = maxr-minr;
  rowmat2 = zeros(1,length(rowmat));
  for j = 1:length(rowmat)
    if z == 0
      rowmat2(j) = 0;
    else
      rowmat2(j) = (rowmat(j)-minr)/z;
    end
  end
  distmat_norm(i,:) = rowmat2;
  min_max(i,1) = minr;
  min_max(i,2) = maxr;
end
% construct input-target pair
% each point in image i is the input of each point in image i+1
% or each point in image i+1 is the target of each image in 
p = 0; q = 0;
for i = 1:size(distmat_norm,2)
  if mod(i,2)==0
    % target
    p = p+1;
    targetdata1(:,p) = distmat_norm(:,i);
  else
    % input
    q = q+1;
    inputdata1(:,q) = distmat_norm(:,i);
  end
end
if size(inputdata1,2) > size(targetdata1,2)
  inputdata1 = inputdata1(:,1:size(targetdata1,2));
elseif size(targetdata1,2) > size(inputdata1,2)
  targetdata1 = targetdata1(:,1:size(inputdata1,2));
end
p = 0; q = 0;
for i = 1:size(distmat_norm,2)
  if mod(i,2)==0
    % input
    p = p+1;
    inputdata2(:,p) = distmat_norm(:,i);
  else
    % target
    q = q+1;
    targetdata2(:,q) = distmat_norm(:,i);
  end
end
if size(inputdata2,2) > size(targetdata2,2)
  inputdata2 = inputdata2(:,1:size(targetdata2,2));
elseif size(targetdata2,2) > size(inputdata2,2)
  targetdata2 = targetdata2(:,1:size(inputdata2,2));
end
% concatenate matrix horizontally
targetdata = horzcat(targetdata1,targetdata2);
inputdata = horzcat(inputdata1,inputdata2);
% update handles
handles.distmat = distmat;
handles.targetdata = targetdata;
handles.inputdata = inputdata;
handles.distmat_norm = distmat_norm;
handles.min_max = min_max;
%
ncatdeg = handles.ncatdeg;
eimg = handles.imgedgearray;
points = handles.points2;
% save shoredata.mat distmat distmat_norm min_max targetdata inputdata ncatdeg eimg points;

function handles = TrainANN(handles)
% size of input nodes
nodes = size(handles.inputdata,1);
numhiddenneurons = 2*nodes;
% create custom network ...
net = network;
%% configure input layer
% number of input layer = 1
net.numInputs = 1;
% 9 neurons in input layer
net.inputs{1}.size = nodes;
% the range of input values is between 0 to 1
iranges = ones(nodes,2);
iranges(1:nodes,1) = 0;
net.inputs{1}.range = iranges;
%% configure hidden layers
% number of layers = 2: 1 hidden layer and 1 output layer
net.numLayers = 2;
% 48 neurons in hidden layer
net.layers{1}.size = numhiddenneurons;
% 9 neurons in output layer
net.layers{2}.size = nodes;
% last layer is output layer
net.outputConnect = [0 1];
%% layer connection and direction
net.inputConnect = [1 ; 0 ];
net.layerConnect = [0 0 ; 1 0 ];
% all neurons has bias
net.biasConnect = [1;1];
%% initial parameter values
% all neurons in all layers have tansig transfer function
net.layers{1:2}.transferFcn = 'satlin'; %'poslin';
% all neurons in all layers have initial values based on Nguyen-Widrow
% algorithm
net.layers{1:2}.initFcn = 'initnw';
% Typically, net.initFcn is set to 'initlay', 
% which initializes each layer's weights and biases according to its net.layers{i}.initFcn.
net.initFcn = 'initlay';
% performance measurement...
net.performFcn = 'msereg';
net.trainFcn = 'traingda'; %'trainscg'; %'traingda';
net.trainParam.lr = 0.05;
net.trainParam.epochs = 50000;
net.trainParam.show = 10;
% net.trainParam.mem_reduc = 1;
net.trainParam.goal = 0.001;
%% apply algorithm in initFcn to initial network params
net = init(net);
net = train(net,handles.inputdata,handles.targetdata);
handles.net = net;
% save net.mat net;


% --- Executes on button press in btnProcess.
function btnProcess_Callback(hObject, eventdata, handles)
% hObject    handle to btnProcess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = ProcessImage(handles);
handles = BuildANNData(handles);
guidata(handles.figure1,handles);

function handles = PredictNext(handles,year,lastyear,predictype)
% the network
net = handles.net;
if ~isobject(net)
  writeStatus(handles,'Warning: Network not configured properly or it has not been trained yet,');
  writeStatus(handles,'we will use net.mat instead to do prediction.');
  if exist('net.mat','file')
    load net.mat
    handles.net = net;
  else
    writeStatus(handles,'Error: net.mat not found !');
    handles.net = 0;
    return
  end
end
% get the last normalized distance data
d_data = handles.distmat_norm;
d = d_data(:,size(d_data,2));
% get the maximum - minimum of last distance data
delta_data = handles.min_max;
delta = delta_data(:,2)-delta_data(:,1);
% get the last, non-redundant points data
pcell = handles.points2;
p = cell2mat(pcell(length(pcell)));
% last year in training data - year inputed
dyear = year - lastyear;
t = d;
dist = zeros(length(delta),1);
try
  for i = 1:dyear
    t = sim(net,t);
    dist = dist + round(t.*delta);
  end
  save net.mat net;
catch
  writeStatus(handles,'Error: The network was not trained properly, please train it again.');
  delete net.mat;
end
% save simdist.mat dist;
%% plot the data
di = dist;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
eimg = handles.imgedgearray;
points = handles.points2;
ncatdeg = handles.ncatdeg;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NumberOfImages = size(eimg,2);
% last edge image for imshow
names = handles.imgnamesarray;
for i = 1:length(names)
  name = cell2mat(names(i));
  name = str2double(name(1:4));
  if name == lastyear
    break
  end
end
LastEdgeImage = cell2mat(eimg(i)); %cell2mat(eimg(NumberOfImages));
w = size(LastEdgeImage,2);
h = size(LastEdgeImage,1);
% last points on edge line
LastPoints = cell2mat(points(NumberOfImages));
% the resultant point (64 rows * 2 cols)
p = zeros(length(di),2);

for i = 1:length(di)
  % from top left => -0:-90
  % the line is from (0,0)
  x = LastPoints(i,1); % => column/width
  y = LastPoints(i,2); % => row/height
  
  if ncatdeg(i) <= 0 && ncatdeg(i) >= -90     
    originx = 0; originy = 0;
%     tant = (x-originx)/(y-originy);
    tant = tan(deg2rad(abs(ncatdeg(i))));
    sint = sin(atan(tant));
    cost = cos(atan(tant));
    % the X coordinate
    p(i,1) = (sint*di(i)) + x;
    % the Y coordinate
    p(i,2) = (cost*di(i)) + y;
    
  % from top right => +5:+90
  elseif ncatdeg(i) >= 5 && ncatdeg(i) <= 90
    originx = w; originy = 0;
%     tant = (originx-x)/(y-originy);
    tant = tan(deg2rad(abs(ncatdeg(i))));
    sint = sin(atan(tant));
    cost = cos(atan(tant));
    % the X coordinate
    p(i,1) = x - (sint*di(i));
    % the Y coordinate
    p(i,2) = (cost*di(i)) + y;
    
  % from bottom left: -5000:-90000
  elseif ncatdeg(i) <= -5000 && ncatdeg(i) >= -90000
    originx = 0; originy = h;
%     tant = (x-originx)/(originy-y);
    tant = tan(deg2rad(abs(ncatdeg(i)/1000)));
    sint = sin(atan(tant));
    cost = cos(atan(tant));
    % the X coordinate
    p(i,1) = x - (sint*di(i));
    % the Y coordinate
    p(i,2) = (cost*di(i)) + y;
  
  % from bottom right
  elseif ncatdeg(i) >= 5000 && ncatdeg(i) <= 90000
    originx = w; originy = h;
%     tant = (originx-x)/(originy-y);
    tant = tan(deg2rad(abs(ncatdeg(i)/1000)));
    sint = sin(atan(tant));
    cost = cos(atan(tant));
    % the X coordinate
    p(i,1) = x + (sint*di(i));
    % the Y coordinate
    p(i,2) = (cost*di(i)) + y;
  end
end

save result.mat p;
t = p(:,1);
po = p(:,2);
xi =  1:1:w;
yi = interp1(t,po,xi,'linear');

figure
if strcmp(predictype,'future')==1
  imshow(LastEdgeImage)
elseif strcmp(predictype,'between')==1
  names = handles.imgnamesarray;
  for i = 1:length(names)
    name = cell2mat(names(i));
    name = str2double(name(1:4));
    if name == year
      break
    end
  end
  imshow(cell2mat(eimg(i)));
end
hold on
plot(p(:,1),p(:,2),'or');
plot(xi,yi)
if strcmp(predictype,'future')==1
  text(10,10,['--- Real data in year ', num2str(lastyear), ' (last year in training data)'],'Color',[1 1 1]);
elseif strcmp(predictype,'between')==1
  text(10,10,['--- Real data in year ', num2str(year)],'Color',[1 1 1]);
end
text(10,30,['--- Prediction data in year ', num2str(year)],'Color','b');
