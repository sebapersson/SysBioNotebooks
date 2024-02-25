#u[1] = STAT5A, u[2] = pApA, u[3] = nucpApB, u[4] = nucpBpB, u[5] = STAT5B, u[6] = pApB, u[7] = nucpApA, u[8] = pBpB
#p_ode_problem[1] = specC17, p_ode_problem[2] = Epo_degradation_BaF3, p_ode_problem[3] = k_exp_homo, p_ode_problem[4] = k_phos, p_ode_problem[5] = ratio, p_ode_problem[6] = k_imp_homo, p_ode_problem[7] = k_imp_hetero, p_ode_problem[8] = k_exp_hetero, p_ode_problem[9] = cyt, p_ode_problem[10] = nuc
#
function compute_∂h∂u!(u, t::Real, p_ode_problem::AbstractVector, θ_observable::AbstractVector,
                  θ_non_dynamic::AbstractVector, observableId::Symbol, parameter_map::θObsOrSdParameterMap, out) 
	if observableId == :pSTAT5A_rel 
		out[1] = ((-100.0u[6] - 200.0u[2]*p_ode_problem[1])*p_ode_problem[1]) / ((u[6] + u[1]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1])^2)
		out[2] = (200.0u[1]*(p_ode_problem[1]^2)) / ((u[6] + u[1]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1])^2)
		out[6] = (100.0u[1]*p_ode_problem[1]) / ((u[6] + u[1]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1])^2)
		return nothing
	end

	if observableId == :pSTAT5B_rel 
		out[5] = ((-100.0u[6] - 200.0u[8] + 200.0u[8]*p_ode_problem[1])*(1.0 - p_ode_problem[1])) / ((-u[5] - u[6] - 2.0u[8] + u[5]*p_ode_problem[1] + 2.0u[8]*p_ode_problem[1])^2)
		out[6] = (100.0u[5] - 100.0u[5]*p_ode_problem[1]) / ((-u[5] - u[6] - 2.0u[8] + u[5]*p_ode_problem[1] + 2.0u[8]*p_ode_problem[1])^2)
		out[8] = (200.0u[5] - 400.0u[5]*p_ode_problem[1] + 200.0u[5]*(p_ode_problem[1]^2)) / ((-u[5] - u[6] - 2.0u[8] + u[5]*p_ode_problem[1] + 2.0u[8]*p_ode_problem[1])^2)
		return nothing
	end

	if observableId == :rSTAT5A_rel 
		out[1] = (100.0u[5]*p_ode_problem[1] + 100.0u[6]*p_ode_problem[1] + 200.0u[8]*p_ode_problem[1] - 100.0u[5]*(p_ode_problem[1]^2) - 200.0u[8]*(p_ode_problem[1]^2)) / ((u[5] + 2.0u[6] + 2.0u[8] + u[1]*p_ode_problem[1] - u[5]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1] - 2.0u[8]*p_ode_problem[1])^2)
		out[2] = (200.0u[5]*p_ode_problem[1] + 200.0u[6]*p_ode_problem[1] + 400.0u[8]*p_ode_problem[1] - 200.0u[5]*(p_ode_problem[1]^2) - 400.0u[8]*(p_ode_problem[1]^2)) / ((u[5] + 2.0u[6] + 2.0u[8] + u[1]*p_ode_problem[1] - u[5]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1] - 2.0u[8]*p_ode_problem[1])^2)
		out[5] = ((100.0u[6] + 100.0u[1]*p_ode_problem[1] + 200.0u[2]*p_ode_problem[1])*(-1.0 + p_ode_problem[1])) / ((u[5] + 2.0u[6] + 2.0u[8] + u[1]*p_ode_problem[1] - u[5]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1] - 2.0u[8]*p_ode_problem[1])^2)
		out[6] = (100.0u[5] + 200.0u[8] - 100.0u[1]*p_ode_problem[1] - 100.0u[5]*p_ode_problem[1] - 200.0u[2]*p_ode_problem[1] - 200.0u[8]*p_ode_problem[1]) / ((u[5] + 2.0u[6] + 2.0u[8] + u[1]*p_ode_problem[1] - u[5]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1] - 2.0u[8]*p_ode_problem[1])^2)
		out[8] = (2.0(100.0u[6] + 100.0u[1]*p_ode_problem[1] + 200.0u[2]*p_ode_problem[1])*(-1.0 + p_ode_problem[1])) / ((u[5] + 2.0u[6] + 2.0u[8] + u[1]*p_ode_problem[1] - u[5]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1] - 2.0u[8]*p_ode_problem[1])^2)
		return nothing
	end

end

function compute_∂h∂p!(u, t::Real, p_ode_problem::AbstractVector, θ_observable::AbstractVector,
                  θ_non_dynamic::AbstractVector, observableId::Symbol, parameter_map::θObsOrSdParameterMap, out) 
	if observableId == :pSTAT5A_rel 
		out[1] = (-100.0u[1]*u[6]) / ((u[6] + u[1]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1])^2)
		return nothing
	end

	if observableId == :pSTAT5B_rel 
		out[1] = (100.0u[5]*u[6]) / ((-u[5] - u[6] - 2.0u[8] + u[5]*p_ode_problem[1] + 2.0u[8]*p_ode_problem[1])^2)
		return nothing
	end

	if observableId == :rSTAT5A_rel 
		out[1] = (100.0u[1]*u[5] + 100.0u[1]*u[6] + 200.0u[1]*u[8] + 200.0u[5]*u[2] + 100.0u[5]*u[6] + 200.0u[2]*u[6] + 400.0u[2]*u[8] + 200.0u[6]*u[8]) / ((u[5] + 2.0u[6] + 2.0u[8] + u[1]*p_ode_problem[1] - u[5]*p_ode_problem[1] + 2.0u[2]*p_ode_problem[1] - 2.0u[8]*p_ode_problem[1])^2)
		return nothing
	end

end

function compute_∂σ∂σu!(u, t::Real, θ_sd::AbstractVector, p_ode_problem::AbstractVector,  θ_non_dynamic::AbstractVector,
                   parameter_info::ParametersInfo, observableId::Symbol, parameter_map::θObsOrSdParameterMap, out) 
	if observableId == :pSTAT5A_rel 
		return nothing
	end

	if observableId == :pSTAT5B_rel 
		return nothing
	end

	if observableId == :rSTAT5A_rel 
		return nothing
	end

end

function compute_∂σ∂σp!(u, t::Real, θ_sd::AbstractVector, p_ode_problem::AbstractVector,  θ_non_dynamic::AbstractVector,
                   parameter_info::ParametersInfo, observableId::Symbol, parameter_map::θObsOrSdParameterMap, out) 
	if observableId == :pSTAT5A_rel 
		return nothing
	end

	if observableId == :pSTAT5B_rel 
		return nothing
	end

	if observableId == :rSTAT5A_rel 
		return nothing
	end

end

