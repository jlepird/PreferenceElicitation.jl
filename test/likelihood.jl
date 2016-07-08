using PreferenceElicitation, Base.Test

p = prefEl([1 0; 0 1; 1 1], 
	       priors = [Normal(1, 0.5), Exponential(0.5)])

# Basic test on the priors 
@test PreferenceElicitation.calculateLogProb([1.0, 0.5], p) >
	  PreferenceElicitation.calculateLogProb([0.5, 1.0], p)

@addPref p 1 > 2
# Still should be true
@test PreferenceElicitation.calculateLogProb([1.0, 0.5], p) >
	  PreferenceElicitation.calculateLogProb([0.5, 1.0], p)

# Validate likelihood decrease
p = prefEl([1 0; 0 1; 1 1], 
	       priors = [Normal(1, 0.5), Exponential(0.5)])

noPrefs = PreferenceElicitation.calculateLogProb([1.0, 0.5], p)

@addPref p 2 > 1

@test PreferenceElicitation.calculateLogProb([1.0, 0.5], p) < noPrefs