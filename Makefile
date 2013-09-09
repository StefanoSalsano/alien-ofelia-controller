ROOT= .
include $(ROOT)/makefile-config


DOCDIR= doc
SRCDIR= src
CLASSDIR= classes
LIBDIR= lib
LOGDIR= log


ifeq (${OS},Windows)
	COLON= ;
else
	COLON= :
endif


NAMESPACE= org.zoolu
NAMESPACE_PATH= org/zoolu

#SIP_PACKAGES= address header message provider transaction dialog
SIP_PACKAGES= $(notdir $(wildcard $(SRCDIR)/$(NAMESPACE_PATH)/sip/*))


#%.class: %.java
#	$(JAVAC) $<


# **************************** Default action **************************
default: 
#	$(MAKE) mjsip
	@echo make: select the package you want to build


# ******************************** Cleans ******************************
clean: 
#	cd $(CLASSDIR); $(RM) *.class; cd..
	@echo make clean: to be implemented..


cleanlogs:
	cd $(LOGDIR); $(RM) *.log; cd..


# ****************************** Builds all ****************************
all: 
	$(MAKE) conetcontroller


# ************************ Builds conetcontroller ***********************
conetcontroller: 
	@echo ------------------ MAKING CONET CONTROLLER ------------------
	cd $(SRCDIR);	\
	$(JAVAC) -classpath "../$(CLASSDIR)$(COLON)../$(LIBDIR)/floodlight.jar$(COLON)../$(LIBDIR)/json-simple-1.1.1.jar$(COLON)../$(LIBDIR)/conet.jar" -d ../$(CLASSDIR) org/zoolu/tools/*.java org/zoolu/net/*.java org/zoolu/net/message/*.java local/conet/*.java;	\
	cd ..

	cd $(CLASSDIR);	\
	$(JAR) -cf ../$(LIBDIR)/conetcontroller.jar org local -C ../resources META-INF/services/net.floodlightcontroller.core.module.IFloodlightModule -C ../resources floodlightdefault.properties;	\
	cd ..
