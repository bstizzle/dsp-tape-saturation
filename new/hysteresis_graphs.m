fs = 44100;
seconds = 1;
t = 0:1/fs:seconds;
freq = 100;

x = sin(2*pi*freq*t)';

sat = [0, 0.33, 0.66, 1, 1.33];
drive = [0, 0.33, 0.66, 1, 1.33];
width = [0, 0.33, 0.66, 1, 1.33];

alpha = 1.6e-3;
k = 30 * (1-0.5)^6 + 0.01; % coercivity

figure;  % Create a new figure window
hold on;  % Hold the current plot
for n=1:length(sat)
    y = Hsys(x, sat(n), drive(4), width(4), alpha, k, fs);
    plot(x, y);
end
legend('0', '0.33', '0.66', '1', '1.33');  % Add legend
xlabel('Input Gain');  % Label for x-axis
ylabel('Output Gain');  % Label for y-axis
title('Hysteresis Simulation: Saturation');  % Title of the plot
hold off;

figure;  % Create a new figure window
hold on;  % Hold the current plot
for n=1:length(sat)
    y = Hsys(x, sat(4), drive(n), width(4), alpha, k, fs);
    plot(x, y);
end
legend('0', '0.33', '0.66', '1', '1.33');  % Add legend
xlabel('Input Gain');  % Label for x-axis
ylabel('Output Gain');  % Label for y-axis
title('Hysteresis Simulation: Drive');  % Title of the plot
hold off;

figure;  % Create a new figure window
hold on;  % Hold the current plot
for n=1:length(sat)
    y = Hsys(x, sat(4), drive(4), width(n), alpha, k, fs);
    plot(x, y);
end
legend('0', '0.33', '0.66', '1', '1.33');  % Add legend
xlabel('Input Gain');  % Label for x-axis
ylabel('Output Gain');  % Label for y-axis
title('Hysteresis Simulation: Width');  % Title of the plot
hold off;

shortX = sin(2*pi*8*t)';
xClip = symmclip(shortX, 1/3);
figure;
hold on;
subplot(2,1,1);
plot(shortX);
title('Dry Signal');
subplot(2,1,2);
plot(xClip);
title('Applied Symmetrical Soft Clipping');
hold off;
%%
gainSweep = linspace(0, 1, 1000);
xComp = compr(gainSweep, -0.4, 0.7);
figure;
plot(gainSweep, gainSweep)
hold on;
plot(gainSweep, xComp)
legend('Dry Signal', 'Compression');
%{
subplot(2,1,1);
plot(gainSweep);
title('Dry Signal');
subplot(2,1,2);
plot(gainSweep,xComp);
title('Applied Compression');
%}
hold off;
%%
[gtr, gFs] = audioread("clean_gtr_blues.wav");

gtrHys = Hsys(gtr, 1, 1, 1, alpha, k, gFs);
gtrHysClip = symmclip(gtrHys, 1/3);
gtrHysClipComp = compr(gtrHysClip, -0.4, 0.7);

figure;
hold on;
subplot(4,1,1);
plot(gtr);
title('Dry Signal');
ylim([-1 1]);
subplot(4,1,2);
plot(gtrHys);
title('Applied Hysteresis');
ylim([-1 1]);
subplot(4,1,3);
plot(gtrHysClip);
title('Applied Hysteresis & Sym. Soft Clipping');
ylim([-1 1]);
subplot(4,1,4);
plot(gtrHysClipComp);
title('Applied Hysteresis & Sym. Soft Clipping & Compression');
ylim([-1 1]);
hold off;

%% play sounds

[gtr, gFs] = audioread("clean_gtr_blues.wav");

gtrHys = Hsys(gtr, 1, 1, 1, alpha, k, gFs);
gtrHysClip = symmclip(gtrHys, 1/3);

soundsc(gtrHysClip, gFs);