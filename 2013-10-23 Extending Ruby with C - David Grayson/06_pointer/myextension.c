#include <ruby.h>

VALUE my_alloc(VALUE klass);
void my_free(void * data);
VALUE my_init(VALUE self);
VALUE get_x(VALUE self);
VALUE set_x(VALUE self, VALUE x);

typedef struct my_data {
  int x, y;
} my_data;

void Init_myextension() {
  VALUE cMyClass = rb_define_class("MyClass", rb_cObject);
  rb_define_alloc_func(cMyClass, my_alloc);
  rb_define_method(cMyClass, "initialize", my_init, 0);
  rb_define_method(cMyClass, "x", get_x, 0);
  rb_define_method(cMyClass, "x=", set_x, 1);
}

VALUE my_alloc(VALUE klass) {
  return Data_Wrap_Struct(klass, NULL, my_free, NULL);
}

void my_free(void * data) {
  free(data);
}

VALUE my_init(VALUE self) {
  my_data * data = DATA_PTR(self) = malloc(sizeof(my_data));
  data->x = 0;
  data->y = 0;
  return Qnil;
}

VALUE get_x(VALUE self) {
  my_data * data = DATA_PTR(self);
  return INT2NUM(data->x);
}

VALUE set_x(VALUE self, VALUE x) {
  my_data * data = DATA_PTR(self);
  data->x = NUM2INT(x);
  return x;
}
