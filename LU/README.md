# LU Factorization Algorithm


luFactor.m contains the final version of the code.

luFactorTest.m contains intermediate code that was tested during development.

luFactor3x3.m contains a LU Factorization algorithm for only 3x3 matrices.


## Details

Performs LU Decomposition with partial pivoting on some square(n x n) matrix

	INPUTS:

		A - an n x n matrix. Error triggered if matrix is not square.

	OUTPUTS:

		L - Pivoted lower triangular matrix such that [L]*[U]=[P]*[A]

		U - Pivoted upper triangular matrix such that [L]*[U]=[P]*[A]

		P - Pivot matrix (modified identity matrix)
        
*IMPORTANT*
   
Subtractive cancellation may occur in some instances, but [L]*[U]=[P]*[A] is still true. This may result in some error in the order of P, U, and L column coefficients in the form of switched rows and is due to the lack of a comparison threshold between coefficients.