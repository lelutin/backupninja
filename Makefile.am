# vi: noexpandtab softtabstop=0
## Process this file with automake to produce Makefile.in

EXTRA_DIST = README COPYING AUTHORS INSTALL NEWS ChangeLog \
             backupninja.spec backupninja.spec.in autogen.sh

SUBDIRS = etc examples handlers lib man src

local_rpm_topdir=`cd $(top_srcdir) && pwd`/rpm
rpm-package: dist
	if test x$(HAVE_RPM) = xyes ; then \
               mkdir -p $(local_rpm_topdir) ; \
               cd $(local_rpm_topdir) ; \
               mkdir -p BUILD RPMS SOURCES SPECS ; \
               cd SOURCES ; \
               $(LN_S) ../../$(distdir).tar.gz ; \
               cd .. ; \
               cd SPECS ; \
               $(LN_S) ../../backupninja.spec . ; \
	       cd .. ; \
               rpmbuild --define "_topdir `cd . && pwd`" -bb SPECS/backupninja.spec && \
               echo "Package successfully built in `pwd`/RPMS." ; \
       else \
               echo "Error: RPM executable and/or source directory not found." ; \
       fi

srpm-package: dist
	if test x$(HAVE_RPM) = xyes ; then \
               mkdir -p $(local_rpm_topdir) ; \
               cd $(local_rpm_topdir) ; \
               mkdir -p BUILD SRPMS SOURCES SPECS ; \
               cd SOURCES ; \
               $(LN_S) ../../$(distdir).tar.gz ; \
               cd .. ; \
               cd SPECS ; \
               $(LN_S) ../../backupninja.spec . \
	       cd .. ; \
               rpmbuild --define "_topdir `cd . && pwd`" -bs SPECS/backupninja.spec && \
               echo "Package successfully built in `pwd`/SRPMS." ; \
       else \
              echo "Error: RPM executable and/or source directory not found." ; \
       fi

clean-local:
	-rm -rf $(local_rpm_topdir)
