clearvars
addpath mex

M = 512;
N = 1024;
t = 3;
q = 2;
seed = 123;
gold = full(ldpc_generate(M, N, t, q, seed));

% Generated from C:
% $ gcc -o gen.o ldpc_generate1.c && ./gen.o > gen.m
gen

pyvalues = py.numpy.array(values);
pyarr = py.scipy.sparse.csc_matrix({pyvalues, ...
                                    int32(rows), ...
                                    int32(cols)}).toarray();
frompy = numpyArrayToMatlab(pyarr);

assert(all(gold(:) == frompy(:)))

