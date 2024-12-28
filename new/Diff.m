function output = Diff(x, x1, xD1, alpha, T)
    % trapezoid rule
    xD = (((1+alpha) / T) * (x-x1)) - alpha*xD1;
    
    % set x1 = x and xD1 = xD
    output = [x, xD];
end