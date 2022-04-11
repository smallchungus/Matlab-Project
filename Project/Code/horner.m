function horner (myFile)

    % Check if we typed in the correct file name
    if exist (myFile,'file') == 1
       disp('You typed in the wrong filename')
    else
    
        % Open data file and read from it
        openData = fopen(myFile);
        data = fscanf(openData,'%f');
        fclose(openData);
    
        % Notes:
        %   First number is n, the highest degree polynomial
        %   then list of coefficients in increasing order
        %   then xo the divider
        
        % Get n
        n = data(1) + 1;
        
        % Get array of coeffecients
        a = zeros();
        for i = 1:n
           a(i) = data(n+2-i);
        end
        
        
        % Get the number we divide by
        divider = data(numel(data));
    
        % Edge cases:
        if i == 0 
            disp ('P(0) = 0');
        elseif i == 1 
            disp ('P(0) = 0');
        else

            % Notes
            %   a is the vector of coefficients 
            %   divider is the number we divide with 
            %   returns remainder which is the remainder after synt division 
            %   count is used to keep track of factorial multiplication
            
            coeff = zeros(n,1); 
            coeff(1) = a(1);
            count = 0;
            for i = n:-1:2
                % Calculate count and remainder
                for k=2:1:n
                    coeff(k)=a(k)+coeff(k-1)*divider;
                end
                remainder = coeff(i)*factorial(count);
                count = count + 1; 

                % Update a
                a = coeff(1:n);

                % Print count and remainder
                fprintf('P(%d) = %f \n', count, remainder);
            
            end
        end
    end

    % Clear variables for next run
    clear
end
