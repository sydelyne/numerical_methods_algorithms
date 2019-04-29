%%%%%%% DOES NOT WORK

function [L,U,P] = luFactor(A)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%define vars
r=0;
c=0;
L=eye(size(A));
U=A;
P=eye(size(A));

%% Matrix dimensions error check
[r,c]=size(A);

if r~=c
    error('Incorrect matrix dimesions');
end

%% define pivot vertical matrix of counting coefficients
piv=zeros(r);
for b=1:r
    piv(:,b)=[1:r]
end

%% Calculate stuff ***ANY SIZE***

% Counts the row iteration being evaluated
for a = 1:r-1
    
        % set Y,I to max of U from the current row iteration to the end
        [Y,I]=max(abs(U(a:r,:)));

        % because we excluded the finished row(s), check to see if the
        % position+a-1 equals the a value (row we're on)
        if I(a)~=1
            % switch the rows of U & P matrices that need to be switched
            U([a I(a)+a-1],:) = U([I(a)+a-1 a],:);
            P([a I(a)+a-1],:) = P([I(a)+a-1 a],:);
            
            % if we're on the first row 
            if a ~= 1
                piv([a I(a)+a-1],a) = piv([I(a)+a-1 a],a);
            end
        end
    
    for j = a:r-1

        % find forward elimination coeff, store in L matrix only if the
        % first spot is not already 0
        if U(a,a) ~= 0
            L(j+1,a)=(U(j+1,a)/U(a,a));
        end
        
        % multiply coeff by equation 1 and subtract altered equation 1 from equation 2
        U(j+1,:)=U(j+1,:)-L(j+1,a)*U(a,:);
    end
    
end


keepL=L;


% pivot L only if pivoting actually occured. L will never be pivoted in the
% last two columns
if ~isequal(piv,[1:r])
    %column iteration
    for n=1:r-2
        %row iteration
        for m=n:r
            % piv(m) cant equal m because then it's already in the right
            % place. m cant equal n because L(m,m) is always 1. piv(m)
            if piv(m)~=m && m~=n
                L(m,n)=keepL([piv(m)],n);
            end
        end
    end
end

end