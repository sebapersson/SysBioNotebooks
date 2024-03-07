function get_reaction_system(foo)

	ModelingToolkit.@variables t
	sps = Catalyst.@species Naive(t) Pathogen(t) LateEffector(t) EarlyEffector(t) Memory(t) 
	ps = Catalyst.@parameters mu_LL delta_NE mu_PL mu_P delta_EL mu_PE mu_EE mu_N rho_E delta_LM rho_P mu_LE default 

	D = Differential(t)

	_reactions = [
		Catalyst.Reaction((Pathogen)^(2)*rho_P, nothing, [Pathogen], nothing, [1.0/default]; only_use_rate=true),
		Catalyst.Reaction((EarlyEffector*Pathogen)*mu_PE, [Pathogen], nothing, [1.0/default], nothing; only_use_rate=true),
		Catalyst.Reaction(LateEffector*delta_LM, [LateEffector], [Memory], [1.0/default], [1.0/default]; only_use_rate=true),
		Catalyst.Reaction((LateEffector)^(2)*mu_LL, [LateEffector], nothing, [1.0/default], nothing; only_use_rate=true),
		Catalyst.Reaction((EarlyEffector*LateEffector)*mu_LE, [LateEffector], nothing, [1.0/default], nothing; only_use_rate=true),
		Catalyst.Reaction((LateEffector*Pathogen)*mu_PL, [Pathogen], nothing, [1.0/default], nothing; only_use_rate=true),
		Catalyst.Reaction((EarlyEffector*Pathogen)*rho_E, nothing, [EarlyEffector], nothing, [1.0/default]; only_use_rate=true),
		Catalyst.Reaction((EarlyEffector)^(2)*mu_EE, [EarlyEffector], nothing, [1.0/default], nothing; only_use_rate=true),
		Catalyst.Reaction(Pathogen*mu_P, [Pathogen], nothing, [1.0/default], nothing; only_use_rate=true),
		Catalyst.Reaction((Naive*Pathogen)*delta_NE, [Naive], [EarlyEffector], [1.0/default], [1.0/default]; only_use_rate=true),
		Catalyst.Reaction(EarlyEffector*delta_EL, [EarlyEffector], [LateEffector], [1.0/default], [1.0/default]; only_use_rate=true),
		Catalyst.Reaction(Naive*mu_N, [Naive], nothing, [1.0/default], nothing; only_use_rate=true),
	]


	rn = Catalyst.ReactionSystem(_reactions, t, sps, ps; name=Symbol("Crauste_CellSystems2017"), combinatoric_ratelaws=false)

	specie_map = [
	Naive =>8090.0,
	Pathogen =>1.0,
	LateEffector =>0.0,
	EarlyEffector =>0.0,
	Memory =>0.0,
	]
	parameter_map = [
	mu_LL =>8.11520135326853e-6,
	delta_NE =>0.0119307857579241,
	mu_PL =>3.6340308186265e-5,
	mu_P =>1.00000002976846e-5,
	delta_EL =>0.51794597529254,
	mu_PE =>1.36571832778378e-10,
	mu_EE =>3.91359322673521e-5,
	mu_N =>0.739907308603256,
	rho_E =>0.507415703707752,
	delta_LM =>0.0225806365892933,
	rho_P =>0.126382288121756,
	mu_LE =>1.00000000000005e-10,
	default =>1.0,
	]
	return rn, specie_map, parameter_map
end