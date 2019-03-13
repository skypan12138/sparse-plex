clc;
close all;
clearvars;
rng('default');
n = 10;
% Let's get a non-singular 
A = gallery('parter',n)
% Compute its Cholesky decomposition
[L, U] = spx.la.lu.gaxpy(A)
max(max(abs((A - L*U))))
