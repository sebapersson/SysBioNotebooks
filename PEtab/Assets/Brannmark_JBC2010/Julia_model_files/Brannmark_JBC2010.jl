function get_reaction_system(foo)

	ModelingToolkit.@variables t
	sps = Catalyst.@species IRp(t) IR(t) IRins(t) IRiP(t) IRS(t) X(t) IRi(t) IRSiP(t) Xp(t) 
	vs = ModelingToolkit.@variables insulin(t)
	ps = Catalyst.@parameters k1c k21 k1g insulin_dose_2 k1a insulin_dose_1 k1aBasic insulin_time_1 insulin_time_2 k1d k22 k1r k1f k1b __parameter_ifelse2 k3 km2 __parameter_ifelse1 k1e k_IRSiP_DosR km3 default cyt 

	D = Differential(t)

	_reactions = [
		Catalyst.Reaction((cyt*IRSiP)*km2, [IRSiP], [IRS], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction(((cyt*IRSiP)*X)*k3, [X], [Xp], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction(((cyt*IRS)*k21)*(IRp+(IRiP*k22)), [IRS], [IRSiP], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*IRp)*k1g, [IRp], [IR], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*IRi)*k1r, [IRi], [IR], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*Xp)*km3, [Xp], [X], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*IRins)*k1c, [IRins], [IRp], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*IRp)*k1d, [IRp], [IRiP], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*IRins)*k1b, [IRins], [IR], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*IRiP)*(k1e+((Xp*k1f)/(Xp+1))), [IRiP], [IRi], [1/cyt], [1/cyt]; only_use_rate=true),
		Catalyst.Reaction(cyt*((IR*k1aBasic)+((IR*insulin)*k1a)), [IR], [IRins], [1/cyt], [1/cyt]; only_use_rate=true),
		insulin ~ (insulin_dose_1*((1 - __parameter_ifelse1)*(0) + __parameter_ifelse1*(1)))+(insulin_dose_2*((1 - __parameter_ifelse2)*(0) + __parameter_ifelse2*(1))),
	]


	rn = Catalyst.ReactionSystem(_reactions, t, [sps; vs], ps; name=Symbol("Brannmark_JBC2010"), combinatoric_ratelaws=false)

	specie_map = [
	IRp =>1.7629010620181e-9,
	IR =>9.94957642787569,
	IRins =>0.0173972221725393,
	IRiP =>1.11590026152296e-5,
	IRS =>9.86699348701367,
	X =>9.99984199487351,
	IRi =>0.0330151891862681,
	IRSiP =>0.133006512986336,
	Xp =>0.000158005126497888,
	]
	parameter_map = [
	k1c =>0.050861851404055,
	k21 =>2.13019897196189,
	k1g =>1931.1338834437,
	insulin_dose_2 =>0.0,
	k1a =>0.177252330941141,
	insulin_dose_1 =>0.3,
	k1aBasic =>0.000394105679186913,
	insulin_time_1 =>0.0,
	insulin_time_2 =>1000.0,
	k1d =>499999.999999974,
	k22 =>658.762927786248,
	k1r =>0.0266983879216281,
	k1f =>499999.990737798,
	k1b =>0.174529566448397,
	__parameter_ifelse2 =>0.0,
	k3 =>4.94369803061052e-5,
	km2 =>1.16168060611079,
	__parameter_ifelse1 =>0.0,
	k1e =>1.00000000000005e-6,
	k_IRSiP_DosR =>37.9636812744313,
	km3 =>0.416147033419453,
	default =>1.0,
	cyt =>1.0,
	]
	return rn, specie_map, parameter_map
end