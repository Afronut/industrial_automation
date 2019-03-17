H_s=tf(89.13,[1,178.3]);
G_f=feedback(H_s,1);
figure(1)
step(G_f)
figure(2)
nyquist(H_s)
figure(3)
rlocus(G_f)
figure(4)
bode(G_f)

clc

%% 10 ms time-lapse
figure(1)
plot(Data2Input10{:,2}*10/1000,Data2Input10{:,1},'b');
hold on
plot(Data2Output10{:,2}*10/1000,Data2Output10{:,1},'r');
xlim([0 100*10/1000]);
ylim([-0.2 1.2]);
xlabel('time (s)');
ylabel('Voltage (V)');

%% 100 ms time-lapse
figure(2)
plot(Data2Input100{:,2}*100/1000,Data2Input100{:,1},'b');
hold on
plot(Data2Output100{:,2}*100/1000,Data2Output100{:,1},'r');
xlim([0 100*100/1000]);
ylim([-0.2 1.2]);
xlabel('time (s)');
ylabel('Voltage (V)');