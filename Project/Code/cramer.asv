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

        % take inputs

        % Matrix size
        n = data(1);
        % Co-efficient matrix
        coef = zeros([n n]);
        % Constant vector
        cons = zeros([n 1]);
        
        % accept values
        for i=1:n
            for j=1:n
                coef(i,j)=data(1 + ((i-1)*n)+j);
            end
        end
        
        for i=1:n
            cons(i,1)=data(1 + (n*n) + i);
        end

        n
        coef
        cons
        
        % calculations according to cramer's rule
        det_A=det(coef);
        det_A1=det([cons coef(:,2:3)]);
        det_A2=det([coef(:,1) cons coef(:,3)]);
        det_A3=det([coef(:,1:2) cons]);
        fprintf('determinant A = %d\n',det_A);
        fprintf('determinant A1 = %d\n',det_A1);
        fprintf('determinant A2 = %d\n',det_A2);
        fprintf('determinant A3 = %d\n',det_A3);
        x1=det_A1/det_A;
        x2=det_A2/det_A;
        x3=det_A3/det_A;
        fprintf('x1 = %d\n',x1);
        fprintf('x2 = %d\n',x2);
        fprintf('x3 = %d\n',x3);
    end
    clear
end