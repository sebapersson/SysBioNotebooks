function affect___parameter_ifelse1!(integrator)
	integrator.p[5] = 1.0
end

function condition___parameter_ifelse1(u, t, integrator)
	t-integrator.p[6] == 0
end
function get_callback__parameter_ifelse1(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse1!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[5] = 0.0 # Default to being off
	if !(t-p[6] < 0)
		p[5] = 1.0
	end
end


function(foo)
	return true 
end



function compute_tstops(u::AbstractVector, p::AbstractVector)
	return[p[6]]
end