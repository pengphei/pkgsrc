# $NetBSD: Makefile,v 1.23 2020/05/22 10:56:02 adam Exp $

PKGNAME=		${DISTNAME:S/sqlrelay/sqlrelay-mysql/}
PKGREVISION=		14
COMMENT=		MySQL support for SQL Relay

.include "../../databases/sqlrelay/Makefile.common"

LICENSE=		gnu-gpl-v2

CONFIGURE_ARGS+=	--with-mysql-prefix=${BUILDLINK_PREFIX.mysql-client}
CONFIGURE_ARGS+=	--disable-postgresql
CONFIGURE_ARGS+=	--disable-sqlite
CONFIGURE_ARGS+=	--disable-freetds
CONFIGURE_ARGS+=	--disable-odbc
CONFIGURE_ARGS+=	--disable-perl

BUILD_DIRS=		src/connections

INSTALLATION_DIRS+=	libexec/sqlrelay

do-install:
	${LIBTOOL} --mode=install ${INSTALL_LIB} \
		${WRKSRC}/${BUILD_DIRS}/sqlrconnection_mysql.la \
		${DESTDIR}${PREFIX}/libexec/sqlrelay

.include "../../databases/sqlrelay/buildlink3.mk"
.include "../../mk/mysql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
