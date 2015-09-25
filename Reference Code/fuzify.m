function a= fuzify(M,xstar)
% Usage: a= fuzify(M,xstar)
% rule activation strength evaluation
% assume universe of course is x in [0 100], with 100 divisions
% assume odd number equal divisions of triangular fuzzy sets: M
% given an input xstar, return the M by 1 fuzzy vector


a=zeros(1,M);
if xstar < 0 | xstar > 100,
  disp(' xtart value out of range')
  break
end
if xstar==0,
    a(1)=1;
elseif xstar==100,
    a(M)=1;
else  % 1 <= xstar <= 99
   tmp=xstar*(M-1)/100;
   istar=floor(tmp)+1;   %  1 <= istar <= M-1
   a(istar) = 1 - mod(tmp,1);
   a(istar+1)= 1 - a(istar);
end