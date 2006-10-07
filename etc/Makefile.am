
EXTRA_DIST = backupninja.conf.in cron.d/backupninja.in \
        logrotate.d/backupninja.in

GENERATED_FILES = backupninja.conf cron.d/backupninja logrotate.d/backupninja

CLEANFILES = $(GENERATED_FILES)

nobase_sysconf_DATA = $(GENERATED_FILES)

edit = sed \
    -e "s,@BASH\@,$(BASH),g" \
    -e "s,@CFGDIR\@,$(CFGDIR),g" \
    -e "s,@sysconfdir\@,$(sysconfdir),g" \
    -e "s,@localstatedir\@,$(localstatedir),g" \
    -e "s,@pkgdatadir\@,$(pkgdatadir),g" \
    -e "s,@pkglibdir\@,$(pkglibdir),g" \
    -e "s,@sbindir\@,$(sbindir),g" \
    -e "s,@exec_prefix\@,$(exec_prefix),g" \
    -e "s,@prefix\@,$(prefix),g"

cron.d/backupninja: cron.d/backupninja.in
	rm -f cron.d/backupninja
	$(edit) cron.d/backupninja.in > cron.d/backupninja
	chmod 644 cron.d/backupninja

logrotate.d/backupninja: logrotate.d/backupninja.in
	rm -f logrotate.d/backupninja
	$(edit) logrotate.d/backupninja.in > logrotate.d/backupninja
	chmod ugo+x logrotate.d/backupninja

backupninja.conf: backupninja.conf.in
	rm -f backupninja.conf
	$(edit) backupninja.conf.in > backupninja.conf

install-data-hook:
	mkdir -p $(DESTDIR)/$(sysconfdir)/backup.d
	chmod 0770 $(DESTDIR)/$(sysconfdir)/backup.d
