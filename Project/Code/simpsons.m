function simpsons(file)

    % open data file and read from it  
    openData = fopen(file);
    data = fscanf(openData,'%c');
    fclose(openData);
    
    %splits string by /n breaks
    newStr = splitlines(data);
    %f = equation
    f = inline(string(newStr(1)), 'x');
    %upperbound
    a = str2double(newStr(2));
    %lowerbound
    b = str2double(newStr(3));
    %interval
    n = str2double(newStr(4));



%     interval = data(numel(data));
%     upper_bound = data(numel(data)-1)
%     lower_bound = data(numel(data)-2)
%     str = data(numel(data)-lower_bound);
%     eq = inline(str,'x');
%     
% disp('poop', eq);
% disp(str);
% disp(interval);
% disp(upper_bound);
% disp(lower_bound);
% disp(numel(data(1)));




    %calculating value of h
    h = (b-a)/n ;
    x = zeros(1,n+1);
    x(1) = a ;
    x(n+1) = b ;
    p =0;
    q = 0 ;
    r=0;
    %finding all the interval
    for i = 2:n
        x(i) = a + (i-1) * h ;
    end
    %calculating function value
    if n>2
    for i = 2:3:n
        p = p + (feval(f,x(i)));
    end
    end
    if n>3
        for i=3 :3:n
            q = q + (feval(f,x (i)));
        end
    end
    if n>4
        for i=4 :3:n
            r = r + (feval(f,x (i)));
        end
    end
    %finding the answer from the composite formula
    ans = (3*h/8) *(feval(f,a) +3*q +3 *p+2*r +feval(f,b))
    

%   disp(newStr);
     disp(f);
     disp(a);
     disp(b);
     disp(n);


