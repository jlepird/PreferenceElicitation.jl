using PreferenceElicitation, Base.Test

# Set up a basic test case
p = prefEl([1 0; 
	        0 1;
	        1 1],
	        priors = [Normal(0,1), Normal(0,1)])

# Stable baseline
est = infer(p, method = "MAP")
@test est[1] == est[2]

# Make sure preferences work properly
@addPref p 1 > 2
est = infer(p, method = "MAP")
@test est[1] > est[2]

@addPref p 1 < 2
est = infer(p, method = "MAP")
@test est[1] == est[2]

@addPref p 1 == 2
est = infer(p, method = "MAP")
@test est[1] == est[2]