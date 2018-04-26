# mode: run
# tag: cpp, werror, cpp11
# distutils: extra_compile_args=-std=c++11

from cython.operator cimport dereference as deref
from cython.operator cimport preincrement as incr

from libcpp.array cimport array

def simple_test(double x):
    """
    >>> simple_test(55.)
    3
    """

    cdef array[double, 3] arr
    arr[0] = 1.0
    arr[1] = x
    arr[2] = 3.14

    return arr.size()

def index_test(double x):
    """
    >>> index_test(10.)
    (1.0, 10.0)
    >>> index_test(1.25)
    (1.0, 1.25)
    """
    cdef array[double, 3] arr
    arr[0] = 1.0
    arr[1] = x
    arr[2] = 3.14

    return arr[0], arr[1]


def iteration_test(L):
    """
    >>> iteration_test([1,2,4])
    1
    2
    4
    """
    assert len(L) == 3
    cdef array[int, 3] arr
    arr[0] = L[0]
    arr[1] = L[1]
    arr[2] = L[2]

    it = arr.begin()
    while it != arr.end():
        print(deref(it))
        incr(it)


def reverse_iteration_test(L):
    """
    >>> reverse_iteration_test([1,2,4])
    4
    2
    1
    """
    assert len(L) == 3
    cdef array[int, 3] arr
    arr[0] = L[0]
    arr[1] = L[1]
    arr[2] = L[2]

    it = arr.rbegin()
    while it != arr.rend():
        print(deref(it))
        incr(it)


def nogil_test(double x):
    """
    >>> nogil_test(10.)
    (1.0, 10.0)
    >>> nogil_test(1.25)
    (1.0, 1.25)
    """
    cdef array[double, 3] arr
    cdef double r1, r2
    with nogil:
        arr[0] = 1.0
        arr[1] = x
        arr[2] = 3.14

        r1 = arr[0]
        r2 = arr[1]

        it = arr.rbegin()
        while it != arr.rend():
            incr(it)

    return r1, r2
