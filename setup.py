from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

import numpy
demo = Extension("demo",
                 ["demo.pyx", "demolibrary.c"],
                 include_dirs=[numpy.get_include()])

setup(
    cmdclass = {'build_ext': build_ext},
    ext_modules = [demo]
)

