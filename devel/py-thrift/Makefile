# $NetBSD: Makefile,v 1.4 2019/09/18 11:27:52 adam Exp $

.include "../../devel/thrift/Makefile.version"

PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES+=	python
COMMENT=	Python bindings for the Apache Thrift RPC system

EXTRACT_ELEMENTS=	${DISTNAME}/lib/py

DEPENDS+=	${PYPKGPREFIX}-six>=1.7.2:../../lang/py-six
TEST_DEPENDS+=	${PYPKGPREFIX}-scons-[0-9]*:../../devel/scons
TEST_DEPENDS+=	${PYPKGPREFIX}-twisted-[0-9]*:../../net/py-twisted

USE_LANGUAGES=	c c++
PYSETUPSUBDIR=	lib/py

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
