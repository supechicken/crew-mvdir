require 'mkmf'

$LDFLAGS += " -L#{Dir.pwd} -l:crew-mvdir.so"

create_makefile 'crew_mvdir'
