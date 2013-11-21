#include <ruby.h>

VALUE foo(VALUE self, VALUE num)
{
  int x = NUM2INT(num);
  if (x > 100)
  {
    rb_raise(rb_eArgError, "value %d is too large", x);
    printf("this does not ever run\n");
  }
  return Qnil;
}

void Init_myextension()
{
  VALUE cMyClass = rb_define_class("MyClass", rb_cObject);
  rb_define_method(cMyClass, "foo", foo, 1);
}
