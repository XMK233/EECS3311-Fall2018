INCLUDE_PATH =  -I"E:\EiffelStudio\library\time\spec\include"
SHELL = \bin\sh
CC = cl
CPP = cl
CFLAGS = -Od -MT -w -nologo -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_CRT_SECURE_NO_DEPRECATE -D_UNICODE -DUNICODE -DWIN32_LEAN_AND_MEAN  -DEIF_THREADS  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"E:\EiffelStudio\studio\spec\win64\include" -I. $(INCLUDE_PATH)
CPPFLAGS = -Od -MT -w -nologo -D_WIN32_WINNT=0x0500 -DWINVER=0x0500 -D_CRT_SECURE_NO_DEPRECATE -D_UNICODE -DUNICODE -DWIN32_LEAN_AND_MEAN  -DEIF_THREADS  -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"E:\EiffelStudio\studio\spec\win64\include" -I. $(INCLUDE_PATH)
LDFLAGS = -STACK:5000000 -NODEFAULTLIB:libc
CCLDFLAGS = -STACK:5000000 -NODEFAULTLIB:libc  -SUBSYSTEM:CONSOLE
LDSHAREDFLAGS =  -dll -incremental:no -NODEFAULTLIB:libc
EIFLIB = "E:\EiffelStudio\studio\spec\win64\lib\msc\mtwkbench.lib"
EIFTEMPLATES = E:\EiffelStudio\studio\config\win64\templates
LIBS = 
MAKE = nmake -s -nologo
AR = 
LD = 
MKDEP =   --
MV = copy
CP = copy
RANLIB = echo
RM = del
FILE_EXIST = if exist
RMDIR = rd
X2C = "E:\EiffelStudio\studio\spec\win64\bin\x2c.exe"
SHAREDLINK = link
SHAREDLIBS = USER32.lib WS2_32.lib ADVAPI32.lib GDI32.lib SHELL32.lib MSIMG32.lib \
	COMDLG32.lib UUID.lib OLE32.lib OLEAUT32.lib COMCTL32.lib MPR.LIB SHLWAPI.LIB WINSPOOL.LIB 
SHARED_SUFFIX = .dll
COMMAND_MAKEFILE = 
START_TEST = if not exist finished 
END_TEST =  
CREATE_TEST = echo "finished" >> finished 
SYSTEM_IN_DYNAMIC_LIB = container.dll 

.SUFFIXES:.cpp .obj 

.c.obj:
	$(CC) $(CFLAGS) -c $<

.cpp.obj:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C1_c.obj 

OLDOBJECTS =  te969.obj te969d.obj te967.obj te967d.obj ar959.obj ar959d.obj es968.obj es968d.obj \
	es966.obj es966d.obj es964.obj es964d.obj es965.obj es965d.obj es981.obj es981d.obj \
	es980.obj es980d.obj es979.obj es979d.obj es963.obj es963d.obj da985.obj da985d.obj \
	c_958.obj c_958d.obj ab986.obj ab986d.obj da988.obj da988d.obj ti984.obj ti984d.obj \
	ti974.obj ti974d.obj da983.obj da983d.obj du982.obj du982d.obj da975.obj da975d.obj \
	da978.obj da978d.obj da987.obj da987d.obj fi989.obj fi989d.obj da977.obj da977d.obj \
	ti973.obj ti973d.obj ti972.obj ti972d.obj da976.obj da976d.obj gr962.obj gr962d.obj \
	ti971.obj ti971d.obj co970.obj co970d.obj da961.obj da961d.obj da960.obj da960d.obj 

all::  Cobj1.lib

Cobj1.lib: $(OBJECTS) Makefile
	if exist $@ $(RM) $@
	lib -nologo -OUT:$@ $(OBJECTS)
	$(CREATE_TEST)
	$(RM) $(OBJECTS)


clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

