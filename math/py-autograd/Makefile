# $NetBSD: Makefile,v 1.3 2020/04/27 19:03:26 adam Exp $

DISTNAME=	autograd-1.3
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	math python
MASTER_SITES=	${MASTER_SITE_PYPI:=a/autograd/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/HIPS/autograd
COMMENT=	Efficiently computes derivatives of numpy code
LICENSE=	mit

DEPENDS+=	${PYPKGPREFIX}-future>=0.15.2:../../devel/py-future

USE_LANGUAGES=	# none

.include "../../lang/python/egg.mk"
.include "../../math/py-numpy/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
