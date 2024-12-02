fs = 44100;
seconds = 1;
t = 0:1/fs:seconds;
freq = 100;

x = sin(2*pi*freq*t);

sat = [0, 0.33, 0.66, 1, 1.5];
drive = [0, 0.33, 0.66, 1, 1.5];
width = [0, 0.33, 0.66, 1, 1.5];

alpha = 1.6e-3;
k = 30 * (1-0.5)^6 + 0.01; % coercivity

figure;  % Create a new figure window
hold on;  % Hold the current plot
for n=1:length(sat)
    y = Hsys(x, sat(n), drive(4), width(4), alpha, k, fs);
    plot(x, y);
end
legend('0', '0.33', '0.66', '1', '1.5');  % Add legend
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
legend('0', '0.33', '0.66', '1', '1.5');  % Add legend
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
legend('0', '0.33', '0.66', '1', '1.5');  % Add legend
xlabel('Input Gain');  % Label for x-axis
ylabel('Output Gain');  % Label for y-axis
title('Hysteresis Simulation: Width');  % Title of the plot
hold off;