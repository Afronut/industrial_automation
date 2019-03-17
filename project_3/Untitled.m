clc, clear
F = 1; %Frequency of analog data
Fs = 1/0.17;%sampling Frequency
t1 = 0; 
t2 = 5; %Time range
t = t1:1e-2:t2;
y = sin(2*pi*F*t) + 0.2*cos(12*pi*F*t);
Ts = 1/Fs; %sampling period
ts = t1:Ts:t2; 
sampled = sin(2*pi*F*ts) + 0.2*cos(12*pi*F*ts); 
recons = zeros(1,length(t)); 
samples = length(ts);
for i = 1:1:length(t)
    for n = 1:1:samples
        recons(i) = recons(i) + sampled(n)*sinc((t(i)-n*Ts)/Ts); % reconstructed using sinc function
    end
end
figure(12)
subplot(2,1,1)
plot(t,y)
hold on
h=stem(ts,sampled);
set(h(1),'MarkerFaceColor','blue','MarkerSize',0.1);
subplot(2,1,2)
plot(t,recons)