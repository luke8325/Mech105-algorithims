function [L, U, P] = luFactor(a)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = Square coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix

%%Define Variables
a_pivot=a;
d=length(a);
P=eye(d);
[r,c]=size(a);
L=zeros(r,c);
U=zeros(r,c);

%Error Testing
if r~=c
    error('Input must be a square matrix')
elseif nargin>1
    error('This function only takes one input')
elseif nargin<1
    error('Please inpit a square matrix for this function to work')
end


for n=1:c-1
  [~,b] = max(abs(a_pivot(n:c,n)));
  row_op = b + n - 1;
  if row_op~= n
    a_pivot([n row_op],:) = a_pivot([row_op n],:);
    P([n row_op],:) = P([row_op n],:);
    L([n row_op],:) = L([row_op n],:);
  end
  U(1,:)=a_pivot(1,:);
  for E=n+1:c
      f_factor= a_pivot(E,n)/a_pivot(n,n);
      L(E,n)=f_factor;
      a_pivot(E,n:c)=a_pivot(E,n:c)-(f_factor*a_pivot(n,n:c));
      
  end
  U=a_pivot;   
end
for n=1:c
L(n,n)=1;
end
end
