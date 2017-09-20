%% TFYA65 Test

%read audio file
[string, fs] = audioread('ljudfiler\1st_String_E.mp3');

%plot audio
plot(string);
figure;

%autocorrelation
auto_E = xcorr(string);
plot(auto_E)
figure
sz = size(auto_E);
plot(auto_E(sz(1)/2-10:sz(1)/2+10));

%%