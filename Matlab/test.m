% Filter design
h = fdesign.lowpass('Fp,Fst,Ap,Ast', 400, 500, 1, 60, 44100);
Hd = design(h, 'equiripple', 'MinOrder', 'any', 'StopbandShape', 'flat');

%%
clc
clear

%choose string
refHz = input('Enter string: ');

switch refHz
    case 1
        refHz = 329.6;  
        mPH = 0.6;   %meanPeakHeight 0.6 (2nd peak: 0.7)
    case 2
        refHz = 246.9; 
        mPH = 0.85;  %meanPeakHeight 0.75 (2nd peak: 0.9)
    case 3
        refHz = 196;    
        mPH = 0.8;   %meanPeakHeight 0.6 (2nd peak: 0.85)
    case 4
        refHz = 146.8;  
        mPH = 0.7;   %meanPeakHeight 0.65 (2nd peak: 0.85)
    case 5  
        refHz = 110;    
        mPH = 0.75;  %meanPeakHeight 0.75 (2nd peak: 0.85)
    case 6
        refHz = 82.4; 
        mPH = 0.8;    %meanPeakHeight ?????????????????
end 

% %read audio file
%[string, fs] = audioread('ljudfiler\6th_String_E.mp3');

%live record audio file 
fs = 8000;
recObj = audiorecorder(fs, 16, 2);
%Record your voice for 5 seconds.
recObj = audiorecorder;
disp('Recording')
recordblocking(recObj, 3);
disp('End of Recording');
%Store data in double-precision array.
string = getaudiodata(recObj);
%plot sound
plot(string)
figure

% %fourier transform 
% Fn = fs/2;                                                      % Nyquist Frequency
% L = length(string);                                             % Length Of Signal
% fty = fft(string)/L;                                              % Normalised Fourier Transform
% Fv = linspace(0, 1, fix(L/2)+1)*Fn;                             % Frequency Vector
% Iv = 1:length(Fv);                                              % Index Vector
% 
% plot(Fv, abs(fty(Iv))*2)
% grid
% xlabel('Frequency (Hz)')
% ylabel('Amplitude')
% figure
% 
% %lowpass-filter
% filteredFT = filter(Hd, fty);
% plot(Fv, abs(filteredFT(Iv))*2)
% figure
% 
% %inverse FT
% filteredString = real(ifft(filteredFT));
% plot(filteredString)
% figure

%calculate frequency using autocorrelation
Hz = autocorr(string, fs, mPH)

%plot ref-frequency & recorded frequency
t= 0:0.01:10;    
plot(t,ones(size(t))*refHz, '-g');
hold on
plot(t,ones(size(t))*Hz, '-r')
xlim([0 10])
ylim([refHz-500 refHz+500])




