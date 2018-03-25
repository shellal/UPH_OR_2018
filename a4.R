# Set 2.2a - Question 4

library(lpSolveAPI)

#number of decision variables
lprec <- make.lp(0, 2)

#Objective function definition
set.objfn(lprec, c(2, 3))   
lp.control(lprec,sense='max')  

#Constraints
add.constraint(lprec, c(10, 5), "<=", 600)
add.constraint(lprec, c(6, 20), "<=", 600)
add.constraint(lprec, c(8, 10), "<=", 600)

# Non-Negativity
set.bounds(lprec, lower = c(0,0), columns = c(1,2))


lprec
solve(lprec)

get.variables(lprec)     #optimal value of D.V. - decision variables
get.objective(lprec)     #optimal value of objective function

plot.lpExtPtr(lprec)