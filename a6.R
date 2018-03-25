# Set 2.2a - Question 6

library(lpSolveAPI)

#number of decision variables
lprec <- make.lp(0, 2)

#Objective function definition
set.objfn(lprec, c(40, 35))   
lp.control(lprec,sense='max')  

#Constraints
add.constraint(lprec, c(0.75, 1), "<=", 800)
add.constraint(lprec, c(0.75, 1), ">=", 600)
add.constraint(lprec, c(1, 0), "<=", 550)
add.constraint(lprec, c(0, 1), "<=", 580)

# Non-Negativity
set.bounds(lprec, lower = c(0,0), columns = c(1,2))


lprec
solve(lprec)

get.variables(lprec)     #optimal value of D.V. - decision variables
get.objective(lprec)     #optimal value of objective function

plot.lpExtPtr(lprec)