#include <ruby.h>

VALUE foo(VALUE self, VALUE obj)
{
  VALUE succ = rb_funcall(obj, rb_intern("+"), 1, obj);
  return succ;
}

void Init_myextension()
{
  VALUE cMyClass = rb_define_class("MyClass", rb_cObject);
  rb_define_method(cMyClass, "foo", foo, 1);
}
