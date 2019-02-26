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
