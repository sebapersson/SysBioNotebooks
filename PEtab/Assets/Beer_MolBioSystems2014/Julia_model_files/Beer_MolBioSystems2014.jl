function get_reaction_system(foo)

	ModelingToolkit.@variables t
	sps = Catalyst.@species Glu(t) cGlu(t) Ind(t) Bac(t) 
	vs = ModelingToolkit.@variables lag(t)
	ps = Catalyst.@parameters kdegi Bacmax ksyn kdim __parameter_ifelse1 tau init_Bac beta medium 

	D = Differential(t)

	_reactions = [
		Catalyst.Reaction(medium*(((cGlu)^(2)*kdim)-(Ind*kdegi)), nothing, [Ind], nothing, [1.0/medium]; only_use_rate=true),
		Catalyst.Reaction(medium*((((Bac*beta)*lag)*(Bacmax+-Bac))/Bacmax), nothing, [Bac], nothing, [1.0/medium]; only_use_rate=true),
		Catalyst.Reaction(((medium*-Bac)*Glu)*ksyn, nothing, [Glu], nothing, [1.0/medium]; only_use_rate=true),
		Catalyst.Reaction(medium*(((Bac*Glu)*ksyn)-((cGlu)^(2)*kdim)), nothing, [cGlu], nothing, [1.0/medium]; only_use_rate=true),
		lag ~ ((1 - __parameter_ifelse1)*(0) + __parameter_ifelse1*(1)),
	]


	rn = Catalyst.ReactionSystem(_reactions, t, [sps; vs], ps; name=Symbol("Beer_MolBioSystems2014"), combinatoric_ratelaws=false)

	specie_map = [
	Glu =>10.0,
	cGlu =>0.0,
	Ind =>0.0,
	Bac =>init_Bac,
	]
	parameter_map = [
	kdegi =>1.0,
	Bacmax =>1.0,
	ksyn =>1.0,
	kdim =>1.0,
	__parameter_ifelse1 =>0.0,
	tau =>1.0,
	init_Bac =>0.0147007946993721,
	beta =>1.0,
	medium =>1.0,
	]
	return rn, specie_map, parameter_map
end