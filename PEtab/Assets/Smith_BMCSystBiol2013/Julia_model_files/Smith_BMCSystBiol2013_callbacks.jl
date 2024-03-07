function affect_insulin_restimulation_end!(integrator)
	u_tmp = similar(integrator.u)
	u_tmp .= integrator.u
	integrator.u[103]  =  integrator.p[83] * (0.0)
end
function _condition_insulin_restimulation_end(u, t, integrator, from_neg)
	cond = (t) ≥ (2895) && from_neg[1] == true
		from_neg[1] = !((t) ≥ (2895))
		return cond
end
function get_callback_insulin_restimulation_end(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function affect_insulin_stimulation_end!(integrator)
	u_tmp = similar(integrator.u)
	u_tmp .= integrator.u
	integrator.u[103]  =  integrator.p[83] * (0.0)
end
function _condition_insulin_stimulation_end(u, t, integrator, from_neg)
	cond = (t) ≥ (integrator.p[67]) && from_neg[1] == true
		from_neg[1] = !((t) ≥ (integrator.p[67]))
		return cond
end
function get_callback_insulin_stimulation_end(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function affect_insulin_restimulation_start!(integrator)
	u_tmp = similar(integrator.u)
	u_tmp .= integrator.u
	integrator.u[103]  =  integrator.p[83] * (499999.0)
end
function _condition_insulin_restimulation_start(u, t, integrator, from_neg)
	cond = (t) ≥ (2880) && from_neg[1] == true
		from_neg[1] = !((t) ≥ (2880))
		return cond
end
function get_callback_insulin_restimulation_start(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end


function(foo)
	return false 
end



function compute_tstops(u::AbstractVector, p::AbstractVector)
	return Float64[dual_to_float(2895.0), dual_to_float(p[67]), dual_to_float(2880.0)]
end