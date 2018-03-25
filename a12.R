# Set 2.2a - Question 6

library(lpSolveAPI)

#number of decision variables
lprec <- make.lp(0, 2)

#Objective function definition
set.objfn(lprec, c(8,5))   
lp.control(lprec,sense='max')  

#Constraints
add.constraint(lprec, c(2, 1), "<=", 400)
add.constraint(lprec, c(1, 0), "<=", 150)
add.constraint(lprec, c(0, 1), "<=", 200)

# Non-Negativity
set.bounds(lprec, lower = c(0,0), columns = c(1,2))


lprec
solve(lprec)

get.variables(lprec)     #optimal value of D.V. - decision variables
get.objective(lprec)     #optimal value of objective function

plot.lpExtPtr(lprec)