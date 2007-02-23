
HANDLERS = dup dup.helper maildir mysql.helper rdiff sys makecd makecd.helper \
		rdiff.helper rsnap rub sys.helper ldap pgsql sh trac \
		ldap.helper mysql pgsql.helper svn

EXTRA_DIST = Makefile.am $(HANDLERS)

edit = sed \
    -e "s,@BASH\@,$(BASH),g" \
    -e "s,@AWK\@,$(AWK),g" \
    -e "s,@SED\@,$(SED),g" 

dist_pkgdata_DATA = $(HANDLERS)
