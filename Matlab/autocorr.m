function [Hz] = autocorr(sig, fs)
    
    [auto_E] = xcorr(sig);
   
    [pks, peaklocs] = findpeaks(auto_E, 'MinPeakHeight', 20); %WE MUST FIX THIS BS

    [maxpeak, maxpos] = max(pks);

    maxpeakloc = peaklocs(maxpos);
    nextPeakloc = peaklocs(maxpos+1);

    D = nextPeakloc - maxpeakloc;

    Hz = fs/D;
end