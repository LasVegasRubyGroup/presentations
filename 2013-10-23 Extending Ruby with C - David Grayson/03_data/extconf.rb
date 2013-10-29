require 'mkmf'
$CFLAGS += " -std=gnu99 -Wno-declaration-after-statement"
create_makefile 'myextension'

