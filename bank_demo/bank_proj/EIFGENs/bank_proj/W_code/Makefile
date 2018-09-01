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
SYSTEM_IN_DYNAMIC_LIB = bank_proj.dll 

.SUFFIXES:.cpp .obj 

.c.obj:
	$(CC) $(CFLAGS) -c $<

.cpp.obj:
	$(CPP) $(CPPFLAGS) -c $<

SUBDIRS = C1 C2 E1

EXTERNALS = 

all:: bank_proj.exe
	echo done > completed.eif

C1\Cobj1.lib: Makefile E1\estructure.h
	cd C1
	$(START_TEST) $(MAKE) Cobj1.lib $(END_TEST)
	cd ..

C2\Cobj2.lib: Makefile E1\estructure.h
	cd C2
	$(START_TEST) $(MAKE) Cobj2.lib $(END_TEST)
	cd ..

E1\emain.obj:  Makefile E1\Makefile
	$(CP) "$(EIFTEMPLATES)\emain.template" "E1\emain.c"
	cd E1
	$(START_TEST) $(MAKE) emain.obj  $(END_TEST)
	cd ..

E1\eoption.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) eoption.obj  $(END_TEST)
	cd ..

E1\epattern.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) epattern.obj  $(END_TEST)
	cd ..

E1\efrozen.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) efrozen.obj  $(END_TEST)
	cd ..

E1\ecall.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) ecall.obj  $(END_TEST)
	cd ..

E1\eplug.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) eplug.obj  $(END_TEST)
	cd ..

E1\eskelet.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) eskelet.obj  $(END_TEST)
	cd ..

E1\enames.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) enames.obj  $(END_TEST)
	cd ..

E1\evisib.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) evisib.obj  $(END_TEST)
	cd ..

E1\ececil.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) ececil.obj  $(END_TEST)
	cd ..

E1\einit.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) einit.obj  $(END_TEST)
	cd ..

E1\eparents.obj : Makefile E1\Makefile E1\estructure.h
	cd E1
	$(START_TEST) $(MAKE) eparents.obj  $(END_TEST)
	cd ..

OBJECTS = E1\eparents.obj  E1\einit.obj  E1\ececil.obj  E1\evisib.obj  E1\enames.obj  E1\eskelet.obj  E1\eplug.obj  E1\ecall.obj  E1\efrozen.obj  E1\epattern.obj  E1\eoption.obj  C2\Cobj2.lib C1\Cobj1.lib 

C_OBJECTS = C2\Cobj2.lib C1\Cobj1.lib 

EOBJECTS = E1\eparents.obj  E1\einit.obj  E1\ececil.obj  E1\evisib.obj  E1\enames.obj  E1\eskelet.obj  E1\eplug.obj  E1\ecall.obj  E1\efrozen.obj  E1\epattern.obj  E1\eoption.obj  

PRECOMP_OBJECTS= "c:\users\mathew\downloads\documents\eiffel user files\18.07\precomp\spec\win64\EIFGENs\base-scoop-safe\W_code\msc\precomp.lib"


bank_proj.exe: bank_proj.lnk bank_proj.res
	$(COMMAND_MAKEFILE)
	link @bank_proj.lnk

..\..\..\bank_proj.rc:
	if not exist ..\..\..\bank_proj.rc $(MV) "E:\EiffelStudio\studio\config\win64\msc\eiffel.rc" ..\..\..\bank_proj.rc

bank_proj.res: ..\..\..\bank_proj.rc Makefile
	rc -r -fobank_proj.res ..\..\..\bank_proj.rc

bank_proj.lnk: $(OBJECTS) e1\emain.obj bank_proj.res Makefile
	if exist $@ $(RM) $@
	@echo $(LDFLAGS) $(CCLDFLAGS) -OUT:bank_proj.exe >> $@
	@echo e1\emain.obj >> $@
	@echo $(EIFLIB)  >> $@
	@echo USER32.lib WS2_32.lib ADVAPI32.lib GDI32.lib SHELL32.lib MSIMG32.lib \
	COMDLG32.lib UUID.lib OLE32.lib OLEAUT32.lib COMCTL32.lib MPR.LIB SHLWAPI.LIB WINSPOOL.LIB $(ISE_SHAREDLIBS) $(PRECOMP_OBJECTS) >> $@
	@echo bank_proj.res >> $@
	echo E1\eparents.obj  E1\einit.obj  E1\ececil.obj  E1\evisib.obj  E1\enames.obj   >> $@ 
	echo E1\eskelet.obj  E1\eplug.obj  E1\ecall.obj  E1\efrozen.obj  E1\epattern.obj   >> $@ 
	echo E1\eoption.obj  C2\Cobj2.lib C1\Cobj1.lib  >> $@ 


