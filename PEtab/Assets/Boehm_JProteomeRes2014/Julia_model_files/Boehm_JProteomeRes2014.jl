function get_reaction_system(foo)

	ModelingToolkit.@variables t
	sps = Catalyst.@species STAT5A(t) pApA(t) nucpApB(t) nucpBpB(t) STAT5B(t) pApB(t) nucpApA(t) pBpB(t) 
	vs = ModelingToolkit.@variables BaF3_Epo(t)
	ps = Catalyst.@parameters specC17 Epo_degradation_BaF3 k_exp_homo k_phos ratio k_imp_homo k_imp_hetero k_exp_hetero cyt nuc 

	D = Differential(t)

	_reactions = [
		Catalyst.Reaction(((cyt*BaF3_Epo)*(STAT5B)^(2))*k_phos, [STAT5B], [pBpB], [2.0/cyt], [1.0/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*k_imp_hetero)*pApB, [pApB], [nucpApB], [1.0/cyt], [1.0/nuc]; only_use_rate=true),
		Catalyst.Reaction((nuc*k_exp_homo)*nucpBpB, [nucpBpB], [STAT5B], [1.0/nuc], [2.0/cyt]; only_use_rate=true),
		Catalyst.Reaction(((cyt*BaF3_Epo)*(STAT5A)^(2))*k_phos, [STAT5A], [pApA], [2.0/cyt], [1.0/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*k_imp_homo)*pApA, [pApA], [nucpApA], [1.0/cyt], [1.0/nuc]; only_use_rate=true),
		Catalyst.Reaction((nuc*k_exp_hetero)*nucpApB, [nucpApB], [STAT5A, STAT5B], [1.0/nuc], [1.0/cyt, 1.0/cyt]; only_use_rate=true),
		Catalyst.Reaction((cyt*k_imp_homo)*pBpB, [pBpB], [nucpBpB], [1.0/cyt], [1.0/nuc]; only_use_rate=true),
		Catalyst.Reaction((nuc*k_exp_homo)*nucpApA, [nucpApA], [STAT5A], [1.0/nuc], [2.0/cyt]; only_use_rate=true),
		Catalyst.Reaction((((cyt*BaF3_Epo)*STAT5A)*STAT5B)*k_phos, [STAT5A, STAT5B], [pApB], [1.0/cyt, 1.0/cyt], [1.0/cyt]; only_use_rate=true),
		BaF3_Epo ~ 1.25e-7*exp((-1*Epo_degradation_BaF3)*t),
	]


	rn = Catalyst.ReactionSystem(_reactions, t, [sps; vs], ps; name=Symbol("Boehm_JProteomeRes2014"), combinatoric_ratelaws=false)

	specie_map = [
	STAT5A =>207.6*ratio,
	pApA =>0.0,
	nucpApB =>0.0,
	nucpBpB =>0.0,
	STAT5B =>207.6-(207.6*ratio),
	pApB =>0.0,
	nucpApA =>0.0,
	pBpB =>0.0,
	]
	parameter_map = [
	specC17 =>0.107,
	Epo_degradation_BaF3 =>0.0269738286367359,
	k_exp_homo =>0.00617193081581346,
	k_phos =>15766.8336642826,
	ratio =>0.693,
	k_imp_homo =>96945.5391768823,
	k_imp_hetero =>0.0163708512310568,
	k_exp_hetero =>1.00094251286741e-5,
	cyt =>1.4,
	nuc =>0.45,
	]
	return rn, specie_map, parameter_map
end