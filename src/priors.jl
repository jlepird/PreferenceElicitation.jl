
type Priors
	dists::Array{Distribution}
	lb::Array{F,1}
	ub::Array{F,1}
end

function Priors(; dists = [], lb = [], ub = [])
	isempty(dists) && error("Need to specify prior distributions!")
	if isempty(lb) lb = -Inf * ones(length(dists)) end
	if isempty(ub) ub =  Inf * ones(length(dists)) end
	return Priors(dists,lb,ub)
end