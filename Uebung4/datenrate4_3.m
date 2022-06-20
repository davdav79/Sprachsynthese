home 
clear
close all

window_lengths = [25,50,100];
prediction_orders = [1,6,10,16];

Datarates = [];

for i=1:length(window_lengths)
  for j=1:length(prediction_orders)
    value = (1/(window_lengths(i)/1000))* (prediction_orders(j) + 1) * 16;
    Datarates = [Datarates value];
  end
end

%{
Original PCM: 16 * 16000 = 256.000 Bit/s

1/25: 1280 Bit/s
6/25: 4480 Bit/s
10/25: 7040 Bit/s
16/25: 10880 Bit/s
											
1/50: 640 Bit/s
6/50: 2240 Bit/s
10/50: 3520 Bit/s
16/50: 5440 Bit/s

1/100: 320 Bit/s
6/100: 1120 Bit/s
10/100: 1760 Bit/s
16/100: 2720 Bit/s
%}
