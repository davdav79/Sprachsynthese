function FFTAnalize(signalVec, FS,framelengths)
% Diese Funktion erhält einen Signalvector und wendet an ihm die FFT an mit
% gegebenen Framelängen und stellt diese dar
countOfN = length(framelengths);
halfCountOfN = ceil(countOfN/2);

for index = 1:countOfN
    N = framelengths(index);
    [spec f] = calculateFFT(signalVec, FS, N);
    subplot(halfCountOfN,2,index)
    plot(f, abs(spec));
    title(int2str(N/FS*1000) + " ms");
    ylabel("Â(f)");
    xlabel("f (Hz)");
end
end