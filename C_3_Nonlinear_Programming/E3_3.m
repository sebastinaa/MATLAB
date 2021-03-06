clc,clear;
syms x y % Declare symbolic variables
f=x^3-y^3+3*x^2+3*y^2-9*x;
df=jacobian(f);
d2f=jacobian(df);
[xx,yy]=solve(df);
xx=double(xx);yy=double(yy);
for i=1:length(xx)
    a=subs(d2f,{x,y},{xx(i),yy(i)});% substitude {x,y} with {xx(i),yy(i)}
    b=eig(a); %Eigenvalues
    ff=subs(f,{x,y},{xx(i),yy(i)}); ff=double(ff);
    if all(b>0) %if a positive definite matrix
        fprintf('(%f,%f) is a minimal point,whose value is %f \n',xx(i),yy(i),ff);
    elseif all (b<0) %negetive definite
        fprintf('(%f,%f) is a maximal point,whose value is %f \n',xx(i),yy(i),ff);
    elseif any(b>0) && any(b<0)
        fprintf('(%f,%f) is not a extreme point\n',xx(i),yy(i));
    else 
        fprintf('Can not determine whether (%f,%f) is extreme points\n',xx(i),yy(i));
    end
end