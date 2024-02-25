function affect___parameter_ifelse7!(integrator)
	integrator.p[14] = 1.0
end

function condition___parameter_ifelse7(u, t, integrator)
	t-integrator.p[49] == 0
end
function get_callback__parameter_ifelse7(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse7!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[14] = 0.0 # Default to being off
	if !(t-p[49] < 0)
		p[14] = 1.0
	end
end
function affect___parameter_ifelse2!(integrator)
	integrator.p[53] = 1.0
end

function condition___parameter_ifelse2(u, t, integrator)
	t-integrator.p[19] == 0
end
function get_callback__parameter_ifelse2(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse2!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[53] = 0.0 # Default to being off
	if !(t-p[19] < 0)
		p[53] = 1.0
	end
end
function affect___parameter_ifelse3!(integrator)
	integrator.p[60] = 1.0
end

function condition___parameter_ifelse3(u, t, integrator)
	t-integrator.p[30] == 0
end
function get_callback__parameter_ifelse3(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse3!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[60] = 0.0 # Default to being off
	if !(t-p[30] < 0)
		p[60] = 1.0
	end
end
function affect___parameter_ifelse5!(integrator)
	integrator.p[67] = 1.0
end

function condition___parameter_ifelse5(u, t, integrator)
	t-integrator.p[5] == 0
end
function get_callback__parameter_ifelse5(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse5!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[67] = 0.0 # Default to being off
	if !(t-p[5] < 0)
		p[67] = 1.0
	end
end
function affect___parameter_ifelse1!(integrator)
	integrator.p[26] = 1.0
end

function condition___parameter_ifelse1(u, t, integrator)
	t-integrator.p[18] == 0
end
function get_callback__parameter_ifelse1(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse1!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[26] = 0.0 # Default to being off
	if !(t-p[18] < 0)
		p[26] = 1.0
	end
end
function affect___parameter_ifelse4!(integrator)
	integrator.p[17] = 1.0
end

function condition___parameter_ifelse4(u, t, integrator)
	t-integrator.p[39] == 0
end
function get_callback__parameter_ifelse4(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse4!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[17] = 0.0 # Default to being off
	if !(t-p[39] < 0)
		p[17] = 1.0
	end
end
function affect___parameter_ifelse6!(integrator)
	integrator.p[15] = 1.0
end

function condition___parameter_ifelse6(u, t, integrator)
	t-integrator.p[38] == 0
end
function get_callback__parameter_ifelse6(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse6!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[15] = 0.0 # Default to being off
	if !(t-p[38] < 0)
		p[15] = 1.0
	end
end
function affect___parameter_ifelse8!(integrator)
	integrator.p[57] = 1.0
end

function condition___parameter_ifelse8(u, t, integrator)
	t-integrator.p[44] == 0
end
function get_callback__parameter_ifelse8(cond, affect!)
	cb = DiscreteCallback(cond, affect!, save_positions=(false, false))
	return cb
end
function is_active_t0___parameter_ifelse8!(u, p)
	t = 0.0 # Used to check conditions activated at t0=0
	p[57] = 0.0 # Default to being off
	if !(t-p[44] < 0)
		p[57] = 1.0
	end
end


function(foo)
	return false 
end



function compute_tstops(u::AbstractVector, p::AbstractVector)
	return Float64[dual_to_float(p[49]), dual_to_float(p[19]), dual_to_float(p[30]), dual_to_float(p[5]), dual_to_float(p[18]), dual_to_float(p[39]), dual_to_float(p[38]), dual_to_float(p[44])]
end