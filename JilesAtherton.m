function output = JilesAtherton(n, x, y, c, alpha, S, k, a)
    % Compute Q(x(n), y(n))
    q_val = Q(x(n), y(n));
    
    % Compute L(Q(x(n), y(n))) and Ld(Q(x(n), y(n)))
    L_val = Langevin(q_val);
    Ld_val = Langevin_d(q_val);
    
    % Compute the numerator part of the equation
    numerator = (1 - c) * DeltaY(n) * (S * L_val - y(n));
    
    % Compute the denominator part of the equation
    upperDenominator = (1 - c) * DeltaX(n) * k - alpha * (S * L_val - y(n));
    
    addition = c * (S / a) * Ld_val;

    % Compute the final denominator adjustment term
    lowerDenominator = 1 - c * alpha * (S / a) * Ld_val;
    
    % Compute y(n) using the provided equation
    output = ((numerator / upperDenominator) + addition) / lowerDenominator;
end