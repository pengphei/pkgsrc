# $NetBSD: Makefile,v 1.38 2020/03/10 22:09:27 wiz Exp $
#

.include "../../cad/wcalc/Makefile.common"
PKGNAME=	gtk2-${DISTNAME}
PKGREVISION=	34

COMMENT=	GTK2 Based Transmission Line Analysis/Synthesis Calculator

CONFLICTS+=	gtk1-wcalc-[0-9]*

# Only enable the gtk frontend
CONFIGURE_ARGS+=	--disable-cgi
CONFIGURE_ARGS+=	--disable-gtk1
CONFIGURE_ARGS+=	--enable-gtk2
CONFIGURE_ARGS+=	--disable-htdocs
CONFIGURE_ARGS+=	--disable-libwcalc
CONFIGURE_ARGS+=	--disable-stdio
CONFIGURE_ARGS+=	--without-matlab
CONFIGURE_ARGS+=	--without-octave
CONFIGURE_ARGS+=	--without-scilab

.include "../../cad/libwcalc/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
