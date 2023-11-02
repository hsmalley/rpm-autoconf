rpm-autoconf
============

An RPM spec file build and install autoconf.

To Build:

```shell
sudo yum -y install rpmdevtools m4 && rpmdev-setuptree
wget https://raw.github.com/hsmalley/rpm-autoconf/master/autoconf.spec -O ~/rpmbuild/SPECS/autoconf.spec
wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.gz -O  ~/rpmbuild/SOURCES/autoconf-2.69.tar.gz
rpmbuild -bb ~/rpmbuild/SPECS/autoconf.spec
```
