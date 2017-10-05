function [Hz] = autocorr(sig, fs, mPH)
    
    %autkorrelation
    [auto_E] = xcorr(sig);
    
    %normalisera
    auto_E = (auto_E - min(auto_E))/(max(auto_E)-min(auto_E));
%     plot(auto_E)
%     figure
    
    %moving mean
    meanAuto = movmean(auto_E, 20);
    %normalisera movingmean
    meanAuto = (meanAuto - min(meanAuto))/(max(meanAuto)-min(meanAuto));
%     plot(meanAuto)
%     figure
   
    %mitten på autokorrelationen
    sz = size(auto_E);
    centeredAuto = auto_E(sz(1)/2-200:sz(1)/2+200);
%     plot(centeredAuto)
%     figure
    
    %visa mitten av meanAutkorrelationen
    sz = size(meanAuto);
    centeredMean = meanAuto(sz(1)/2-50:sz(1)/2+50);
%     plot(centeredMean)
%     figure

    %find peaks
    [pks, peaklocs] = findpeaks(centeredAuto, 'MinPeakHeight', mPH); 
    [maxpeak, maxpos] = max(pks);
    maxpeakloc = peaklocs(maxpos);
    nextPeakloc = peaklocs(maxpos+1);
    D = nextPeakloc - maxpeakloc;
    
    %beräkna frekvensen
    Hz = fs/D;
end