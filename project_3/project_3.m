clc,clear,close all
%% Generate sin and cos plot and stem plot .17 s
t = 0:0.0001:5;
y= sin(2*pi*t) + 0.2*cos(12*pi*t);
figure(1)
plot(t,y)
figure(2)
t1 = 0:1700*.0001:5;
y= sin(2*pi*t1) + 0.2*cos(12*pi*t1);
h=stem(t1,y);
set(h(1),'MarkerFaceColor','blue','MarkerSize',0.1)
figure(3)
x=ones(1,30);
t2 = 0:1700*.0001:5;
h=stem(t2,x);
set(h(1),'MarkerFaceColor','blue','MarkerSize',0.1)

%% Generate sin and cos plot and stem plot .017 s
figure(4)
pe=.017 ;
t = 0:170*.0001:5;
N=length(t); 
y= sin(2*pi*t) + 0.2*cos(12*pi*t);
h=stem(t,y);
set(h(1),'MarkerFaceColor','blue','MarkerSize',0.1)
figure(5)
x=ones(1,295);
t = 0:170*.0001:5;
h=stem(t,x);
set(h(1),'MarkerFaceColor','blue','MarkerSize',0.1)

%% zero oder-hold
deltat=0.01; 
n=0:deltat:2; 
y= sin(2*pi*n) + 0.2*cos(12*pi*n);
N=length(n); 
ta=0:0.001:2; 
ZOH=[];
for i=1:N-1
 ZOH=[ZOH ones(1,10)*y(i)];
end
ZOH=[ZOH y(end)];
figure(6)
plot(ta, ZOH)
hold on
plot(n, y);

%%Perdictive first order hold
deltat=0.01; 
n=0:deltat:2; 
y= sin(2*pi*n) + 0.2*cos(12*pi*n);
N=length(n); 
ta=0:0.005:2; 
PFOH=[y(1) y(2) y(3)];
for i=3:N-1
 p=polyfit([n(i-2) n(i-1)],[y(i-2) y(i-1)],1);
 PFOH=[PFOH polyval([p(1) p(2)], n(i))];
 PFOH=[PFOH y(i)];
end
PFOH=[PFOH y(end)];
figure(7)
ta=ta(1:end-1);
plot(ta, PFOH)
hold on
plot(n, y);
%% Acausal First Order hold
deltat=0.01; 
n=0:deltat:2; 
y= sin(2*pi*n) + 0.2*cos(12*pi*n);
N=length(n); 
ta=0:0.005:2; 
FOH=[y(1) y(2) y(3)];
for i=3:N-1
 m=(n(i-1)+n(i))/2;
 p=polyfit([n(i-2) n(i-1)],[y(i-2) y(i-1)],1);
 FOH=[FOH polyval([p(1) p(2)], m)];
 FOH=[FOH y(i)];
end
FOH=[FOH y(end)];
ta=ta(1:end-1);
figure(8)
plot(ta, FOH)
hold on
plot(n, y);

%% LOwpass filter 
clc, clear
figure(9)
rectangle('Position',[1 2 5 6])
axis([0 10 0 10])
rectangle('Position',[-1 0 2 1])
axis([-2 2 0 2])
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

names = {'-2T'; '-T'; '0'; 'T'; '2T'};
set(gca,'xtick',[-2:2],'xticklabel',names)
name1 = {'0'; '1'; '2'};
set(gca,'ytick',[0:2],'yticklabel',name1)

%% Sinc function 
clc, clear
x = -10:0.01:10;
y = sinc(x);
figure(10)
plot(x,y)
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
set(gca,'xtick',[])
set(gca,'xticklabel',[])
name1 = {'0'; '1'};
set(gca,'ytick',[0:2],'yticklabel',name1)
ylim([-.3,1.2]);

%% Reconstruction at 0.017 sampling
clc, clear
F = 1; %Frequency of analog data
Fs = 1/0.017;%sampling Frequency
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
figure(11)
subplot(2,1,1)
plot(t,y)
hold on
h=stem(ts,sampled);
set(h(1),'MarkerFaceColor','blue','MarkerSize',0.1);
subplot(2,1,2)
plot(t,recons)
%% Reconstruction at 0.17 sampling
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
%% Bode plot ZOH
figure(13)
s=tf('s');
Ts=0.017; 
sys=(1-exp(-s*Ts))/s;
bode(sys)
%% Bode plot FOH
figure(14)
s=tf('s');
Ts=0.017; 
sys=((1-exp(-s*Ts))/(Ts*s))^2;
bode(sys)
%% Bode plot PFOH
figure(15)
s=tf('s');
Ts=0.017; 
sys=(1+Ts*s)*((1-exp(-s*Ts))/(Ts*s))^2;
bode(sys)
