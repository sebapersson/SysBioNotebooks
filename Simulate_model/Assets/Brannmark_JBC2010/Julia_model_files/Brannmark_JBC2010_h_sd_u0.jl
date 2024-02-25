#u[1] = IRp, u[2] = IR, u[3] = IRins, u[4] = IRiP, u[5] = IRS, u[6] = X, u[7] = IRi, u[8] = IRSiP, u[9] = Xp
#p_ode_problem_names[1] = k1c, p_ode_problem_names[2] = k21, p_ode_problem_names[3] = k1g, p_ode_problem_names[4] = insulin_dose_2, p_ode_problem_names[5] = k1a, p_ode_problem_names[6] = insulin_dose_1, p_ode_problem_names[7] = k1aBasic, p_ode_problem_names[8] = insulin_time_1, p_ode_problem_names[9] = insulin_time_2, p_ode_problem_names[10] = k1d, p_ode_problem_names[11] = k22, p_ode_problem_names[12] = k1r, p_ode_problem_names[13] = k1f, p_ode_problem_names[14] = k1b, p_ode_problem_names[15] = __parameter_ifelse2, p_ode_problem_names[16] = k3, p_ode_problem_names[17] = km2, p_ode_problem_names[18] = __parameter_ifelse1, p_ode_problem_names[19] = k1e, p_ode_problem_names[20] = k_IRSiP_DosR, p_ode_problem_names[21] = km3, p_ode_problem_names[22] = default, p_ode_problem_names[23] = cyt
#

function compute_h(u::AbstractVector, t::Real, p_ode_problem::AbstractVector, θ_observable::AbstractVector,
               θ_non_dynamic::AbstractVector, parameter_info::ParametersInfo, observableId::Symbol,
                  parameter_map::θObsOrSdParameterMap)::Real 
	if observableId === :IR1_P 
		observableParameter1_IR1_P = get_obs_sd_parameter(θ_observable, parameter_map)
		return observableParameter1_IR1_P * ( u[1] + u[4] ) 
	end

	if observableId === :IRS1_P 
		observableParameter1_IRS1_P = get_obs_sd_parameter(θ_observable, parameter_map)
		return observableParameter1_IRS1_P * u[8] 
	end

	if observableId === :IRS1_P_DosR 
		observableParameter1_IRS1_P_DosR = get_obs_sd_parameter(θ_observable, parameter_map)
		return observableParameter1_IRS1_P_DosR * u[8] 
	end

end

function compute_u0!(u0::AbstractVector, p_ode_problem::AbstractVector) 

	#p_ode_problem[1] = k1c, p_ode_problem[2] = k21, p_ode_problem[3] = k1g, p_ode_problem[4] = insulin_dose_2, p_ode_problem[5] = k1a, p_ode_problem[6] = insulin_dose_1, p_ode_problem[7] = k1aBasic, p_ode_problem[8] = insulin_time_1, p_ode_problem[9] = insulin_time_2, p_ode_problem[10] = k1d, p_ode_problem[11] = k22, p_ode_problem[12] = k1r, p_ode_problem[13] = k1f, p_ode_problem[14] = k1b, p_ode_problem[15] = __parameter_ifelse2, p_ode_problem[16] = k3, p_ode_problem[17] = km2, p_ode_problem[18] = __parameter_ifelse1, p_ode_problem[19] = k1e, p_ode_problem[20] = k_IRSiP_DosR, p_ode_problem[21] = km3, p_ode_problem[22] = default, p_ode_problem[23] = cyt

	t = 0.0 # u at time zero

	IRp = 1.7629010620181e-9 
	IR = 9.94957642787569 
	IRins = 0.0173972221725393 
	IRiP = 1.11590026152296e-5 
	IRS = 9.86699348701367 
	X = 9.99984199487351 
	IRi = 0.0330151891862681 
	IRSiP = 0.133006512986336 
	Xp = 0.000158005126497888 

	u0 .= IRp, IR, IRins, IRiP, IRS, X, IRi, IRSiP, Xp
end

function compute_u0(p_ode_problem::AbstractVector)::AbstractVector 

	#p_ode_problem[1] = k1c, p_ode_problem[2] = k21, p_ode_problem[3] = k1g, p_ode_problem[4] = insulin_dose_2, p_ode_problem[5] = k1a, p_ode_problem[6] = insulin_dose_1, p_ode_problem[7] = k1aBasic, p_ode_problem[8] = insulin_time_1, p_ode_problem[9] = insulin_time_2, p_ode_problem[10] = k1d, p_ode_problem[11] = k22, p_ode_problem[12] = k1r, p_ode_problem[13] = k1f, p_ode_problem[14] = k1b, p_ode_problem[15] = __parameter_ifelse2, p_ode_problem[16] = k3, p_ode_problem[17] = km2, p_ode_problem[18] = __parameter_ifelse1, p_ode_problem[19] = k1e, p_ode_problem[20] = k_IRSiP_DosR, p_ode_problem[21] = km3, p_ode_problem[22] = default, p_ode_problem[23] = cyt

	t = 0.0 # u at time zero

	IRp = 1.7629010620181e-9 
	IR = 9.94957642787569 
	IRins = 0.0173972221725393 
	IRiP = 1.11590026152296e-5 
	IRS = 9.86699348701367 
	X = 9.99984199487351 
	IRi = 0.0330151891862681 
	IRSiP = 0.133006512986336 
	Xp = 0.000158005126497888 

	 return [IRp, IR, IRins, IRiP, IRS, X, IRi, IRSiP, Xp]
end

function compute_σ(u::AbstractVector, t::Real, θ_sd::AbstractVector, p_ode_problem::AbstractVector,  θ_non_dynamic::AbstractVector,
               parameter_info::ParametersInfo, observableId::Symbol, parameter_map::θObsOrSdParameterMap)::Real 
	if observableId === :IR1_P 
		noiseParameter1_IR1_P = get_obs_sd_parameter(θ_sd, parameter_map)
		return noiseParameter1_IR1_P 
	end

	if observableId === :IRS1_P 
		noiseParameter1_IRS1_P = get_obs_sd_parameter(θ_sd, parameter_map)
		return noiseParameter1_IRS1_P 
	end

	if observableId === :IRS1_P_DosR 
		noiseParameter1_IRS1_P_DosR = get_obs_sd_parameter(θ_sd, parameter_map)
		return noiseParameter1_IRS1_P_DosR 
	end


end

