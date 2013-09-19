#include <ruby.h>

VALUE foo(VALUE self, VALUE obj)
{
	switch (TYPE(obj)) {
	case T_FIXNUM:;
    int val = NUM2INT(obj);
		printf("Fixnum: %d\n", val);
		break;
	case T_STRING:;
    char * string = StringValuePtr(obj);
		printf("String: %s\n", string);
		break;
	case T_ARRAY:;
    unsigned long length = RARRAY_LEN(obj);
		printf("Array:  %ld\n", length);
		break;
	}
	return Qnil;
}

VALUE foo2(VALUE self)
{
  VALUE string = rb_str_new2("hello");
  VALUE number = INT2NUM(44);
  VALUE array = rb_ary_new3(2, string, number);
  return array;
}

void Init_myextension()
{
	VALUE cMyClass = rb_define_class("MyClass", rb_cObject);
	rb_define_method(cMyClass, "foo", foo, 1);
	rb_define_method(cMyClass, "foo2", foo2, 0);
}
