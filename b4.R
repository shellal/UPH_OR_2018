# Set 2.2b - Question 4

library(lpSolveAPI)

#number of decision variables
lprec <- make.lp(0, 2)

#Objective function definition
set.objfn(lprec, c(8, 6))   
lp.control(lprec,sense='min')  

#Constraints
add.constraint(lprec, c(1, 0), "<=", 12)
add.constraint(lprec, c(1, 0), ">=", 5)
add.constraint(lprec, c(0, 1), "<=", 10)
add.constraint(lprec, c(0, 1), ">=", 6)
add.constraint(lprec, c(1, 1), "<=", 20)

# Non-Negativity
set.bounds(lprec, lower = c(0,0), columns = c(1,2))


lprec
solve(lprec)

get.variables(lprec)     #optimal value of D.V. - decision variables
get.objective(lprec)     #optimal value of objective function

plot.lpExtPtr(lprec)