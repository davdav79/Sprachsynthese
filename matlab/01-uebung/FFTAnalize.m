function FFTAnalize(signalVec, FS,framelengths)
% Diese Funktion erhält einen Signalvector und wendet an ihm die FFT an mit
% gegebenen Framelängen und stellt diese dar
countOfN = length(framelengths);
halfCountOfN = ceil(countOfN/2);
% F_A_ges = fft(A_ges, N_3);
% delta_f = f_a / N_3;
% f = [0: delta_f : f_a-delta_f];
% subplot(3,2,3)
% plot(f, abs(F_A_ges));
% title("500 ms");
% ylabel("Â(f)");
% xlabel("f (Hz)");
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