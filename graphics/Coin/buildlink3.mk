# $NetBSD: buildlink3.mk,v 1.27 2020/06/05 12:48:59 jperkin Exp $

BUILDLINK_TREE+=	Coin

.if !defined(COIN_BUILDLINK3_MK)
COIN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.Coin+=		Coin>=3.1.3
BUILDLINK_ABI_DEPENDS.Coin+=		Coin>=3.1.3nb4
BUILDLINK_PKGSRCDIR.Coin?=		../../graphics/Coin

.include "../../graphics/simage/buildlink3.mk"
.include "../../graphics/freetype2/buildlink3.mk"
.include "../../graphics/glu/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.endif # COIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-Coin
