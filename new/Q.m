function output = Q(H, M, alpha, a)
    % H = magnetic field
    % M = magnetision
    % alpha = alpha transform
    % a = drive value
    output = (H + alpha*M)/a;
end