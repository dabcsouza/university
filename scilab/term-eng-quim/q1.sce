Tc = [369.9, 408.1, 425.2];
Pc = [42.49, 36.48, 37.97];
wc= [.152, .177, .193];
xi = [0.23, 0.67, 0.1];
F=0;

deff('[ps]=ps(t)','ps=pc*10^(7/3*(w+1)*(1-tc/t))')
function F=fToResolve(t)
    for i=1:length(Tc)
        pc=Pc(i);
        tc = Tc(i);
        w = wc(i);
        F = F + ps(t)*xi(i);
    end
endfunction
function G=fobj(t)
    G = 8 - fToResolve(t)
endfunction
[a,b] = fsolve(298,fobj)

disp(a)
disp(b)
