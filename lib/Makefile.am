my_execbindir = $(pkglibdir)
my_execbin_SCRIPTS = easydialog parseini tools ssh vserver

CLEANFILES = $(my_execbin_SCRIPTS)

EXTRA_DIST = easydialog.in parseini.in tools.in ssh.in vserver.in

edit = sed \
    -e "s,@CFGDIR\@,$(CFGDIR),g" \
    -e "s,@BASH\@,$(BASH),g" \
    -e "s,@AWK\@,$(AWK),g" \
    -e "s,@SED\@,$(SED),g" \
    -e "s,@MKTEMP\@,$(MKTEMP),g" \
    -e "s,@libdir\@,$(pkglibdir),g" 

easydialog: $(srcdir)/easydialog.in
	rm -f easydialog
	$(edit) easydialog.in > easydialog

parseini: $(srcdir)/parseini.in
	rm -f parseini
	$(edit) parseini.in > parseini

tools: $(srcdir)/tools.in
	rm -f tools
	$(edit) tools.in > tools

ssh: $(srcdir)/ssh.in
	rm -f ssh
	$(edit) ssh.in > ssh

vserver: $(srcdir)/vserver.in
	rm -f vserver
	$(edit) vserver.in > vserver
