function [arrayFFTResults arrayFFTFrequenceVec] = calculateFFT(signalVec, FS, N)
% calculateFFT(signalVec, FS, N)
% Bestimmt die FFT und gibt das Ergebnis und die Frequenzachse zurück
%   Diese Funktion bestimmt die FFT mit dem gegebenen Wert N
%   Berechnet zusätzlich die Frequenzachse und gibt diese als zweiten
%   Parameter zurück.
arrayFFTResults = fft(signalVec, N);
delta_f = FS / N;
arrayFFTFrequenceVec = [0: delta_f : FS-delta_f];
end