
HANDLERS = dup dup.helper maildir makecd		\
         makecd.helper mysql mysql.helper pgsql pgsql.helper rdiff	\
         rdiff.helper rsync sh svn sys sys.helper trac tar tar.helper

DIST_HANDLERS = dup.in dup.helper.in maildir.in makecd.in		\
         makecd.helper.in mysql.in mysql.helper.in pgsql.in pgsql.helper.in rdiff.in	\
         rdiff.helper.in rsync.in sh.in svn.in sys.in sys.helper.in trac.in tar.in tar.helper.in wget

CLEANFILES = $(HANDLERS)

EXTRA_DIST = Makefile.am $(DIST_HANDLERS)

edit = sed \
    -e "s,@BASH\@,$(BASH),g" \
    -e "s,@AWK\@,$(AWK),g" \
    -e "s,@SED\@,$(SED),g" 

pkgdata_DATA = $(HANDLERS)

dup: $(srcdir)/dup.in
	rm -f dup
	$(edit) $(srcdir)/dup.in > dup

dup.helper: $(srcdir)/dup.helper.in
	rm -f dup.helper
	$(edit) $(srcdir)/dup.helper.in > dup.helper

ldap: $(srcdir)/ldap.in
	rm -f ldap
	$(edit) $(srcdir)/ldap.in > ldap

ldap.helper: $(srcdir)/ldap.helper.in
	rm -f ldap.helper
	$(edit) $(srcdir)/ldap.helper.in > ldap.helper

maildir: $(srcdir)/maildir.in
	rm -f maildir
	$(edit) $(srcdir)/maildir.in > maildir

makecd: $(srcdir)/makecd.in
	rm -f makecd
	$(edit) $(srcdir)/makecd.in > makecd

makecd.helper: $(srcdir)/makecd.helper.in
	rm -f makecd.helper
	$(edit) $(srcdir)/makecd.helper.in > makecd.helper

mysql: $(srcdir)/mysql.in
	rm -f mysql
	$(edit) $(srcdir)/mysql.in > mysql

mysql.helper: $(srcdir)/mysql.helper.in
	rm -f mysql.helper
	$(edit) $(srcdir)/mysql.helper.in > mysql.helper

pgsql: $(srcdir)/pgsql.in
	rm -f pgsql
	$(edit) $(srcdir)/pgsql.in > pgsql

pgsql.helper: $(srcdir)/pgsql.helper.in
	rm -f pgsql.helper
	$(edit) $(srcdir)/pgsql.helper.in > pgsql.helper

rdiff: $(srcdir)/rdiff.in
	rm -f rdiff
	$(edit) $(srcdir)/rdiff.in > rdiff

rdiff.helper: $(srcdir)/rdiff.helper.in
	rm -f rdiff.helper
	$(edit) $(srcdir)/rdiff.helper.in > rdiff.helper

rsync: $(srcdir)/rsync.in
	rm -f rsync 
	$(edit) $(srcdir)/rsync.in > rsync

sh: $(srcdir)/sh.in
	rm -f sh
	$(edit) $(srcdir)/sh.in > sh

svn: $(srcdir)/svn.in
	rm -f svn
	$(edit) $(srcdir)/svn.in > svn

sys: $(srcdir)/sys.in
	rm -f sys
	$(edit) $(srcdir)/sys.in > sys

sys.helper: $(srcdir)/sys.helper.in
	rm -f sys.helper
	$(edit) $(srcdir)/sys.helper.in > sys.helper

trac: $(srcdir)/trac.in
	rm -f trac
	$(edit) $(srcdir)/trac.in > trac

tar: $(srcdir)/tar.in
	rm -f tar
	$(edit) $(srcdir)/tar.in > tar

tar.helper: $(srcdir)/tar.helper.in
	rm -f tar.helper
	$(edit) $(srcdir)/tar.helper.in > tar.helper

