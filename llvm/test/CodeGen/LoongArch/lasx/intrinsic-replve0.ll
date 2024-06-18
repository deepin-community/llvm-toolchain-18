; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 --mattr=+lasx < %s | FileCheck %s

declare <32 x i8> @llvm.loongarch.lasx.xvreplve0.b(<32 x i8>)

define <32 x i8> @lasx_xvreplve0_b(<32 x i8> %va) nounwind {
; CHECK-LABEL: lasx_xvreplve0_b:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvreplve0.b $xr0, $xr0
; CHECK-NEXT:    ret
entry:
  %res = call <32 x i8> @llvm.loongarch.lasx.xvreplve0.b(<32 x i8> %va)
  ret <32 x i8> %res
}

declare <16 x i16> @llvm.loongarch.lasx.xvreplve0.h(<16 x i16>)

define <16 x i16> @lasx_xvreplve0_h(<16 x i16> %va) nounwind {
; CHECK-LABEL: lasx_xvreplve0_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvreplve0.h $xr0, $xr0
; CHECK-NEXT:    ret
entry:
  %res = call <16 x i16> @llvm.loongarch.lasx.xvreplve0.h(<16 x i16> %va)
  ret <16 x i16> %res
}

declare <8 x i32> @llvm.loongarch.lasx.xvreplve0.w(<8 x i32>)

define <8 x i32> @lasx_xvreplve0_w(<8 x i32> %va) nounwind {
; CHECK-LABEL: lasx_xvreplve0_w:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvreplve0.w $xr0, $xr0
; CHECK-NEXT:    ret
entry:
  %res = call <8 x i32> @llvm.loongarch.lasx.xvreplve0.w(<8 x i32> %va)
  ret <8 x i32> %res
}

declare <4 x i64> @llvm.loongarch.lasx.xvreplve0.d(<4 x i64>)

define <4 x i64> @lasx_xvreplve0_d(<4 x i64> %va) nounwind {
; CHECK-LABEL: lasx_xvreplve0_d:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvreplve0.d $xr0, $xr0
; CHECK-NEXT:    ret
entry:
  %res = call <4 x i64> @llvm.loongarch.lasx.xvreplve0.d(<4 x i64> %va)
  ret <4 x i64> %res
}

declare <32 x i8> @llvm.loongarch.lasx.xvreplve0.q(<32 x i8>)

define <32 x i8> @lasx_xvreplve0_q(<32 x i8> %va) nounwind {
; CHECK-LABEL: lasx_xvreplve0_q:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvreplve0.q $xr0, $xr0
; CHECK-NEXT:    ret
entry:
  %res = call <32 x i8> @llvm.loongarch.lasx.xvreplve0.q(<32 x i8> %va)
  ret <32 x i8> %res
}