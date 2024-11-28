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

plot(x, y);
xlabel('Input Gain');
ylabel('Output Gain');
title('Hysteresis Simulation');