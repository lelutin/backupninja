### backupninja PostgreSQL config file ###

# vsname = <vserver> (no default)
# what vserver to operate on, only used if vserver = yes in /etc/backupninja.conf
# if you do not specify a vsname the host will be operated on
# Note: if operating on a vserver, $VROOTDIR will be prepended to backupdir.

# backupdir = <dir> (default: /var/backups/postgres)
# where to dump the backups

# databases = < all | db1 db2 db3 > (default = all)
# which databases to backup. should either be the word 'all' or a 
# space separated list of database names.
# Note: when using 'all', pg_dumpall is used instead of pg_dump, which means
# that cluster-wide data (such as users and groups) are saved.

# compress = < yes | no > (default = yes)
# if yes, compress the pg_dump/pg_dumpall output. 

# format = < plain | tar | custom > (default = plain)
# plain -  Output a plain-text SQL script file with the extension .sql.
#          When dumping all databases, a single file is created via pg_dumpall.
# tar -    Output a tar archive suitable for input into pg_restore. More 
#          flexible than plain and can be manipulated by standard Unix tools 
#          such as tar. Creates a globals.sql file and an archive per database.
# custom - Output a custom PostgreSQL pg_restore archive. This is the most
#          flexible format allowing selective import and reordering of database
#          objects at the time the database is restored via pg_restore. This
#          option creates a globals.sql file containing the cluster role and
#          other information dumped by pg_dumpall -g and a pg_restore file
#          per selected database. See the pg_dump and pg_restore man pages.

### You can also set the following variables in /etc/backupninja.conf:
# PGSQLDUMP: pg_dump path (default: /usr/bin/pg_dump)
# PGSQLDUMPALL: pg_dumpall path (default: /usr/bin/pg_dumpall)
# PGSQLUSER: user running PostgreSQL (default: postgres)
