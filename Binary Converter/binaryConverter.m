function [base2] = binaryConverter(base10)
%binary A simple function to convert a positive, real base10 number to binary
%   Inputs:
%       base10 - A positive number in base10
%   Outputs:
%       base2 - The base10 number converted to binary
if nargin > 1
    error('This function only takes one input value')
elseif base10<0
    error('Please enter a positive number')
end
if base10==0
    base2=0;
elseif base10==1
    base2=1;
elseif base10==2
    base2=[1 0];
else
    x=0;
    exponent=2^x;
    while base10>exponent
        exponent=2^x;
        x=x+1;
    end
    x=x-1;
    new_base = 2;
    for k=x:-1:1
        remainder=mod(base10,2);
        base10= floor(base10./new_base);
        base2(k+1)=remainder;
    end
    base2=base2(2:length(base2));
end


end
    

