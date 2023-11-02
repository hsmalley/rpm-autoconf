ARG AUTOCONFVER=2.71

FROM centos:7 as rpm_builder

RUN yum install -y epel-release m4 rpmdevtools rpmlint rpmdev-setuptree
RUN yum groupinstall -y "Development Tools"

WORKDIR /root/rpmbuild

ARG AUTOCONFVER
ADD http://ftp.gnu.org/gnu/autoconf/autoconf-${AUTOCONFVER}.tar.gz SOURCES/

FROM rpm_builder as autoconf_builder

COPY ./autoconf.spec SPECS/

RUN rpmbuild -bs SPECS/autoconf.spec && \
  rpmbuild --noclean -bb SPECS/autoconf.spec

FROM scratch

COPY --from=autoconf_builder /root/rpmbuild/RPMS/*/*.rpm /root/rpmbuild/SRPMS/*.rpm /