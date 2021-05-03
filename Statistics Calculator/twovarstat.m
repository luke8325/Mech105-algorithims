function [m, y0, COD] = twovarstat(x,y)
%twovarstat calculates the slope (m), y-intercept (y0) and Coefecient of Determination or r^2 (COD) of tabulated data
%input x- vector of x values
%input y- vector of respective y values
lenx=length(x);
leny=length(y);

if lenx ~= leny
    error( "Vector of X-values must be the same length of the vector of Y-values")
elseif nargin ~= 2
    error ("Wrong number of input arguments")
end
mean_x=mean(x);
mean_y=mean(y);
len_x=length(x);
sum_Top=0;
sum_Bottom=0;
sum_y=0;
s_r_line=0;
s_r_point=0;
for n=1:1:len_x
    sum_Top=sum_Top+((x(n)-mean_x)*(y(n)-mean_y));
    sum_Bottom=sum_Bottom+((x(n)-mean_x)^2);
end
m=sum_Top/sum_Bottom;
for n=1:1:len_x
    sum_y=sum_y+((y(n)-m*x(n)));
end
y0=sum_y/n;
for n=1:1:len_x
    s_r_line=s_r_line+(y(n)-y0-(m*x(n)))^2;
    s_r_point=s_r_point+(y(n)-mean_y)^2;
end
COD=(s_r_point-s_r_line)/s_r_point; %(r^2)

end


