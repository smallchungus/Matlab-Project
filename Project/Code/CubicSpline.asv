function CubicSpline(file)
% we open the file and read from it 
% to run the program CubicSpline('CubicSplineTest1.txt')
openData = fopen(file);
data = fscanf(openData,'%f');
fclose(openData);

%n is the number of points in the file and the first numebr 
% then we input the x and y matrices which x is every even number 
% and the y matrix is ever odd numebr 
n  = data(1);
x = []; 
y = [];
for i = 1:n
    x = [x data(2*i)];
    y = [y data(2*i+1)];
end

lengthX = length(x);
lengthY = length(y);

% if ( lengthX ~= lengthY )
%     error ("You entered an uneven number of points ");
% end

% we start with the tridiagnonal matrix 
% and start computations regarding that 
a = y;
h = [];
for i = 1:n-1
    hi = x(i+1)-x(i);    
    h = [h hi];
end


C = zeros(n,1);
N = zeros(n-1);
N(1,1) = 1;
H = zeros(n-1);  
H(1,1) = 1;
H(n,n) = 1;

for i = 1:n
%     hi = x(i+1)-x(i);    
%     h = [h hi];
    for j = 1:n
        if (i > 1 && j == i && i < n)
            H(i,j) = 2*(h(i-1)+h(i));
            N(i,i) = N(i+1);
            N(i,i-1) = N(i, i-1);
            if i>1 H(i,j-1) = h(i-1); end
            if i<n-1 H(i,j+1) = h(i); end
        end
    end
end

% we start getting the coefficients of a, b, c, d 
A = zeros(n,1);
for i = 1:n
    if (i > 1 && i < n)
        A(i) = 3*(a(i+1)-a(i))/h(i) - 3*(a(i)-a(i-1))/h(i-1);
    end
end

C = inv(H)*A;
B = zeros(n,1);
D = zeros(n,1);
for i = 1:n-1
    B(i) = ((a(i+1) - a(i))/h(i)) - (2*C(i) + C(i+1))*h(i)/3;
    D(i) = (C(i+1)-C(i))/(3*h(i));
end


% we print out the coefficients 
fprintf('Coefficients of n-1 polynomials. The coefficients of each polynomial in a row separated by spaces. \n');
for i = 1:n-1
    fprintf('\n%f %f %f %f %f. \n',a(i),B(i),C(i),D(i));
end

% we plot x and y first because yy depends on y so it changes the value
plot(x,y,'o');
hold on; 
grid on;
nm = 1;
xn = zeros(n,1);

% we get the interval and do the final computation for yy 
% and we plot the graph 
for i = 1:n-1
    xx = linspace(x(i),x(i+1));
    N(i) = h(i);
    y = [];
    for j = 1:numel(xx)
            if and(x(i)<=xx,xx<=x(i+1))
                y = [y a(i) + B(i)*(xx(j) - x(i)) + C(i)*(xx(j) - x(i))^2 + D(i)*(xx(j) - x(i))^3];
            end
    end
    plot(xx,y);
end
fprintf('\n');