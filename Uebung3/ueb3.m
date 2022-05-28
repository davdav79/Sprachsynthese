clear   % löscht workspace
home    % verschiebt inhalt im command window, alternatic clc(löschen und nicht verschieben)
close all   % schließt alle grafikfenster

% Einlesen der wave-files
filename1 = "./david/Satz_David.wav";
filename2 = "./marc/Satz_Marc.wav";
filename3 = "./stefan/Satz_Stefan.wav";
[sk1,Fs] = audioread(filename1);
[sk2,Fs] = audioread(filename2);
[sk3,Fs] = audioread(filename3);

mean1 = mean(sk1);
mean2 = mean(sk2);
mean3 = mean(sk3);

edges = [-1, -0.9, -0.8, -0.7, -0.6, -0.5, -0.4, -0.3, -0.2, -0.1, 0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]

% Erstellen der Histogramme
[hist1,x1] = hist(sk1,edges);
[hist2,x2] = hist(sk2,edges);
[hist3,x3] = hist(sk3,edges);

% Berechnung der Wahrscheinlichkeitswerte
prob1 = hist1/sum(hist1)*100;
prob2 = hist2/sum(hist2)*100;
prob3 = hist3/sum(hist3)*100;

% Plot
plot(x1,prob1,x2,prob2,x3,prob3)


legend({'Satz David','Satz Marc','Satz Stefan'},'Location','northeast')
xlim([-1 1])
xlabel("Amplituden-Wertebereich")
ylabel("Häufigkeit in %")
xticks(edges)
% Plot David Formanten
figure()
TDavid = readtable("david/formant.csv","NumHeaderLines", 1)
TMarc = readtable("marc/formant.csv","NumHeaderLines", 1)
TStefan = readtable("stefan/formant.csv","NumHeaderLines", 1)

plot(TDavid.Var3,TDavid.Var2,'.',TMarc.Var3,TMarc.Var2, '.',TStefan.Var3,TStefan.Var2, '.')
title("Formanten Tabelle David, Marc, Steffan")
set(gca,'XAxisLocation','top','YAxisLocation','right','ydir','reverse', 'xdir', 'reverse');
xlabel("F2")
ylabel("F1")
legend("David","Marc","Stefan")
text(TDavid.Var3-20,TDavid.Var2-10,TDavid.Var1)
text(TMarc.Var3-20,TMarc.Var2-10,TMarc.Var1)
text(TStefan.Var3-20,TStefan.Var2-10,TStefan.Var1)

