%% 这里利用weisstrass函数作为测试函数，求解最小值
function y = weierstrass(x)
    a = 0.5;
    b = 3;
    n = 1:100;
    y = arrayfun(@(j) sum((a.^n).*cos((b.^n)*pi*j)), x);
end