# tyhle vygenerujeme ...
sbin_SCRIPTS  = backupninja ninjahelper

# a proto je taky musíme smazat ...
CLEANFILES = $(sbin_SCRIPTS)

EXTRA_DIST = backupninja.in ninjahelper.in

edit = sed \
    -e "s,@CFGDIR\@,$(CFGDIR),g" \
    -e "s,@BASH\@,$(BASH),g" \
    -e 's,@datadir\@,$(pkgdatadir),g' \
    -e "s,@libdir\@,$(pkglibdir),g" \
    -e 's,@localstatedir\@,$(localstatedir),g' \
	-e 's,@prefix\@,$(prefix),g'

#install-exec-hook:

backupninja: $(srcdir)/backupninja.in
	rm -f backupninja
	$(edit) $(srcdir)/backupninja.in > backupninja
	chmod ugo+x backupninja

ninjahelper: $(srcdir)/ninjahelper.in
	rm -f ninjahelper
	$(edit) $(srcdir)/ninjahelper.in > ninjahelper
	chmod ugo+x ninjahelper

