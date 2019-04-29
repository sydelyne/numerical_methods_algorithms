# False Position Algorithm

falsePosition.m contains the final version of the code.

falsePositionscript.m contains testing code for the algorithm.

falsePosition takes in a symbolic function, initial bracketing xvalues, error cap(in percent), and the maximum number of iterations

	INPUTS

		func is the symbolic function to be evaluated to find a root

		xl is the original lower bound, xh is the original upper bound

		es is the user-given maximum error that acts as a stopping point for the falsePosition algorithm

		maxiter is the user given maximum number of iterations of the falsePosition algorithm, also acts as a stopping point

		if es or maxiter are not given by the user, es defaults to 0.0001 and maxiter defaults to 200

	OUTPUTS

		root is the root found through the false position process

		fx is the last calculated value of the function at the root found

		ea is the last error calculation of the root

		iter is the number of iterations