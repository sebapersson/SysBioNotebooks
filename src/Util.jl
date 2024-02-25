using PEtab, OrdinaryDiffEq

function compute_runtime_accuracy(xpetab, petab_problem, solver; abstol=1e-8, reltol=1e-8,
                                  solver_high_acc=Rodas4P(), abstol_highacc=1e-12,
                                  reltol_highacc=1e-12, compute_acc::Bool=true,
                                  ntimes_solve=5)

    local sol_highacc, could_solve_highacc
    if compute_acc == true
        sols_highacc, could_solve_highacc = PEtab.solve_all_conditions(xpetab, petab_problem, solver_high_acc;
                                                                 abstol=abstol_highacc,
                                                                 reltol=reltol_highacc,
                                                                 n_timepoints_save=100)
        if could_solve_highacc == false
           @error "Could not solve high accuracy solution. Consider changing solver_high_acc"
        end
    else
        sols_highacc, could_solve_highacc = nothing, nothing
    end

    # Get accuracy
    if !isnothing(sols_highacc)
        sols, could_solve = PEtab.solve_all_conditions(xpetab, petab_problem, solver;
                                                 abstol=abstol, reltol=reltol,
                                                 n_timepoints_save=100)
        if could_solve == true
            acc = 0.0
            for id in keys(sols)
                acc += sum((sols[id][:, :] - sols_highacc[id][:, :]).^2)
            end
        end
    else
        # Check if we can solve the ODE
        acc = nothing
        _, could_solve = PEtab.solve_all_conditions(xpetab, petab_problem, solver;
                                              abstol=abstol, reltol=reltol,
                                              n_timepoints_save=100)
    end

    if could_solve == false
        @warn "Could not solve ODE. Runtime and accuracy are returned as Inf" maxlog=10
        return Inf, Inf
    end

    # Get runtime
    runtime = 0.0
    for i in 1:ntimes_solve
        runtime += @elapsed _, _ = PEtab.solve_all_conditions(xpetab, petab_problem, solver;
                                                        abstol=abstol, reltol=reltol)
    end
    runtime /= ntimes_solve

    return runtime, acc
end
