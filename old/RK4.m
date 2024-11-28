function M = RK4(T, ja_eq, h, h_n, hd, hd_n, m_n)
    %JilesAtherton(n, x, y, c, alpha, S, k, a)
    k1 = T * ja_eq(m_n, h_n, hd_n);
    k2 = T * ja_eq(n1 + k1/2, (h + h_n)/2, (hd + hd_n)/2);
    k3 = T * ja_eq(m_n + k2/2, (h + h_n)/2, (hd + hd_n)/2);
    k4 = T * ja_eq(m_n + k3, H, H_d);

    M = m_n + (k1 / 6) + (k2 / 3) + (k3 / 3) + (k4 / 6);
end