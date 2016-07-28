clearvars
addpath mex

M = 512;
N = 1024;
t = 3;
q = 2;
seed = 123;
gold = full(ldpc_generate(M, N, t, q, seed));

if count(py.sys.path,pwd) == 0
  insert(py.sys.path, int32(0), pwd);
end
pyldpc_generate = py.importlib.import_module('pyldpc_generate');
py.reload(pyldpc_generate);

pyarr = py.pyldpc_generate.generate(int32(M), ...
                                    int32(N), ...
                                    t, ...
                                    int32(q), ...
                                    int32(seed)).toarray();
frompy = numpyArrayToMatlab(pyarr);

assert(all(gold(:) == frompy(:)))
disp('Tests passed!')

