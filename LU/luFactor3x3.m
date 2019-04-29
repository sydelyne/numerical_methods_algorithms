function [L,U,P] = luFactor(A)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%define vars
r=0;
c=0;
L=zeros(size(A));
U=zeros(size(A));
P=eye(size(A));

%% Matrix dimensions error check
[r,c]=size(A);

if r~=c
    error('Incorrect matrix dimesions');
end

%% define "L" matrix with diagonal 1's
for i=1:r
    L(i,i)=1;
end

%% Calculate stuff ***3X3 ONLY***

% for loop to reassign the "X2" variables every time it runs
%for i=1:r
    
    X1=A(1,:);
    X2=A(2,:);
    X3=A(3,:);

    % pivot A
    A([1 3],:) = A([3 1], :);
    
    % pivot P
    P([1 3],:) = P([3 1], :);
    
    
    % find forward elimination coeff, store in L matrix
    L(2,1)=(A(2,1)/A(1,1));
    L(3,1)=(A(3,1)/A(1,1));
    
    % pivot L
    L([2 3],1)=L([3 2],1);
    
    
    % multiply coeff by equation 1 and subtract altered equation 1 from equation 2
    A(2,:)=A(2,:)-L(3,1)*A(1,:);
    A(3,:)=A(3,:)-L(2,1)*A(1,:);
    
        %% second section
        
        % pivot 2
        
        
        
        
        % find forward elimination coeff, store in L matrix
        L(3,2)=(A(3,2)/A(2,2));
    
        % multiply coeff by equation 1 and subtract altered equation 1 from equation 2
        A(3,:)=A(3,:)-L(3,2)*A(2,:);




U=A;
end

