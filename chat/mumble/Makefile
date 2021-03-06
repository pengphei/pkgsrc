# $NetBSD: Makefile,v 1.20 2020/06/09 15:00:57 nia Exp $

DISTNAME=	mumble-1.3.1
CATEGORIES=	chat audio
MASTER_SITES=	${MASTER_SITE_GITHUB:=mumble-voip/}
GITHUB_PROJECT=	mumble
GITHUB_RELEASE=	${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wiki.mumble.info/wiki/Main_Page
COMMENT=	Low latency VOIP software
LICENSE=	modified-bsd

TOOL_DEPENDS+=	qt5-qttools-[0-9]*:../../x11/qt5-qttools

USE_TOOLS+=	pkg-config gmake
USE_LANGUAGES=	c c++11
USE_LIBTOOL=	yes

PYTHON_FOR_BUILD_ONLY=	tool
CONFIGURE_ENV+=		MUMBLE_PYTHON=${PYTHONBIN:Q}

BUILD_TARGET=	release

# C++11
GCC_REQD+=	4.8

LDFLAGS.NetBSD+=	-lrt

CONFIG_OPTIONS+=	DEFINES+="PLUGIN_PATH=${PREFIX}/lib/mumble"

CONFIG_OPTIONS+=	CONFIG+=c++11

CONFIG_OPTIONS+=	CONFIG+=no-bundled-opus
CONFIG_OPTIONS+=	CONFIG+=no-bundled-speex

# appears to break the build
CONFIG_OPTIONS+=	CONFIG+=no-embed-qt-translations
CONFIG_OPTIONS+=	CONFIG+=no-pch

# support for an old Logitech keyboard - requires missing library
CONFIG_OPTIONS+=	CONFIG+=no-g15

# requires missing ZeroC utilities
CONFIG_OPTIONS+=	CONFIG+=no-ice

.include "../../mk/oss.buildlink3.mk"

.if ${OSS_TYPE} != "none"
SUBST_CLASSES+=		oss
SUBST_STAGE.oss=	pre-configure
SUBST_MESSAGE.oss=	Correct path to OSS device.
SUBST_FILES.oss+=	src/mumble/mumble.pro
SUBST_FILES.oss+=	src/mumble/OSS.cpp
SUBST_SED.oss+=		-e "s,/dev/dsp,${DEVOSSAUDIO},g"
SUBST_VARS.oss+=	LIBOSSAUDIO
.endif

INSTALLATION_DIRS+=	bin lib/mumble
INSTALLATION_DIRS+=	share/applications
INSTALLATION_DIRS+=	share/icons/hicolor/128x128/apps
INSTALLATION_DIRS+=	share/icons/hicolor/512x512/apps
INSTALLATION_DIRS+=	share/icons/hicolor/scalable/apps
INSTALLATION_DIRS+=	share/pixmaps
INSTALLATION_DIRS+=	${PKGMANDIR}/man1

do-configure:
	cd ${WRKSRC} && ${SETENV} ${CONFIGURE_ENV} ${QTDIR}/bin/qmake -unix -recursive main.pro \
	    ${CONFIG_OPTIONS} ${MAKE_ENV} \
	    QMAKE_CFLAGS=${CFLAGS:Q} \
	    QMAKE_CXXFLAGS=${CXXFLAGS:Q} \
	    QMAKE_LFLAGS=${LDFLAGS:Q}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/release/mumble \
		${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/release/murmurd \
		${DESTDIR}${PREFIX}/bin
	${INSTALL_LIB} ${WRKSRC}/release/libmumble* \
		${DESTDIR}${PREFIX}/lib/mumble
	${INSTALL_LIB} ${WRKSRC}/release/plugins/liblink* \
		${DESTDIR}${PREFIX}/lib/mumble
	${INSTALL_LIB} ${WRKSRC}/release/libcelt* \
		${DESTDIR}${PREFIX}/lib/mumble
	${INSTALL_DATA} ${WRKSRC}/scripts/mumble.desktop \
		${DESTDIR}${PREFIX}/share/applications
	${INSTALL_DATA} ${WRKSRC}/man/mumble.1 \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${INSTALL_DATA} ${WRKSRC}/man/murmurd.1 \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1
	${INSTALL_DATA} ${WRKSRC}/icons/mumble.svg \
		${DESTDIR}${PREFIX}/share/icons/hicolor/scalable/apps
	${INSTALL_DATA} ${WRKSRC}/icons/mumble.xpm \
		${DESTDIR}${PREFIX}/share/pixmaps
	${INSTALL_DATA} ${WRKSRC}/themes/Mumble/mumble.png \
		${DESTDIR}${PREFIX}/share/icons/hicolor/512x512/apps/mumble.png
	${INSTALL_DATA} ${WRKSRC}/themes/Mumble/mumble.osx.png \
		${DESTDIR}${PREFIX}/share/icons/hicolor/128x128/apps/mumble.png

.include "options.mk"
.include "../../audio/libopus/buildlink3.mk"
.include "../../audio/libsndfile/buildlink3.mk"
.include "../../audio/speech-dispatcher/buildlink3.mk"
.include "../../audio/speexdsp/buildlink3.mk"
.include "../../audio/speex/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/libltdl/buildlink3.mk"
.include "../../devel/protobuf/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../lang/python/pyversion.mk"
.include "../../net/mDNSResponder/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
