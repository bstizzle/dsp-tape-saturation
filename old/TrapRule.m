function output = TrapRule(x, fs)
    x_d = zeros(size(x));
    for n = 1:size(x)
        if n <= 1
            x_d(n) = 2*fs*x(n);
        else
            x_d(n) = 2*fs*(x(n) - x(n-1)) - x_d(n-1);
        end
    end
    output = x_d;
end
%{
function output = TrapRule(x, fs)
    if n <= 1
        x_d(n) = 2*fs*x(n);
    else
        x_d(n) = 2*fs*(x(n) - x(n-1)) - x_d(n-1);
    end
end
%}