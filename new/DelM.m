function output = DelM(Mdiff, delta)
    % Mdiff = 
    % 1 if delta of H and L(Q)-y have the same sign
    if sign(delta) == sign(Mdiff)
        output = 1;
    % else 0
    else
        output = 0;
    end
end