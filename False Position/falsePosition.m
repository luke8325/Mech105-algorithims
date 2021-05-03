function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
if nargin <3
    error('Please input at least the function, the lower guess, and the upper guess.')
end
if nargin >6
    error('Too many input arguments')
end
if xl>xu
    error('Lower bound must be less than upper bound')
end
sign_test = func(xl)*func(xu);
if sign_test>0
    error('No sign change, function does not cross x-axis between xl and xu')
end

if nargin<4
    es=0.0001;
end
if nargin<5
    maxit=200;
end
iter=0;xr=xl;
while(1)
    xr_prev=xr;
    xr=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    iter=iter+1;
   if xr~=0
       ea=abs((xr-xr_prev)/xr) * 100;
   end
    %test for sign change again
    sign_test2=func(xl)*func(xr);
    if sign_test2<0
        xu=xr;
    elseif sign_test2>0
        xl=xr;
    else
        ea=0;
    end
    
    if ea<=es || iter>= maxit
        break,end
    
end

fx=func(xr);
root=xr;
end
% %Code to call
% testFunc = @(x) Function; 
% x_left = xl;
% x_right = xu;
% [root, fx, ea, iter] = falsePosition(test, x_left, x_right)
