function output = DelH(Hd)
    % Hd = time derivative of magnetic field
    if Hd > 0 % 1 if H is increasing
        output = 1;
    else % -1 if H is decreasing
        output = -1;
    end
end