RCECIL = MTdebug.obj MTidrs.obj MTinterp.obj mtipc.obj MTnetwork.obj MTupdate.obj \
	MTwargv.obj MTwbench.obj MTwboolstr.obj MTwcecil.obj MTwcompress.obj \
	MTwconsole.obj MTwcopy.obj MTwdir.obj MTweif_project.obj MTweif_threads.obj \
	MTweif_type_id.obj MTwequal.obj MTwerror.obj MTweveqs.obj MTwexcept.obj  \
	MTwfile.obj MTwgarcol.obj MTwgen_conf.obj MTwhash.obj MTwhashin.obj MTwhector.obj \
	MTwinternal.obj MTwlmalloc.obj MTwlocal.obj MTwmain.obj MTwmalloc.obj \
	MTwmemory.obj MTwmemory_analyzer.obj MTwmisc.obj MTwnotify_token.obj \
	MTwobject_id.obj MTwoffset.obj MTwoption.obj MTwout.obj MTwpath_name.obj \
	MTwplug.obj MTwposix_threads.obj MTwprivate_queue.obj MTwprocessor.obj \
	MTwprocessor_registry.obj MTwqueue_cache.obj MTwreq_grp.obj MTwretrieve.obj \
	MTwrout_obj.obj MTwrun_idr.obj MTwscoop.obj MTwscoop_gc.obj MTwsearch.obj \
	MTwsig.obj MTwstore.obj MTwtimer.obj MTwtools.obj MTwtraverse.obj MTwumain.obj \
	MTwurgent.obj 


#STATIC_CECIL PART
STATIC_CECIL = libbank_proj.lib
cecil: $(STATIC_CECIL)
$(STATIC_CECIL): $(OBJECTS) $(EIFLIB) 
	if exist $@ $(RM) $@
	lib -nologo -OUT:$(STATIC_CECIL) $(OBJECTS) $(EXTERNALS) $(EIFLIB) $(PRECOMP_OBJECTS)



#SHARED_CECIL PART
SHARED_CECIL = libbank_proj$(SHARED_SUFFIX)
dynamic_cecil: $(SHARED_CECIL) 
DEF_FILE= c_bank_proj.def 
c_bank_proj.def: 
	if exist $@ $(RM) $@
	echo LIBRARY libbank_proj.dll > $@
	type "E:\EiffelStudio\studio\config\win64\templates\cecil.def"  >> $@

SHARED_CECIL_OBJECT = $(OBJECTS) \
		E1/emain.obj
SHAREDFLAGS = $(LDSHAREDFLAGS) \
	/def:$(DEF_FILE) \
	/OUT:$(SHARED_CECIL) /IMPLIB:c_dll_bank_proj.lib

$(SHARED_CECIL): $(SHARED_CECIL_OBJECT)  $(DEF_FILE)
	if exist $(SHARED_CECIL) del $(SHARED_CECIL)
	$(SHAREDLINK) $(SHAREDFLAGS) $(SHARED_CECIL_OBJECT) $(PRECOMP_OBJECTS) $(EXTERNALS) $(EIFLIB) $(SHAREDLIBS) 

#SYSTEM_IN_DYNAMIC_LIB PART

DEF_FILE= bank_proj.def
dynlib: $(SYSTEM_IN_DYNAMIC_LIB) 
E1\egc_dynlib.obj: Makefile E1\Makefile
	$(CP) "$(EIFTEMPLATES)\egc_dynlib.template" E1\egc_dynlib.c
	cd E1
	$(MAKE) egc_dynlib.obj
	cd ..
E1\edynlib.obj: Makefile E1\Makefile E1\edynlib.c 
	cd E1
	$(MAKE) edynlib.obj
	cd ..

SYSTEM_IN_DYNAMIC_LIB_OBJ = $(OBJECTS) \
		E1\edynlib.obj E1\egc_dynlib.obj 
DYNLIBSHAREDFLAGS = $(LDSHAREDFLAGS) \
	/def:$(DEF_FILE) \
	/OUT:$(SYSTEM_IN_DYNAMIC_LIB) /IMPLIB:dll_bank_proj.lib bank_proj.res

$(SYSTEM_IN_DYNAMIC_LIB): $(SYSTEM_IN_DYNAMIC_LIB_OBJ)  $(DEF_FILE)
	if exist $(SYSTEM_IN_DYNAMIC_LIB) del $(SYSTEM_IN_DYNAMIC_LIB)
	$(SHAREDLINK) $(DYNLIBSHAREDFLAGS) $(SYSTEM_IN_DYNAMIC_LIB_OBJ) $(PRECOMP_OBJECTS) $(EXTERNALS) $(EIFLIB) $(SHAREDLIBS) 



clean: sub_clean local_clean
clobber: sub_clobber local_clobber

local_clean::
	$(RM) core finished *.obj *.so *.a

local_clobber:: local_clean
	$(RM) Makefile config.sh finish_freezing

sub_clean::
	for i in $(SUBDIRS); \
	do \
		if [ -r $$i\Makefile ]; then \
			(cd $$i ; $(MAKE) clean); \
		fi; \
	done

sub_clobber::
	for i in $(SUBDIRS); \
	do \
		if [ -r $$i\Makefile ]; then \
			(cd $$i ; $(MAKE) clobber); \
		fi; \
	done

