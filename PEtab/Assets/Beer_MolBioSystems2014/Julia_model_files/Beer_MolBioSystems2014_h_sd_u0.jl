#u[1] = Glu, u[2] = cGlu, u[3] = Ind, u[4] = Bac
#p_ode_problem_names[1] = kdegi, p_ode_problem_names[2] = Bacmax, p_ode_problem_names[3] = ksyn, p_ode_problem_names[4] = kdim, p_ode_problem_names[5] = __parameter_ifelse1, p_ode_problem_names[6] = tau, p_ode_problem_names[7] = init_Bac, p_ode_problem_names[8] = beta, p_ode_problem_names[9] = medium
#

function compute_h(u::AbstractVector, t::Real, p_ode_problem::AbstractVector, θ_observable::AbstractVector,
               θ_non_dynamic::AbstractVector, parameter_info::ParametersInfo, observableId::Symbol,
                  parameter_map::θObsOrSdParameterMap)::Real 
	if observableId === :Bacnorm 
		return u[4] 
	end

	if observableId === :IndconcNormRange 
		return u[3] 
	end

end

function compute_u0!(u0::AbstractVector, p_ode_problem::AbstractVector) 

	#p_ode_problem[1] = kdegi, p_ode_problem[2] = Bacmax, p_ode_problem[3] = ksyn, p_ode_problem[4] = kdim, p_ode_problem[5] = __parameter_ifelse1, p_ode_problem[6] = tau, p_ode_problem[7] = init_Bac, p_ode_problem[8] = beta, p_ode_problem[9] = medium

	t = 0.0 # u at time zero

	Glu = 10.0 
	cGlu = 0.0 
	Ind = 0.0 
	Bac = p_ode_problem[7] 

	u0 .= Glu, cGlu, Ind, Bac
end

function compute_u0(p_ode_problem::AbstractVector)::AbstractVector 

	#p_ode_problem[1] = kdegi, p_ode_problem[2] = Bacmax, p_ode_problem[3] = ksyn, p_ode_problem[4] = kdim, p_ode_problem[5] = __parameter_ifelse1, p_ode_problem[6] = tau, p_ode_problem[7] = init_Bac, p_ode_problem[8] = beta, p_ode_problem[9] = medium

	t = 0.0 # u at time zero

	Glu = 10.0 
	cGlu = 0.0 
	Ind = 0.0 
	Bac = p_ode_problem[7] 

	 return [Glu, cGlu, Ind, Bac]
end

function compute_σ(u::AbstractVector, t::Real, θ_sd::AbstractVector, p_ode_problem::AbstractVector,  θ_non_dynamic::AbstractVector,
               parameter_info::ParametersInfo, observableId::Symbol, parameter_map::θObsOrSdParameterMap)::Real 
	if observableId === :Bacnorm 
		noiseParameter1_Bacnorm = get_obs_sd_parameter(θ_sd, parameter_map)
		return noiseParameter1_Bacnorm 
	end

	if observableId === :IndconcNormRange 
		noiseParameter1_IndconcNormRange = get_obs_sd_parameter(θ_sd, parameter_map)
		return noiseParameter1_IndconcNormRange 
	end


end

