clear all
close all
clc

A1 = 10;
A2 = 2;

w1 = 62832;
w2 = 12564;

#isolando frequencias
f_mt= 12564/2*pi;
f_ct= 62832/2*pi;

c_t = A1*cos(w1*t);

m_t = A2*cos(w2*t);

s_t = c_t .* m_t; 