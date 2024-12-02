fs = 44100;
seconds = 1;
t = 0:1/fs:seconds;
freq = 100;

x = sin(2*pi*freq*t);
y =  zeros(size(x));

x1 = 0.0;
xD1 = 0.0;

% set parameters
sat = 1;
drive = 1;
width = 1;

% set constants
Ms = 0.5 + 1.5*(1-sat); % changes saturation
a = Ms / (0.01 + 6*drive); % changes drive/overdrive
alpha = 1.6e-3;
k = 30 * (1-0.5)^6 + 0.01; % coercivity
c = (1-width)^0.5 - 0.01; % changes slope

% initialize magnetization states
Mn1 = 0;
Hn1 = 0;
Hdn1 = 0;

for n=2:length(x)
    H = x(n);

    % Diff(x, x1, xD1, alpha, T)
    diffArray = Diff(H, x1, xD1, alpha, fs);
    x1 = diffArray(1);
    xD1 = diffArray(2);
    Hd = diffArray(2);

    % RK4(T, dMdt, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c)
    M = RK4(fs, @JA, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c);
    
    Mn1 = M;
    Hn1 = H;
    Hdn1 = Hd;

    y(n) = M;
end

x1 = 0.0;
xD1 = 0.0;

sat = 0.7;
Ms = 0.5 + 1.5*(1-sat); % changes saturation
y2 = zeros(size(x));

for n=2:length(x)
    H = x(n);

    % Diff(x, x1, xD1, alpha, T)
    diffArray = Diff(H, x1, xD1, alpha, fs);
    x1 = diffArray(1);
    xD1 = diffArray(2);
    Hd = diffArray(2);

    % RK4(T, dMdt, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c)
    M = RK4(fs, @JA, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c);
    
    Mn1 = M;
    Hn1 = H;
    Hdn1 = Hd;

    y2(n) = M;
end

x1 = 0.0;
xD1 = 0.0;

sat = 0.3;
Ms = 0.5 + 1.5*(1-sat); % changes saturation
y3 = zeros(size(x));

for n=2:length(x)
    H = x(n);

    % Diff(x, x1, xD1, alpha, T)
    diffArray = Diff(H, x1, xD1, alpha, fs);
    x1 = diffArray(1);
    xD1 = diffArray(2);
    Hd = diffArray(2);

    % RK4(T, dMdt, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c)
    M = RK4(fs, @JA, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c);
    
    Mn1 = M;
    Hn1 = H;
    Hdn1 = Hd;

    y3(n) = M;
end

figure;  % Create a new figure window
plot(x, y);
hold on;  % Hold the current plot
plot(x, y2);  % Plot the function L_d with range 10
plot(x, y3);
legend('sat = 1', 'sat = 0.7', 'sat = 0.3');  % Add legend
xlabel('Input Gain');  % Label for x-axis
ylabel('Output Gain');  % Label for y-axis
title('Hysteresis Simulation');  % Title of the plot
hold off;

[gtr, gFs] = audioread("clean_gtr_blues.wav");

x1 = 0.0;
xD1 = 0.0;
sat = 1;
Ms = 0.5 + 1.5*(1-sat); % changes saturation

gtrSat1 = zeros(size(gtr));

for n=2:length(gtr)
    H = gtr(n);

    % Diff(x, x1, xD1, alpha, T)
    diffArray = Diff(H, x1, xD1, alpha, gFs);
    x1 = diffArray(1);
    xD1 = diffArray(2);
    Hd = diffArray(2);

    % RK4(T, dMdt, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c)
    M = RK4(fs, @JA, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c);
    
    Mn1 = M;
    Hn1 = H;
    Hdn1 = Hd;

    gtrSat1(n, 1) = M;
    gtrSat1(n, 2) = M;
end

x1 = 0.0;
xD1 = 0.0;
sat = 0.7;
Ms = 0.5 + 1.5*(1-sat); % changes saturation

gtrSat2 = zeros(size(gtr));

for n=2:length(gtr)
    H = gtr(n);

    % Diff(x, x1, xD1, alpha, T)
    diffArray = Diff(H, x1, xD1, alpha, gFs);
    x1 = diffArray(1);
    xD1 = diffArray(2);
    Hd = diffArray(2);

    % RK4(T, dMdt, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c)
    M = RK4(fs, @JA, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c);
    
    Mn1 = M;
    Hn1 = H;
    Hdn1 = Hd;

    gtrSat2(n, 1) = M;
    gtrSat2(n, 2) = M;
end

x1 = 0.0;
xD1 = 0.0;
sat = 0.3;
Ms = 0.5 + 1.5*(1-sat); % changes saturation

gtrSat3 = zeros(size(gtr));

for n=2:length(gtr)
    H = gtr(n);

    % Diff(x, x1, xD1, alpha, T)
    diffArray = Diff(H, x1, xD1, alpha, gFs);
    x1 = diffArray(1);
    xD1 = diffArray(2);
    Hd = diffArray(2);

    % RK4(T, dMdt, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c)
    M = RK4(fs, @JA, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c);
    
    Mn1 = M;
    Hn1 = H;
    Hdn1 = Hd;

    gtrSat3(n, 1) = M;
    gtrSat3(n, 2) = M;
end

figure;
subplot(4,1,1);
plot(gtr);
ylim([-1 1])
legend('dry');
subplot(4,1,2);
plot(gtrSat1);
ylim([-1 1])
legend('sat = 1');
subplot(4,1,3);
plot(gtrSat2);
ylim([-1 1])
legend('sat = 0.7');  % Add legend
subplot(4,1,4);
plot(gtrSat3);
ylim([-1 1])
legend('sat = 0.3');  % Add legend
