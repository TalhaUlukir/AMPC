clc,clear
A   = [1 0; 0.1 1];
B   = [0.1; 0.005];
C   = [1 0];
D   = [0];
Ts  = 0.1;

x0=[1;0]; % Initial State

% Kullanıcı sadece ss model girişi yapacak. Matrisler kodun içinden çekilecek.
Sys1 = ss(A, B, C, D, Ts);

% Optimization

Q = 1;
R = 1 * 0.01;                               % Input weighting (scalar)
P = 1 * Q;                                       % Terminal weight
N = 100;                                          % Horizon length

% Constraints (physical domain)
u_max = [ 2];       u_min = [-2];
delta_u_max = 0.5;
% Y ve referans kısıtları sadece output tabanlı modlarda anlamlı:
y_max = [ 2];   y_min = [-2];