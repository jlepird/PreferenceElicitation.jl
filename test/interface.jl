using PreferenceElicitation, Base.Test

# makre sure prior adding works
p = prefEl([1 0; 
	        0 1;
	        1 1],
	        priors = [Normal(0,1), Normal(0,1)])

@test typeof(p) == typeof(p) == PreferenceElicitation.PrefEl

@test p.data[1,1] == 1

@test p.priors.dists[1] == Normal(0,1)

@test p.priors.lb == [-Inf, -Inf]

@test p.priors.ub == [Inf, Inf]

# Test default priors
p = prefEl([1 0; 
	        0 1;
	        1 1])

@test p.priors.dists[1] == Uniform(-Inf, Inf)


# Test preference adders
@addPref p 1 > 2

@test p.strict == [1 2]

@addPref p 2 < 3

@test p.strict == [1 2; 3 2]

@addPref p 1 == 2
@test p.indif == [1 2]