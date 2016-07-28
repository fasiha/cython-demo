#ifndef _LDPC_GENERATE1_H_
#define _LDPC_GENERATE1_H_

/* Convert Matlab-specific stuff to regular stuff */
typedef long long mwSize;
typedef long long mwIndex;

typedef int IOint;
typedef double IOdouble;

void ldpc_generate(const mwSize M, const mwSize N, const IOdouble t,
                   const mwIndex q, const IOint seed, IOdouble **sparseValues,
                   mwSize **sparseRows, mwSize **sparseCols, mwSize *nzmaxOut);

#endif


