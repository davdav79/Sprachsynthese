function FFTAnalize(name, signalVec, FS,framelengths)
% Diese Funktion erhält einen Signalvector und wendet an ihm die FFT an mit
% gegebenen Framelängen und stellt diese dar
countOfN = length(framelengths);
halfCountOfN = ceil(countOfN/2);
disp(name);
for index = 1:countOfN
    framelength = framelengths(index);
    N = framelength * FS;
    [spec f] = calculateFFT(signalVec, FS, N);
    subplot(halfCountOfN,2,index)
    abs_spec = abs(spec);
    plot(f, abs_spec);
    axis([0 4000 min(abs_spec) max(abs_spec*1.05)])
    title(int2str(framelength) + " ms");
    ylabel("Â(f)");
    xlabel("f (Hz)");
end
end