function output = JA(M, H, Hd, Ms, a, alpha, k, c)
    % M = magnetision
    % H = magnetic field
    % Hd = time derivative of magnetic field
    % sat = saturation parameter
    % drive = drive parameter
    % width = width parameter
    
    q = Q(H, M, alpha, a); 
    Mdiff = Ms * L(q) - M;
    l = Ld(q);
    deltaH = DelH(Hd);
    deltaM = DelM(Mdiff, deltaH);
    
    % 1 - c*alpha*(Ms/a)Ld(Q)
    denominator = 1 - c * alpha * (Ms/a) * l;
    
    % (1-c)*dM*(Ms*L(Q)-M)
    t1_num = (1 - c) * deltaM * Mdiff;
    % (1-c)*dH*k-alpha*(Ms*L(Q)-M)
    t1_den = (1 - c) * deltaH * k - a * Mdiff;
    % ((1-c)*dM*(Ms*L(Q)-M)/(1-c)*dH*k-alpha*(Ms*L(Q)-M))*Hd
    t1 = (t1_num / t1_den) * Hd;
    
    % c*(Ms/a)*Hd*Ld(Q)
    t2 = c * (Ms / a) * Hd * l;
    
%{ 
full equation
    (1-c)*dM*(Ms*L(Q)-M)     
( ---------------------------- ) * Hd + c*(Ms/a)*Hd*Ld(Q)
  (1-c)*dH*k-alpha*(Ms*L(Q)-M) 
----------------------------------------------------------
                1 - c*alpha*(Ms/a)Ld(Q)
%}
    fullEquation = (t1 + t2) / denominator;

    output = fullEquation;
end