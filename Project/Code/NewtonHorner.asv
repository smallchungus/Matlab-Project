function NewtonHorner (myFile)
    
    % Check if we typed in the correct file name
    if exist (myFile,'file') == 1
      disp('You typed in the wrong filename')
    else
        % Open data file and read from it
        openData = fopen(myFile);
        data = fscanf(openData,'%f');
        fclose(openData);
        
        % Inputs:
        %   n is the highest degree
        %   divider is the number we divide with for Horner
        %   error is the tolerance it needs to be under 
        %   numIterations is the num of iterations before we either terminate the
        %       loop or find the root if there is one 

        % Parse input:

        % Parse n
        n  = data(1);                

        % Parse divider
        divider = data(numel(data)-2);

        % Parse error
        error = data(numel(data)-1);      

        % Parse numIterations
        numIterations = data(numel(data));              
        
        
        % Parse coefficient matrix
        coeff = zeros();
        j = 1;
        for i = 2:(length(data)-3)
           coeff(j) = data(i);
           j= j + 1;
        end
        
        % Flip coefficient matrix for simplicity
        flipCoeff = flip ( coeff ); 
        
        % Newton Horner algorithm:
        %   first conduct Horners algorithm 
        %   Check it against the error 
        %       if within our error the flag is set to true and we print
        %           out the solution 
        %       if not then it print that no solution was found. 
        
        flag = false;          
        for k = 1:numIterations
            alpha = flipCoeff(1);
            beta = flipCoeff(1);
        
           for i = n:-1:1
               alpha = coeff(i)+alpha*divider;
               if i~=1
                   beta = alpha+ beta*divider;
               end
           end
        
           currentRoot = divider - alpha/beta;     
           currentError = abs(divider - currentRoot); 
        
           if currentError > error
               divider = currentRoot;             
           else
               flag = true;             
               break                  
           end
        end
        
        
        % Print solution if applicable
        if flag == true
           fprintf('Root: %f\n',currentRoot);
        else
           fprintf('No solution found within error tolerance\n');
        end
    end

    % Clear variables for next run
    clear
end

