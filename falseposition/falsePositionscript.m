clear
clc
format long

syms x;
func = symfun(-12-21*x+18*x^2-2.75*x^3,x);
xl = -1;
xh = 0;
es = 1;
maxiter = 100;


[root,fx,ea,iter] = falsePosition(func,xl,xh,es,maxiter)