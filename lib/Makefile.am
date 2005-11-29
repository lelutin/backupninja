EXTRA_DIST = easydialog.in parseini.in tools.in vserver.in

GENERATED_FILES = easydialog parseini tools vserver

dist_pkglib_DATA = $(GENERATED_FILES)

CLEANFILES = $(GENERATED_FILES)

edit = sed \
    -e "s,@BASH\@,$(BASH),g"

easydialog:
	rm -f easydialog
	$(edit) easydialog.in > easydialog

parseini:
	rm -f parseini
	$(edit) parseini.in > parseini

tools:
	rm -f tools
	$(edit) tools.in > tools

vserver:
	rm -f vserver
	$(edit) vserver.in > vserver
