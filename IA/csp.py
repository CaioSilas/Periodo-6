def backtrack (sol,is_solution,get_var,domain_func,is_valid,atach_func,detach_func,print_sol = print):
    if is_solution(sol):
        print_sol(sol)
    else:
        pos = get_var(sol)
        for v in domain_func(sol,pos):
            if is_valid(v,pos,sol):
                atach_func(v,pos,sol)
                backtrack(sol,is_solution,get_var,domain_func,is_valid,atach_func,detach_func,print_sol)
                detach_func(v,pos,sol)


class abc_problem:
    def __init__(self,n):
        self.n = n

    def is_solution(self,sol):
        return len(sol) == 3
    
    def get_var(self,sol):
        return len(sol)
    
    def domain_func(self,sol,pos):
        return [i for i in range(1,self.n+1)]
    
    def is_valid(self,v,pos,sol):
        if pos == 0:
            return True
        else:
            v > sol[pos - 1]
    
    def atach_func(self,v,pos,sol):
        sol.append(v)

    def detach_func(self,v,pos,sol):
        sol.pop(-1)



if __name__ == '__main__':
    abc = abc_problem(6)
    sol = []
    backtrack (sol,abc.is_solution,abc.get_var,abc.domain_func,abc.is_valid,abc.atach_func,abc.detach_func)











