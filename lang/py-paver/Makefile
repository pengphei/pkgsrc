# $NetBSD: Makefile,v 1.2 2018/08/07 09:44:13 adam Exp $

DISTNAME=	Paver-1.3.4
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:tl}
CATEGORIES=	lang python
MASTER_SITES=	${MASTER_SITE_PYPI:=P/Paver/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/paver/paver
COMMENT=	Easy Scripting for Software Projects
LICENSE=	modified-bsd

DEPENDS+=	${PYPKGPREFIX}-six-[0-9]*:../../lang/py-six
TEST_DEPENDS+=	${PYPKGPREFIX}-cogapp-[0-9]*:../../devel/py-cogapp
TEST_DEPENDS+=	${PYPKGPREFIX}-mock-[0-9]*:../../devel/py-mock
TEST_DEPENDS+=	${PYPKGPREFIX}-nose-[0-9]*:../../devel/py-nose
TEST_DEPENDS+=	${PYPKGPREFIX}-virtualenv-[0-9]*:../../devel/py-virtualenv

USE_LANGUAGES=	# none

post-install:
	cd ${DESTDIR}${PREFIX}/bin && ${MV} paver paver-${PYVERSSUFFIX} || ${TRUE}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
