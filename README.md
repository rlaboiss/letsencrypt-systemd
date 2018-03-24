# letsencrypt-systemd

This project contains allows the automation of [Let's
Encrpyt](https://letsencrypt.org/) certificates renewal through
[systemd](https://www.freedesktop.org/wiki/Software/systemd/).

## Usage

In order to use the letsencrypt-systemd package you must have previously
installed Let's Encrypt in your system and have already set up a website,
which you wish to secure with HTTPS connections.  Let us say that you have
a website in the domain `www.mysite.org` that you wish to secure with Let's
Encrypt.  This can be easily done as the following (see, for instance,
these
[instructions](https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-16-04)):

    sudo aptitude install certbot python3-certbot-apache
    sudo certbot --apache -d www.mysite.com

(The exemple above assumes an Apache server, but certbot has also an NGINX
plugin.)

The certificate issued by Let's Encrypt has limited validity in time and
must be renewed regularly.  Here is where letsencrypt-systemd comes to
help.  If you do the following:

    sudo make

a systemd service (called `letsencrypt-renew-tls-certs`) will be installed
in your system that will run the certbot renewal command every day at 5:40.
The time can be changed, for instance, as follows:

    sudo make RENEW_TIME=2:37

The above command will install and run the service, but these two actions
can be done separately, as follows:

    sudo make install
    sudo make run-service

It is possible to verify that the systemd service is running by inspecting
the systemd log, with this command:

    sudo make check-log

The files can be uninstalled from systemd with:

    sudo make uninstall

## Copyright statement and licensing conditions

Copyright (C) 2018 Rafael Laboissière

letsencrypt-systemd is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by the
Free Software Foundation, either version 3 of the License, or (at your
option) any later version.

letsencrypt-systemd is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.

Let's Encrypt and systemd are software systems copyrighted by their
authors.  letsencrypt-systemd just borrows their names but is not part of
of them.
