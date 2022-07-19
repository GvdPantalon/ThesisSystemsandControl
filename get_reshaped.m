function [rsA,rsB,rsC,rsD] = get_reshaped(A,B,C,D,N,s)
% Output: reshaped state space matrices
% Input: original state space matrices
rsA = zeros(1,N^2,s);
rsB = zeros(1,N,s);
rsC = zeros(1,N,s);
rsD = zeros(1,1,s);

for i = 1:s
    rsA(:,:,i) = reshape(A(:,:,i),1,[]);
    rsB(:,:,i) = reshape(B(:,:,i),1,[]);
    rsC(:,:,i) = reshape(C(:,:,i),1,[]);
    rsD(:,:,i) = reshape(D(:,:,i),1,[]);
end
end