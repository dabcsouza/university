clear all
clc
function ps = ps(t, i)
  Tc = [369.9, 408.1, 425.2];
  Pc = [42.49, 36.48, 37.97];
  wc= [.152, .177, .193];
  ps=Pc(i)*10^(7/3*(wc(i)+1)*(1-Tc(i)/t));
endfunction

function fobj = fobj(t)
  xi = [0.23, 0.67, 0.1];
  F=0;
  for i=1:length(xi);
    F = F + xi(i)*ps(t,i);
  endfor
  fobj=8-F;
endfunction

[a,b]=fzero(@fobj,300);
disp([a,b]);
fobj(317.639)