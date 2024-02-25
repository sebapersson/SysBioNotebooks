function affect___parameter_ifelse2!(integrator)
	integrator.p[15] = 1.0
end

function condition___parameter_ifelse2(u, t, integrator)
	t-integrator.p[9] == 0
end
function get_callback__parameter_ifelse2(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse2!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[15] = 0.0 # Default to being off
	if !(t-p[9] < 0)
		p[15] = 1.0
	end
end
function affect___parameter_ifelse1!(integrator)
	integrator.p[18] = 1.0
end

function condition___parameter_ifelse1(u, t, integrator)
	t-integrator.p[8] == 0
end
function get_callback__parameter_ifelse1(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse1!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[18] = 0.0 # Default to being off
	if !(t-p[8] < 0)
		p[18] = 1.0
	end
end


function(foo)
	return false 
end



function compute_tstops(u::AbstractVector, p::AbstractVector)
	return Float64[dual_to_float(p[9]), dual_to_float(p[8])]
end