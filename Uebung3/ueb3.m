clear   % löscht workspace
home    % verschiebt inhalt im command window, alternatic clc(löschen und nicht verschieben)
close all   % schließt alle grafikfenster

% Einlesen der wave-files
filename1 = "david/Satz_David.wav"
filename2 = "marc/Satz_Marc.wav"
filename3 = "stefan/Satz_Stefan.wav"
[sk1,Fs] = audioread(filename1);
[sk2,Fs] = audioread(filename2);
[sk3,Fs] = audioread(filename3);

% Erstellen der Histogramme
[hist1,x1] = hist(sk1,21);
[hist2,x2] = hist(sk2,21);
[hist3,x3] = hist(sk3,21);

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
