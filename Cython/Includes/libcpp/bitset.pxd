from libcpp cimport bool
from libcpp.string cimport string

cdef extern from "<bitset>" namespace "std" nogil:
    cdef cppclass bitset[N]:
        cppclass reference:
            reference& operator=(bool)
            reference& operator=(const reference&)
            bool operator bool() const
            bool operator~() const
            reference& flip()

        bitset()
        bitset(unsigned long)
        bitset(unsigned long long)
        bitset(const string&)
        bitset(const string&, size_t pos)
        bitset(const string&, size_t pos, size_t n)
        bitset(const string&, size_t pos, size_t n, char zero)
        bitset(const string&, size_t pos, size_t n, char zero, char one)
        bitset(const char*)
        bitset(const char*, size_t n)
        bitset(const char*, size_t n, char zero)
        bitset(const char*, size_t n, char zero, char one)

        bool operator==(const bitset&, const bitset&) const
        bool operator!=(const bitset&, const bitset&) const
        reference operator[](size_t)
        bool test(size_t) except+
        bool all() const
        bool any() const
        bool none() const
        size_t count() const
        size_t size() const
        #bitset& operator&=(const bitset&)
        #bitset& operator|=(const bitset&)
        #bitset& operator^=(const bitset&)
        #bitset& operator~=()
        bitset operator<<(size_t) const
        #bitset& operator<<=(size_t)
        bitset operator>>(size_t) const
        #bitset& operator>>=(size_t)
        bitset& set()
        bitset& set(size_t, bool) except+
        bitset& reset()
        bitset& reset(size_t) except+
        bitset& flip()
        bitset& flip(size_t) except+
        string to_string() const
        string to_string(char zero) const
        string to_string(char zero, char one) const
        unsigned long to_ulong() const
        unsigned long long to_ullong() const
