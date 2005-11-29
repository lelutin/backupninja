EXTRA_DIST = easydialog.in parseini.in tools.in

GENERATED_FILES = easydialog parseini tools

dist_pkglib_DATA = $(GENERATED_FILES)

CLEANFILES = $(GENERATED_FILES)

edit = sed \
    -e "s,@BASH\@,$(BASH),g"

easydialog: #easydialog.in
	rm -f easydialog
	$(edit) easydialog.in > easydialog

parseini: #parseini.in
	rm -f parseini
	$(edit) parseini.in > parseini

tools: #tools.in
	rm -f tools
	$(edit) tools.in > tools
