import cython
import numpy as np
cimport numpy as np

import scipy.sparse as sparse

cdef extern from "ldpc_generate1.h":
    ctypedef long long mwSize
    ctypedef long long mwIndex
    ctypedef int IOint
    ctypedef double IOdouble
    void _generate "ldpc_generate" (mwSize M, mwSize N, IOdouble t,
                   mwIndex q, IOint seed, IOdouble **sparseValues,
                   mwSize **sparseRows, mwSize **sparseCols, mwSize *nzmaxOut)

np.import_array()

@cython.boundscheck(False)
@cython.wraparound(False)
def generate(IOint M, IOint N, IOdouble t, mwIndex q, IOint seed):
    cdef IOdouble * vals
    cdef mwSize * rows
    cdef mwSize * cols
    cdef mwSize nzmax
    _generate(M, N, t, q, seed, &vals, &rows, &cols, &nzmax)

    cdef IOdouble[::1] valsView = <IOdouble[:nzmax]>vals
    cdef mwIndex[::1] rowsView = <mwIndex[:nzmax]>rows
    cdef mwIndex[::1] colsView = <mwIndex[:(N+1)]>cols
    return sparse.csc_matrix((np.array(valsView), rowsView, colsView))

