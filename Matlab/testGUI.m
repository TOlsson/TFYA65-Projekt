function testGUI
handles.mainwindow = figure();

handles.mytextbox = uicontrol( ...
    'Style', 'edit', ...
    'Units', 'normalized', ...
    'Position', [0.35 0.85 .50 .10], ...
    'String', 'No Button Has Been Pressed' ...
    );
handles.button(1) = uicontrol( ...
    'Style', 'pushbutton', ...
    'Units', 'normalized', ...
    'Position', [0.05 0.8 .2 .15], ...
    'String', '1st string e', ...
    'Callback', {@mybuttonpress,handles} ...
    );
handles.button(2) = uicontrol( ...
    'Style', 'pushbutton', ...
    'Units', 'normalized', ...
    'Position', [0.05 0.65 .2 .15], ...
    'String', '2nd string B', ...
    'Callback', {@mybuttonpress,handles} ...
    );
handles.button(3) = uicontrol( ...
    'Style', 'pushbutton', ...
    'Units', 'normalized', ...
    'Position', [0.05 0.5 .2 .15], ...
    'String', '3rd string G', ...
    'Callback', {@mybuttonpress,handles} ...
    );
handles.button(4) = uicontrol( ...
    'Style', 'pushbutton', ...
    'Units', 'normalized', ...
    'Position', [0.05 0.35 .2 .15], ...
    'String', '4th string D', ...
    'Callback', {@mybuttonpress,handles} ...
    );
handles.button(5) = uicontrol( ...
    'Style', 'pushbutton', ...
    'Units', 'normalized', ...
    'Position', [0.05 0.2 .2 .15], ...
    'String', '5th string A', ...
    'Callback', {@mybuttonpress,handles} ...
    );
handles.button(6) = uicontrol( ...
    'Style', 'pushbutton', ...
    'Units', 'normalized', ...
    'Position', [0.05 0.05 .2 .15], ...
    'String', '6th string E', ...
    'Callback', {@mybuttonpress,handles} ...
    );
                       
end

function mybuttonpress(src, ~, handles)
switch src.String
    case '1st string e'
        cla reset;
        handles.mytextbox.String = 'e';
        refHz = 329.6;  
        mPH = 0.6;
    case '2nd string B'
        cla reset;
        handles.mytextbox.String = 'B';
        refHz = 246.9; 
        mPH = 0.85;
    case '3rd string G'
        cla reset;
        handles.mytextbox.String = 'G';
        refHz = 196;    
        mPH = 0.8;
    case '4th string D'
        cla reset;
        handles.mytextbox.String = 'D';
        refHz = 146.8;  
        mPH = 0.7;
    case '5th string A'
        cla reset;
        handles.mytextbox.String = 'A';
        refHz = 110;    
        mPH = 0.75;
    case '6th string E'
        cla reset;
        handles.mytextbox.String = 'E';
        refHz = 82.4; 
        mPH = 0.8; 
    otherwise
        % Something strange happened
end

%read audio file
[string, fs] = audioread('ljudfiler\2nd_String_B.mp3');
mPH = 0.8;

%calculate frequency using autocorrelation
Hz = autocorr(string, fs, mPH);

%plot ref-frequency & recorded frequency
t= 0:0.01:10;  
plot(t,ones(size(t))*refHz, '-g');
set(gca, 'Position', [0.35 0.1 0.6 0.7])
hold on
plot(t,ones(size(t))*Hz, '-r')
xlim([0 10])
ylim([refHz-500 refHz+500])

end