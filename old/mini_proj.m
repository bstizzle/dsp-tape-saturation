%% Plot the Langevin functions
% L(x) = coth(x) - (1/x)
% L'(x) = 1 - coth(x)^2 + (1/x^2)

figure;  % Create a new figure window
plotLangevin(@Langevin, 10);  % Plot the function L with range 10
hold on;  % Hold the current plot
plotLangevin(@Langevin_d, 10);  % Plot the function L_d with range 10
legend('L', 'L''');  % Add legend
xlabel('Input Gain');  % Label for x-axis
ylabel('Output Gain');  % Label for y-axis
title('L and L'' Nonlinearities');  % Title of the plot

%% Implement the trapezoidal rule
% gets the derivative of the input, x'
% x'(n) = 2*fs*(x(n) - x(n-1) - x'(n-1));

fs = 44100;
x = zeros(fs, 1);

x_d = TrapRule(x, fs);

plot(x_d, fs)

%% Implement the Jiles-Atherton equation
fs = 44100;
dt = 1/fs;
t = 0:dt:1;

S = [0, 0.33, 0.67, 1];

T = 1.0 / fs;
M_s = 1.0;
a = M_s / 4.0;
alpha = 1.6e-3;
k = 0.47875;
c = 1.7e-1;

nc = 1 - c;
M_s_oa = M_s / a;
M_s_oa_tc = c * M_s / a;
M_s_oa_tc_talpha = alpha * c * M_s / a;
M_s_oaSq_tc_talpha = alpha * c * M_s / (a * a);
M_s_oaSq_tc_talphaSq = alpha * alpha * c * M_s / (a * a);

