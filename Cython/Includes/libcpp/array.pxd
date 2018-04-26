cdef extern from "<array>" namespace "std" nogil:
    cdef cppclass array[T,N]:
        ctypedef T value_type
        ctypedef size_t size_type
        ctypedef ptrdiff_t difference_type
        ctypedef value_type& reference
        ctypedef const value_type& const_reference
        ctypedef value_type* pointer
        ctypedef const value_type* const_pointer

        cppclass iterator:
            T& operator*()
            iterator operator++()
            iterator operator--()
            iterator operator+(size_type)
            iterator operator-(size_type)
            difference_type operator-(iterator)
            bint operator==(iterator)
            bint operator!=(iterator)
            bint operator<(iterator)
            bint operator>(iterator)
            bint operator<=(iterator)
            bint operator>=(iterator)
        cppclass reverse_iterator:
            T& operator*()
            reverse_iterator operator++()
            reverse_iterator operator--()
            reverse_iterator operator+(size_type)
            reverse_iterator operator-(size_type)
            difference_type operator-(reverse_iterator)
            bint operator==(reverse_iterator)
            bint operator!=(reverse_iterator)
            bint operator<(reverse_iterator)
            bint operator>(reverse_iterator)
            bint operator<=(reverse_iterator)
            bint operator>=(reverse_iterator)
        cppclass const_iterator(iterator):
            pass
        cppclass const_reverse_iterator(reverse_iterator):
            pass

        array()
        reference operator[](size_type)
        reference at(size_type) except +
        reference front()
        reference back()
        pointer data()
        iterator begin()
        const_iterator const_begin "begin"()
        iterator end()
        const_iterator const_end "end"()
        reverse_iterator rbegin()
        const_reverse_iterator const_rbegin "crbegin"()
        reverse_iterator rend()
        const_reverse_iterator const_rend "crend"()
        bint empty() const
        size_type size() const
        size_type max_size() const
        void fill(const_reference)
        void swap(array&)

        bint operator==(const array&, const array&)
        bint operator!=(const array&, const array&)
        bint operator<(const array&, const array&)
        bint operator>(const array&, const array&)
        bint operator<=(const array&, const array&)
        bint operator>=(const array&, const array&)

#    T& get[I, T, N](array[T, N]&)
#    void swap[T, N](array[T, N]&, array[T, N]&)
