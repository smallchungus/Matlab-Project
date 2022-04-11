function neville (myFile)
    % Inputs: 
    %   x0-- the point at which to evaluate
    %   n -- the degree of polynomial
    %   x -- the matrix of the x terms of the ordered pairs
    %   y -- the matrix of the y terms of the ordered pairs
    % Output: 
    %   p -- the value of the polynomial going through the n data points
        
    % Check if we typed in the correct file name
    if exist (myFile,'file') == 1
       disp('You typed in the wrong filename')
    else
    
        % Open data file and read from it
        openData = fopen(myFile);
        data = fscanf(openData,'%f');
        fclose(openData);
        
        % Parse input:

        % Parse n
        n = data(1);
        
        % Parse the array of points
        x = zeros(n+1, 1);
        y = zeros(n+1, 1);
        for i = 1:n+1
           x(i) = data(2*i);
           y(i) = data((2*i)+1);
        end

        % Parse x0
        x0 = data(1+(2*(n+1))+1);
        
        % Evaluate for Pn(x0):
        
        % creates the zero matrix p
        p = zeros(n+1,n+1);
    
        % Set p's diagonal values to equal y's values
        for i = 1:n+1
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
    
        % Output the value of the polynomial going through the
        %   n data points at the point x0
        p = p(1,n+1);
        fprintf('Pn(%.2f) = %.2f', x0, p);
        
    end

    % Clear variables for next run
    clear
end