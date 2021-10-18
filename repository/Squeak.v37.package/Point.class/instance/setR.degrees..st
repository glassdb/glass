private
setR: rho degrees: degrees 

	| radians |
	radians _ degrees asFloat degreesToRadians.
	x _ rho asFloat * radians cos.
	y _ rho asFloat * radians sin.