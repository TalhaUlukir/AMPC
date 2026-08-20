%% SISO Example
clear;clc;
Ts = 0.1;
A = [1.00  0.10;
     0.00  0.92];
B = [0.00;
     0.08];
C = [1 0];
D = 0;
plant = ss(A,B,C,D,Ts);

x0 = [0; 0];
u_min = -1;
u_max =  1;
du_max = 0.2;
y_min = -2;
y_max =  2;

Q = 1;
P = 5;
R = 0.05;
N = 10;
%% MIMO Example
clc,clear
Ts = 0.1;
A = [1.00  0.10;
     0.00  0.92];
B = [0.00;
     0.08];
C = [1 0];
D = 0;
plant = ss(A,B,C,D,Ts);

x0 = [0; 0];
u_min = -1;
u_max =  1;
du_max = 0.2;
y_min = -2;
y_max =  2;

Q = 1;
P = 5;
R = 0.05;
N = 10;
%% Measured Disturbance Example
Ts = 0.1;
A = [0.92  0.08  0.00;
     0.00  0.88  0.12;
     0.04 -0.03  0.95];
B = [0.10  0.00;
     0.03  0.08;
     0.00  0.12];
C = [1 0 0;
     0 0 1];
D = zeros(2,2);
plant = ss(A,B,C,D,Ts);

% One measured disturbance, n_d = 1
E = [0.02;
     0.00;
     0.05];
F = [0.00;
     0.10];

x0 = [0; 0; 0];
d0 = 0;
u_min = [-1; -0.8];
u_max = [ 1;  0.8];
y_min = [-2; -1.5];
y_max = [ 2;  1.5];

Q = diag([1, 1]);
P = diag([5, 5]);
R = diag([0.05, 0.05]);
N = 10;