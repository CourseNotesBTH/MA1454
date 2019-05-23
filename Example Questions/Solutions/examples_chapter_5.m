%% 5.2
clear all
format long

% Matrices like A*X=B
A = [0 1 -1; 2 4 -1; 1 1 1];
B = [1; 2; 1];

% Retrieve upper triangular matrix U, a permuted lower triangular matrix L
% and P as a permutation vector (solves PA=LU)
[L, U, P] = lu(A);

% Note: LY=PB and UX=Y are not in the formulary
% Solve the triangular system LY=PB
Y = L\P*B;
% Solve the triangular system Ux=y
X = U\Y;

X

%% 5.5

% ... ?

%% 5.7
clear all
format long

A = [2 3; 2 4; 1 1];
B = [1; 4; -1];


X = (A' * A)' * A' * B;
r = A * X - B;

X
r

%% 5.6

% ... ?

%% 5.6

% ... ?

%% Matlab 5.2

% ... ?

%% 5.6

% ... ?

%% 5.7
clear all
format long

A = [1 1 1; 0 2 -3; 0 0 0.5];
% Guess
X = [2; 1; 0];

iterations = 3;

Y = 0
for i = 1:iterations
    Y = A * X;
    X = Y / norm(Y);
end

Y

%% 5.7
clear all
format long

A = [1 1 1; 0 2 -3; 0 0 0.5];
% Guess
X = [1; 1; 0.5];

[L, P, U] = lu(A);

iterations = 2;

for i =1:iterations
    % Lz_k = Px_k
    Z = L\P*X;
    %Uy_k+1=z_k
    Y = U\Z;
    X = Y / norm(Y);
end

X

%% 5.8

% ...

%% 5.8

% ...