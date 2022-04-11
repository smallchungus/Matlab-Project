function neville (myFile)
    %check if we typed in the correct file name
    if exist (myFile,'file') == 1
       disp('You typed in the wrong filename')
    else
    
        %open data file and read from it
        %replace data1 with other data files.
        
        openData = fopen(myFile);
        data = fscanf(openData,'%f');
        fclose(openData);
        
        % take input for n, xi, yi, x0
        n = data(1);
        
        % this is the array of points
        x = zeros(n+1, 1);
        y = zeros(n+1, 1);
        for i = 1:n+1
           x(i) = data(2*i);
           y(i) = data((2*i)+1);
        %  fprintf('%g ', a(i));
        end
        x0 = data(1+(2*(n+1))+1);
        
        % evaluate for Pn(x0)
        
        %Inputs: 
        % x0-- the point at which to evaluate
        % n -- the degree of polynomial
        % x -- the matrix of the x terms of the ordered pairs
        % y -- the matrix of the y terms of the ordered pairs
        %Output: p -- the value of the polynomial going through the n data points
        
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

        % Print p
        fprintf('Pn(%.2f) = %.2f', x0, p);
        
    end

    clear
end