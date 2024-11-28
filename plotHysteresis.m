function [x, y] = plotHysteresis(c, alpha, S, k, a, fs)
    n = 0:fs;
    x = sin(2 * pi * n * 100 / fs)';
    y = x;
    for n=2:size(n)
        y(n) = JilesAtherton(n, x, y, c, alpha, S, k, a);
    end
    plot(x(1001:end), y(1001:end))
    
    % Add labels and title
    xlabel('Input Gain');
    ylabel('Output Gain');
    title('Hysteresis Simulation');
end