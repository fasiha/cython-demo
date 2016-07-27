
```
$ python setup.py build_ext --inplace
$ rm demo.c # this is the intermediary C file
$ python -c "import demo; print(demo.foo(2.2)); import numpy as np; x=np.arange(10).astype(np.float32); print(x); demo.scale(x,120.75); print(x)"
# ...
4.40000009537
[ 0.  1.  2.  3.  4.  5.  6.  7.  8.  9.]
[    0.     120.75   241.5    362.25   483.     603.75   724.5    845.25
   966.    1086.75]
```

