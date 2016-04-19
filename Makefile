# Created by: Ganbold Tsagaankhuu <ganbold@FreeBSD.org>
# $FreeBSD$

PORTNAME=	ateam_mysql_ldap_auth
PORTVERSION=	1.0
CATEGORIES=	databases

MAINTAINER=	ganbold@FreeBSD.org
COMMENT=	A-Team MySQL LDAP authentication plugin

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libconfig.so:${PORTSDIR}/devel/libconfig
RUN_DEPENDS=	mysql${MYSQL_VER}-server>5.6:${PORTSDIR}/databases/mysql56-server

USE_MYSQL=	yes
USE_OPENLDAP=	yes
USES=		gmake

USE_GITHUB=	yes
GH_ACCOUNT=	ateamsystems
GH_PROJECT=	ateam_mysql_ldap_auth
GH_TAGNAME=	0ce8034

PLIST_FILES=	lib/mysql/plugin/auth_ldap.so \
		etc/ateam_mysql_ldap_auth.conf

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/lib/mysql/plugin
	${INSTALL_PROGRAM} ${WRKSRC}/src/auth_ldap.so ${STAGEDIR}${PREFIX}/lib/mysql/plugin/
	${INSTALL_DATA} ${WRKSRC}/ateam_mysql_ldap_auth.conf ${STAGEDIR}${PREFIX}/etc/

.include <bsd.port.mk>
