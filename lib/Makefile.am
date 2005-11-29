EXTRALIBS = easydialog tools
CLEANFILES = $(EXTRALIBS)
dist_pkglib_DATA = $(EXTRALIBS)
EXTRA_DIST = easydialog.in tools.in

edit = sed \
    -e "s,@BASH\@,$(BASH),g"

easydialog: easydialog.in
	rm -f easydialog
	$(edit) easydialog.in > easydialog

tools: tools.in
	rm -f tools
	$(edit) tools.in > tools
