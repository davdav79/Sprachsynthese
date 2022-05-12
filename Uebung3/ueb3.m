clear   %löscht workspace
home    %verschiebt inhalt im command window, alternatic clc(löschen und nicht verschieben)
close all   %schließt alle grafikfenster

filename1 = "david/Satz_David.wav"
filename2 = "marc/Satz_Marc.wav"
filename3 = "stefan/Satz_Stefan.wav"
[sk1,Fs] = audioread(filename1);
[sk2,Fs] = audioread(filename2);
[sk3,Fs] = audioread(filename3);

subplot(3,1,1)
hist(sk1,256);
axis([-1 1 0 30000])
subplot(3,1,2)
hist(sk2,256)
axis([-1 1 0 30000])
subplot(3,1,3)
hist(sk3,256)
axis([-1 1 0 30000])