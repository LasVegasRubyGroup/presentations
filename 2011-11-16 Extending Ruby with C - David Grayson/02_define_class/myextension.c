#include <ruby.h>

VALUE foo(VALUE self, VALUE arg1)
{
		return Qnil;
}

void Init_myextension()
{
    VALUE cMyClass = rb_define_class("MyClass", rb_cObject);
    rb_define_method(cMyClass, "foo", foo, 1);

    // tmphax
    printf("%d %d %d", sizeof(void*), sizeof(long), sizeof(long long));
}
