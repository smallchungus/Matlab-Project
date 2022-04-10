
% take input for n, xi, yi, x0
in = input('');
n = in(1);
x = zeros(n+1, 1);
y = zeros(n+1, 1);

% loop for n+1 times
for i=1:n+1
    x(i) = in(2*i);
    y(i) = in(2*i + 1);
end
x0 = in(2*(n+2));

% evaluate and print results for Pn(x0)
p = nevilles(n, x0, x, y);
fprintf('Pn(x0) = %.2f', p);

%Inputs: 
% x0-- the point at which to evaluate
% n -- the degree of polynomial
% x -- the matrix of the x terms of the ordered pairs
% y -- the matrix of the y terms of the ordered pairs
%Output: p -- the value of the polynomial going through the n data points

function p = nevilles(n,x0,x,y)

    % creates the zero matrix p
    p = zeros(n+1,n+1);

    % runs loop from i equals 1 until it reaches end value
    for i = 1:n+1
        % when i is equal to j, set the element equal to the corresponding y value
        p(i,i) = y(i);
    end

    % runs loop from j equal to 1 until it reaches end value
    for j = 1:n+1
        % runs loop from j equal to 1 until it reaches end value
        for i = 1:n+1-j

        % evaluates each element of the matrix, when i is not equal to j,
        % using Neville's Algorithm
        p(i,i+j) = ((x(i+j)-x0)*p(i,i+j-1) + (x0-x(i))*p(i+1,i+j))/(x(i+j)-x(i));
        end
    end

    % outputs the value of the polynomial going through the
    % n data points at the point x0

    p = p(1,n+1);
end
