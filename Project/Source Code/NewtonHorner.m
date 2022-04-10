function NewtonHorner (file)
clear
%FILENAME = 'NewtonHornerTest1.txt';
%FILENAME = 'NewtonHornerTest2.txt';
%FILENAME = 'NewtonHornerTest3.txt';
%FILENAME = 'NewtonHornerTest4.txt';
FILENAME = 'NewtonHornerTest5.txt';

%check if we typed in the correct file name

if  exist (FILENAME,'file') == 1
  disp('You typed in the wrong filename')
else


%open data file and read from it
%replace data1 with other data files.

openData = fopen(FILENAME);
data = fscanf(openData,'%f');
fclose(openData);

% n is the highest degree
% divider is the number we divide with for Horner
% error is the tolerance it needs to be under 
% numIterations is the num of iterations before we either terminate the
% loop or find the root if there is one 
n  = data(1);                    
divider = data(numel(data)-2);
error = data(numel(data)-1);            
numIterations = data(numel(data));              

% set flag to false for the loop
flag = false;          

% this is our coeff matrix from the file 
coeff = zeros();
j = 1;
for i = 2:(length(data)-3)
   coeff(j) = data(i);
   %fprintf('%g ', a(j));
   j= j + 1;
end

% we flip coeff to make it easier
flipCoeff = flip ( coeff ); 

% this is the Newton Horner algorithm 
% the first part conducts Horners algorithm 
% then we ehcek it against the error 
% if within our error the flag sets to true and prints out the solution 
% if not then it prints out no solution. 

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


if flag == true
   fprintf('Root: %f\n',currentRoot);
else
   fprintf('No solution found within error tolerance\n');
end
end


