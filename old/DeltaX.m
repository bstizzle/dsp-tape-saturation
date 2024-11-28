function output = DeltaX(x, n)
    % if x is increasing, deltaX = 1
    if x(n) > x(n-1)
        output = 1;
    % if x is decreasing, deltaX = -1
    elseif x(n) < x(n-1)
        output = -1;
    end
end