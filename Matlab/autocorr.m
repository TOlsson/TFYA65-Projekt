function [Hz] = autocorr(sig, fs)
    
    %ta bort den superhöga delen från ljudet (filtrera??)
    %lpFilt = fdesign.lowpass('N, Fc', 10, 400, fs);
    
    [auto_E] = xcorr(sig);
    
    auto_E = (auto_E - min(auto_E))/(max(auto_E)-min(auto_E));
    meanAuto = movmean(auto_E, 20);
    meanAuto = (meanAuto - min(meanAuto))/(max(meanAuto)-min(meanAuto));
   
    sz = size(auto_E);
    centeredAuto = auto_E(sz(1)/2-600:sz(1)/2+600);
    plot(centeredAuto)
    figure
    
    sz = size(meanAuto);
    centeredMean = meanAuto(sz(1)/2-500:sz(1)/2+500);
    plot(centeredMean)
    figure

    [pks, peaklocs] = findpeaks(centeredAuto, 'MinPeakHeight', 0.8); %WE MUST FIX THIS BS
     
    
    [maxpeak, maxpos] = max(pks);

    maxpeakloc = peaklocs(maxpos);
    nextPeakloc = peaklocs(maxpos+1);
    D = nextPeakloc - maxpeakloc

    Hz = fs/D;
end