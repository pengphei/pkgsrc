# $NetBSD: Makefile,v 1.27 2019/08/11 13:23:34 wiz Exp $

DISTNAME=	Pod-Coverage-0.23
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	6
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Pod/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Pod-Coverage
COMMENT=	Checks if the documentation of a module is comprehensive
LICENSE=	${PERL5_LICENSE}

DEPENDS+=	p5-Devel-Symdump>=2.01:../../devel/p5-Devel-Symdump

PERL5_PACKLIST=		auto/Pod/Coverage/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
