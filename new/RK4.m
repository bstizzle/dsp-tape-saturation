function output = RK4(T, dMdt, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c)
    % T = sample rate
    % dMdt = jiles-atherton equation function
    % H = magnetic field
    % Hn1 = previous magnetic field
    % Hd = time derivative of magnetic field
    % Hdn1 = previous time derivative of magnetic field
    % Mn1 = previous magnetisation state

    % JA(M, H, Hd, Ms, a, alpha, k, c)

    k1 = T * dMdt(Mn1, Hn1, Hdn1, Ms, a, alpha, k, c);
    k2 = T * dMdt(Mn1+(k1/2), (H+Hn1)/2, (Hd+Hdn1)/2, Ms, a, alpha, k, c);
    k3 = T * dMdt(Mn1+(k2/2), (H+Hn1)/2, (Hd+Hdn1)/2, Ms, a, alpha, k, c);
    k4 = T * dMdt(Mn1+k3, H, Hd, Ms, a, alpha, k, c);

    M = Mn1 + (k1/6) + (k2/3) + (k3/3) + (k4/6);
    % M =  current magnetisation
    output = M;
end