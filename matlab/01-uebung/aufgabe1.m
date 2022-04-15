clc;
clear;
close all;

% Parameter für erste Sinusschwingung
f1 = 500; % Frequenz in Herz
A1 = 1; % Amplitude
phi1 = 0; % Phasenverschiebung

% Parameter für zweite Sinusschwingung
f2 = 1000;
A2 = 0.5;
phi2 = -pi/2;

% Parameter für dritte Sinusschwingung
f3 = 2000;
A3 = 0.25;
phi3 = pi;

f_a = 16000; % Abtastfrequenz in Hz
afl = 16; % Auflösung 16 Bit

Ta = 1/f_a;
t = 0:Ta:5-Ta; % Dauer 5 Sekunden
tanz = 0:Ta:0.020 - Ta; % Anzeige x-Achse

A_t1 = A1 * sin(2 * pi * f1 * t + phi1);
A_t2 = A2 * sin(2 * pi * f2 * t + phi2);
A_t3 = A3 * sin(2 * pi * f3 * t + phi3);

A_ges = A_t1 + A_t2 + A_t3; % Dieses Array enthält jetzt Werte größer -1 bis 1
% Suche maximalwert
maxWert = max(abs(A_ges));
% Teile den Vektor durch den Maximalwert
A_ges = A_ges / maxWert;

figure('Name',"Sinusschwingungen")
subplot(2,1,1)
plot(t, A_t1, t, A_t2, t,A_t3);
axis([0 0.02 -2 2]);
title("Sinusschwingungen");
ylabel("A");
xlabel("t");

subplot(2,1,2)
plot(t, A_ges);
axis([0 0.02 -2 2]);
title("Addierte Sinusschwingungen");
ylabel("A");
xlabel("t");

% Fouriertransformation
N_1 = f_a * 0.05;
N_2 = f_a * 0.100;
N_3 = f_a * 0.500;
N_4 = f_a * 1;
N_5 = f_a * 5;

Nvec = [N_1 N_2 N_3 N_4 N_5];

figure('Name',"Fouriertransformierte")
FFTAnalize(A_ges, f_a, Nvec)

audiowrite("aufgabe1_output.wav", A_ges, f_a, "BitsPerSample",afl);

[avec aFS] = audioread("stefanA.wav");
[ivec iFS] = audioread("stefanI.wav");

% Stelle Sprachsignale dar
figure("Name","Sprachsignale");
subplot(2,1,1);
plot(avec);
title("A-Sprachsignal");

subplot(2,1,2);
plot(ivec);
title("I-Sprachsignal");

% Berechne und gebe Transformierte Signale aus
figure('Name',"Sprache-Fouriertransformiert A")
FFTAnalize(avec, aFS, Nvec(1:4));
figure('Name',"Sprache-Fouriertransformiert I")
FFTAnalize(ivec, iFS, Nvec);

