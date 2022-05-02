function LeastSquares(file)

% open data file and read from it  
openData = fopen(file);
data = fscanf(openData,'%f');
fclose(openData);

% numberOfPoints tells us numebr of points in file
% degree is degree of the desired polynomial 
numberOfPoints  = data(1);
degree  = data(2);

% we create the input matrix that contains 
% both x and y from the file
x = [];
y = [];
for i = 1:numberOfPoints
    x = [x data(2*i+1)];
    y = [y data(2*i+2)];
end

% the least squares algorithm to find the least squares 
% approximation and then we take the inverse matrix and 
% multiply it by b 
M=[10, sum(x), sum(x.^2), sum(x.^3);
sum(x), sum(x.^2), sum(x.^3), sum(x.^4);
sum(x.^2), sum(x.^3), sum(x.^4), sum(x.^5);
sum(x.^3), sum(x.^4), sum(x.^5), sum(x.^6)];
b=[sum(y);sum(y.*x);sum(y.*(x.^2));sum(y.*(x.^3))];
a=inv(M)*b;

% we print out the coefficients of the polynomial 
% and we print out the plto of the graph 
fprintf('The coefficients of the polynomial, separated by spaces: \n')
fprintf('%f, %f, %f, %f, %f. \n', a(1), a(2), a(3), a(4));

xx=[0:0.1:9];
yy=a(1) + a(2)*xx + a(3)*xx.^2 + a(4)*xx.^3;
plot(xx,yy,x,y,'*');
fprintf('\n');
clear