# mode: run
# tag: cpp, werror, cpp11
# distutils: extra_compile_args=-std=c++11

from libcpp cimport bool
from libcpp.bitset cimport bitset, string

ctypedef bitset[8] bitset8
ctypedef bitset[16] bitset16
ctypedef bitset[32] bitset32


cdef inline list to_list(bitset8& b):
    return [int(<bool>(b[i])) for i in range(8)]


def simple_test():
    """
    >>> simple_test()
    (4, False, True, False, 8)
    (4, False, True, False, 8)
    (0, False, False, True, 8)
    """

    # 170 has alternating bits
    cdef bitset8 b = bitset8(170)
    print(b.count(), b.all(), b.any(), b.none(), b.size())

    b.flip()
    print(b.count(), b.all(), b.any(), b.none(), b.size())

    b.reset()
    print(b.count(), b.all(), b.any(), b.none(), b.size())


def test_reference():
    """
    >>> test_reference()
    [1, 0, 1, 0, 1, 0, 1, 0]
    """

    cdef bitset8 b
    b[0].flip()
    b[2].flip()
    b[4].flip()
    b[6].flip()
    print(to_list(b))


def test_all():
    """
    >>> test_all()
    (False, [0, 0, 0, 0, 0, 0, 0, 0])
    (False, [1, 0, 0, 0, 0, 0, 0, 0])
    (False, [0, 1, 1, 1, 1, 1, 1, 1])
    (True, [1, 1, 1, 1, 1, 1, 1, 1])
    """

    cdef bitset8 b
    print(b.all(), to_list(b))

    b[0].flip()
    print(b.all(), to_list(b))

    b.flip()
    print(b.all(), to_list(b))

    b[0].flip()
    print(b.all(), to_list(b))


def test_any():
    """
    >>> test_any()
    (False, [0, 0, 0, 0, 0, 0, 0, 0])
    (True, [1, 0, 0, 0, 0, 0, 0, 0])
    (True, [0, 1, 1, 1, 1, 1, 1, 1])
    (True, [1, 1, 1, 1, 1, 1, 1, 1])
    """

    cdef bitset8 b
    print(b.any(), to_list(b))

    b[0].flip()
    print(b.any(), to_list(b))

    b.flip()
    print(b.any(), to_list(b))

    b[0].flip()
    print(b.any(), to_list(b))


def test_none():
    """
    >>> test_none()
    (True, [0, 0, 0, 0, 0, 0, 0, 0])
    (False, [1, 0, 0, 0, 0, 0, 0, 0])
    (False, [0, 1, 1, 1, 1, 1, 1, 1])
    (False, [1, 1, 1, 1, 1, 1, 1, 1])
    """

    cdef bitset8 b
    print(b.none(), to_list(b))

    b[0].flip()
    print(b.none(), to_list(b))

    b.flip()
    print(b.none(), to_list(b))

    b[0].flip()
    print(b.none(), to_list(b))


def test_count():
    """
    >>> test_count()
    0
    1
    7
    8
    """

    cdef bitset8 b
    print(b.count())

    b[0].flip()
    print(b.count())

    b.flip()
    print(b.count())

    b[0].flip()
    print(b.count())


def test_size():
    """
    >>> test_size()
    8
    16
    32
    """

    cdef bitset8 b8
    cdef bitset16 b16
    cdef bitset32 b32

    print(b8.size())
    print(b16.size())
    print(b32.size())


def test_set():
    """
    >>> test_set()
    [0, 0, 0, 0, 0, 0, 0, 0]
    [1, 1, 1, 1, 1, 1, 1, 1]
    [1, 1, 1, 0, 1, 1, 1, 1]
    """
    cdef bitset8 b
    print(to_list(b))

    b.set()
    print(to_list(b))

    b.set(3, False)
    print(to_list(b))


def test_reset():
    """
    >>> test_reset()
    [1, 1, 1, 1, 1, 1, 1, 1]
    [0, 0, 0, 0, 0, 0, 0, 0]
    """
    cdef bitset8 b
    b.set()
    print(to_list(b))

    b.reset()
    print(to_list(b))


def test_flip():
    """
    >>> test_flip()
    [0, 0, 0, 0, 0, 0, 0, 0]
    [0, 1, 0, 0, 0, 0, 0, 0]
    [1, 0, 1, 1, 1, 1, 1, 1]
    [1, 1, 1, 1, 1, 1, 1, 1]
    """
    cdef bitset8 b
    print(to_list(b))

    b.flip(1)
    print(to_list(b))

    b.flip()
    print(to_list(b))

    b.flip(1)
    print(to_list(b))


def test_to_from_string():
    """
    >>> test_to_from_string()
    [0, 1, 0, 1, 0, 1, 0, 1]
    10101010
    """
    cdef string s = "10101010"
    cdef bitset8 b = bitset8(s)
    print(to_list(b))
    print(b.to_string())


def test_to_from_ulong():
    """
    >>> test_to_from_ulong()
    [0, 1, 0, 1, 0, 1, 0, 1]
    170
    """
    cdef unsigned long l = 170
    cdef bitset8 b = bitset8(l)
    print(to_list(b))
    print(b.to_ulong())


def test_to_from_ullong():
    """
    >>> test_to_from_ullong()
    [0, 1, 0, 1, 0, 1, 0, 1]
    170
    """
    cdef unsigned long long ll = 170
    cdef bitset8 b = bitset8(ll)
    print(to_list(b))
    print(b.to_ulong())
