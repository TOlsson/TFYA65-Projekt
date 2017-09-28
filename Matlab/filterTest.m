clear
clc
[string, fs] = audioread('ljudfiler\6th_String_E.mp3');

  h = fdesign.lowpass('N,Fc',10,400);
  hd = design(h);
   
  fvtool(hd);
 