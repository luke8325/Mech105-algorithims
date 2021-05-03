function [I] = simp13(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated
lenx=length(x);
leny=length(y);
uni=diff(x);
h=uni(1);

if lenx ~= leny
    error( "Vector of X-values must be the same length of the vector of Y-values")
elseif nargin ~= 2
    error( "Incorrect number of input arguments")
elseif all(uni == uni(1)) == 0
    error("Values of X-vector are not equally spaced")
end
if lenx<4
    if lenx == 3
        I=(h/3)*(y(1) + 4*y(2) + y(3));
    elseif lenx == 2
        warning("Trapezoidal rule will be used because there are only 2 data points")
        I = (x(2) - x(1)) * (y(1)+y(2))/2;
    end
    
elseif lenx>=4
    sumodd=0;
    sumeven=0;
    lenx1=lenx;
    if rem(leny,2) == 0
        leny=leny-1;
        lenx1=lenx-1;
    end
    for n=2:1:lenx1-1
        if rem(n,2)==1
            sumodd=sumodd+y(n);
        else
            sumeven=sumeven+y(n); 
        end
    end
    I=(h/3)*(y(1)+y(leny)+(4*sumeven)+(2*sumodd));
    if rem(lenx,2) == 0
       warning("Trapezoidal rule will be used for the last interval because there are an odd number of intervals")
       I=I+(h*(y(leny+1)+y(leny))/2);
    end
end
end

