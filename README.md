docker-odoo-backup
==================

This images makes backup of database and data per customer

Usage
-----

You can create a backup by running the following command:

    docker run -ti --volumes-from <cust>.data -v /<yourpath>/backup:/backup --rm --env DBNAME=<dbname> jamotion/odoo-backup
    
<cust> Name of customer. The jamotion/odoo-data Container named <customer>.data must exist!
<dbname> Name of database to backup

Result
------
The whole database will be dumped by pg_dump -Fc into a <customer>_<timestamp>.dump file.
As Second step the directory /data/odoo will be dumped into <customer>_<timestamp>.tar file.
Both files are stored in the /<yourpath>/backup folder of your host.
