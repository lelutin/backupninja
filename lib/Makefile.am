lib_SCRIPTS = easydialog parseini tools vserver

CLEANFILES = $(lib_SCRIPTS)

EXTRA_DIST = easydialog.in parseini.in tools.in vserver.in

edit = sed \
    -e "s,@CFGDIR\@,$(CFGDIR),g" \
    -e "s,@BASH\@,$(BASH),g" \
    -e 's,@datadir\@,$(pkgdatadir),g' \
    -e "s,@libdir\@,$(pkglibdir),g" \
    -e 's,@localstatedir\@,$(localstatedir),g' \
        -e 's,@prefix\@,$(prefix),g'

easydialog: $(srcdir)/easydialog.in
	rm -f easydialog
	$(edit) easydialog.in > easydialog

parseini: $(srcdir)/parseini.in
	rm -f parseini
	$(edit) parseini.in > parseini

tools: $(srcdir)/tools.in
	rm -f tools
	$(edit) tools.in > tools

vserver: $(srcdir)/vserver.in
	rm -f vserver
	$(edit) vserver.in > vserver
