%% TFYA65 Test

%read audio file
[string, fs] = audioread('ljudfiler\3rd_String_G.mp3');

%plot audio
plot(string);
figure;

%autocorrelation
auto_E = xcorr(string);
plot(auto_E)
figure

%plot center of autocorrelation
sz = size(auto_E);
plot(auto_E(sz(1)/2-500:sz(1)/2+500));
