%ivp
pkg load symbolic;
syms y(t)

eqn = diff(y, t) == 0.5*(t-y);
init_con = y(0) == 1;
sol = dsolve(eqn, init_con)
