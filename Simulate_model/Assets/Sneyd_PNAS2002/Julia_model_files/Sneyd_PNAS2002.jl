function get_reaction_system(foo)

	ModelingToolkit.@variables t
	sps = Catalyst.@species IPR_S(t) IPR_I2(t) IPR_R(t) IPR_O(t) IPR_I1(t) IPR_A(t) 
	vs = ModelingToolkit.@variables L1(t) L3(t) L5(t)
	ps = Catalyst.@parameters k_1 l_4 k_4 IP3 k4 k_2 l2 l_2 l_6 k1 k_3 l6 k3 l4 Ca k2 membrane default 

	D = Differential(t)

	_reactions = [
		Catalyst.Reaction(((((k2*L3)+(l4*Ca))/(L3+(Ca*(1+(L3/L1)))))*IP3)*IPR_R, [IPR_R], [IPR_O], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction(((k3*L5)/(L5+Ca))*IPR_O, [IPR_O], [IPR_S], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction(((((k1*L1)+l2)*Ca)/(L1+(Ca*(1+(L1/L3)))))*IPR_R, [IPR_R], [IPR_I1], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction(((L1*(k_4+l_6))/(L1+Ca))*IPR_A, [IPR_A], [IPR_O], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction(((((k1*L1)+l2)*Ca)/(L1+Ca))*IPR_A, [IPR_A], [IPR_I2], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction((k_1+l_2)*IPR_I2, [IPR_I2], [IPR_A], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction(((((k4*L5)+l6)*Ca)/(L5+Ca))*IPR_O, [IPR_O], [IPR_A], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction((k_1+l_2)*IPR_I1, [IPR_I1], [IPR_R], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction(k_3*IPR_S, [IPR_S], [IPR_O], [1/membrane], [1/membrane]; only_use_rate=true),
		Catalyst.Reaction(((k_2+(l_4*Ca))/(1+(Ca/L5)))*IPR_O, [IPR_O], [IPR_R], [1/membrane], [1/membrane]; only_use_rate=true),
		L1 ~ (k_1/k1)/(l_2/l2),
		L3 ~ (k_2/k2)/(l_4/l4),
		L5 ~ (k_4/k4)/(l_6/l6),
	]


	rn = Catalyst.ReactionSystem(_reactions, t, [sps; vs], ps; name=Symbol("Sneyd_PNAS2002"), combinatoric_ratelaws=false)

	specie_map = [
	IPR_S =>0.0,
	IPR_I2 =>0.0,
	IPR_R =>1.0,
	IPR_O =>0.0,
	IPR_I1 =>0.0,
	IPR_A =>0.0,
	]
	parameter_map = [
	k_1 =>0.923924728172175,
	l_4 =>0.0138802036171304,
	k_4 =>3079.207324879,
	IP3 =>0.0,
	k4 =>99938.2576283137,
	k_2 =>0.00100249472532433,
	l2 =>0.940077018858088,
	l_2 =>0.347664459128102,
	l_6 =>0.00100000000000008,
	k1 =>3.72721095730996,
	k_3 =>1.91463005974811,
	l6 =>99999.9999999914,
	k3 =>15.7453406923705,
	l4 =>2.85837713545253,
	Ca =>10.0,
	k2 =>99999.9999999914,
	membrane =>1.0,
	default =>1.0,
	]
	return rn, specie_map, parameter_map
end