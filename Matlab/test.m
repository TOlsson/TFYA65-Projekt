%% TFYA65 Test
clear 
clc

%read audio file
[string, fs] = audioread('ljudfiler\6th_String_E.mp3');

%plot audio
%plot(string);
%figure;

%autocorrelation
auto_E = xcorr(string);
plot(auto_E);
%figure

[pks, peaklocs] = findpeaks(auto_E, 'MinPeakHeight', 420);

[maxpeak, maxpos] = max(pks);

maxpeakloc = peaklocs(maxpos);
nextPeakloc = peaklocs(maxpos+1);

D = nextPeakloc - maxpeakloc;

Hz = fs/D

%% TFYA65 tiny auto (onödigt)
clear 
clc

%read audio file
[string, fs] = audioread('ljudfiler\6th_String_E.mp3');
%plot audio
%plot(string);
%figure;

fourierString = fft(string);
plot(fourierString);
figure

%autocorrelation
shift = fftshift(fourierString);
plot(shift)
figure

fouriercorr = xcorr(shift);
plot(fouriercorr)
figure
%figure

auto_E = ifft(fftshift(fouriercorr));
plot(auto_E);

sz = size(auto_E);
range = 500;
tinyAuto = (auto_E((sz(1)/2-range):(sz(1)/2+range)));
plot(tinyAuto);

[pks, peaklocs] = findpeaks(tinyAuto);

[maxpeak, maxpos] = max(pks);

maxpeakloc = peaklocs(maxpos);
nextPeakloc = peaklocs(maxpos+1);

D = nextPeakloc - maxpeakloc;
