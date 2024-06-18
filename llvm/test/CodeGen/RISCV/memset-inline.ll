; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=riscv32 -mattr=+m \
; RUN:   | FileCheck %s --check-prefixes=RV32-BOTH,RV32
; RUN: llc < %s -mtriple=riscv64 -mattr=+m \
; RUN:   | FileCheck %s --check-prefixes=RV64-BOTH,RV64
; RUN: llc < %s -mtriple=riscv32 -mattr=+m,+fast-unaligned-access \
; RUN:   | FileCheck %s --check-prefixes=RV32-BOTH,RV32-FAST
; RUN: llc < %s -mtriple=riscv64 -mattr=+m,+fast-unaligned-access \
; RUN:   | FileCheck %s --check-prefixes=RV64-BOTH,RV64-FAST
; RUN: llc < %s -mtriple=riscv32 -mattr=+m,+unaligned-scalar-mem \
; RUN:   | FileCheck %s --check-prefixes=RV32-BOTH,RV32-FAST
; RUN: llc < %s -mtriple=riscv64 -mattr=+m,+unaligned-scalar-mem \
; RUN:   | FileCheck %s --check-prefixes=RV64-BOTH,RV64-FAST
%struct.x = type { i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8 }

declare void @llvm.memset.p0.i64(ptr nocapture, i8, i64, i1) nounwind
declare void @llvm.memset.inline.p0.i64(ptr nocapture, i8, i64, i1) nounwind

; /////////////////////////////////////////////////////////////////////////////

define void @memset_1(ptr %a, i8 %value) nounwind {
; RV32-BOTH-LABEL: memset_1:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    sb a1, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: memset_1:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    sb a1, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 %value, i64 1, i1 0)
  ret void
}

define void @memset_2(ptr %a, i8 %value) nounwind {
; RV32-LABEL: memset_2:
; RV32:       # %bb.0:
; RV32-NEXT:    sb a1, 1(a0)
; RV32-NEXT:    sb a1, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: memset_2:
; RV64:       # %bb.0:
; RV64-NEXT:    sb a1, 1(a0)
; RV64-NEXT:    sb a1, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: memset_2:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    andi a2, a1, 255
; RV32-FAST-NEXT:    slli a1, a1, 8
; RV32-FAST-NEXT:    or a1, a1, a2
; RV32-FAST-NEXT:    sh a1, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: memset_2:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    andi a2, a1, 255
; RV64-FAST-NEXT:    slli a1, a1, 8
; RV64-FAST-NEXT:    or a1, a1, a2
; RV64-FAST-NEXT:    sh a1, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 %value, i64 2, i1 0)
  ret void
}

define void @memset_4(ptr %a, i8 %value) nounwind {
; RV32-LABEL: memset_4:
; RV32:       # %bb.0:
; RV32-NEXT:    sb a1, 3(a0)
; RV32-NEXT:    sb a1, 2(a0)
; RV32-NEXT:    sb a1, 1(a0)
; RV32-NEXT:    sb a1, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: memset_4:
; RV64:       # %bb.0:
; RV64-NEXT:    sb a1, 3(a0)
; RV64-NEXT:    sb a1, 2(a0)
; RV64-NEXT:    sb a1, 1(a0)
; RV64-NEXT:    sb a1, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: memset_4:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    andi a1, a1, 255
; RV32-FAST-NEXT:    lui a2, 4112
; RV32-FAST-NEXT:    addi a2, a2, 257
; RV32-FAST-NEXT:    mul a1, a1, a2
; RV32-FAST-NEXT:    sw a1, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: memset_4:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    slli a1, a1, 56
; RV64-FAST-NEXT:    lui a2, 65793
; RV64-FAST-NEXT:    slli a2, a2, 4
; RV64-FAST-NEXT:    addi a2, a2, 256
; RV64-FAST-NEXT:    mulhu a1, a1, a2
; RV64-FAST-NEXT:    sw a1, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 %value, i64 4, i1 0)
  ret void
}

define void @memset_8(ptr %a, i8 %value) nounwind {
; RV32-LABEL: memset_8:
; RV32:       # %bb.0:
; RV32-NEXT:    sb a1, 7(a0)
; RV32-NEXT:    sb a1, 6(a0)
; RV32-NEXT:    sb a1, 5(a0)
; RV32-NEXT:    sb a1, 4(a0)
; RV32-NEXT:    sb a1, 3(a0)
; RV32-NEXT:    sb a1, 2(a0)
; RV32-NEXT:    sb a1, 1(a0)
; RV32-NEXT:    sb a1, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: memset_8:
; RV64:       # %bb.0:
; RV64-NEXT:    sb a1, 7(a0)
; RV64-NEXT:    sb a1, 6(a0)
; RV64-NEXT:    sb a1, 5(a0)
; RV64-NEXT:    sb a1, 4(a0)
; RV64-NEXT:    sb a1, 3(a0)
; RV64-NEXT:    sb a1, 2(a0)
; RV64-NEXT:    sb a1, 1(a0)
; RV64-NEXT:    sb a1, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: memset_8:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    andi a1, a1, 255
; RV32-FAST-NEXT:    lui a2, 4112
; RV32-FAST-NEXT:    addi a2, a2, 257
; RV32-FAST-NEXT:    mul a1, a1, a2
; RV32-FAST-NEXT:    sw a1, 4(a0)
; RV32-FAST-NEXT:    sw a1, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: memset_8:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    andi a1, a1, 255
; RV64-FAST-NEXT:    lui a2, 4112
; RV64-FAST-NEXT:    addiw a2, a2, 257
; RV64-FAST-NEXT:    slli a3, a2, 32
; RV64-FAST-NEXT:    add a2, a2, a3
; RV64-FAST-NEXT:    mul a1, a1, a2
; RV64-FAST-NEXT:    sd a1, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 %value, i64 8, i1 0)
  ret void
}

define void @memset_16(ptr %a, i8 %value) nounwind {
; RV32-LABEL: memset_16:
; RV32:       # %bb.0:
; RV32-NEXT:    sb a1, 15(a0)
; RV32-NEXT:    sb a1, 14(a0)
; RV32-NEXT:    sb a1, 13(a0)
; RV32-NEXT:    sb a1, 12(a0)
; RV32-NEXT:    sb a1, 11(a0)
; RV32-NEXT:    sb a1, 10(a0)
; RV32-NEXT:    sb a1, 9(a0)
; RV32-NEXT:    sb a1, 8(a0)
; RV32-NEXT:    sb a1, 7(a0)
; RV32-NEXT:    sb a1, 6(a0)
; RV32-NEXT:    sb a1, 5(a0)
; RV32-NEXT:    sb a1, 4(a0)
; RV32-NEXT:    sb a1, 3(a0)
; RV32-NEXT:    sb a1, 2(a0)
; RV32-NEXT:    sb a1, 1(a0)
; RV32-NEXT:    sb a1, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: memset_16:
; RV64:       # %bb.0:
; RV64-NEXT:    sb a1, 15(a0)
; RV64-NEXT:    sb a1, 14(a0)
; RV64-NEXT:    sb a1, 13(a0)
; RV64-NEXT:    sb a1, 12(a0)
; RV64-NEXT:    sb a1, 11(a0)
; RV64-NEXT:    sb a1, 10(a0)
; RV64-NEXT:    sb a1, 9(a0)
; RV64-NEXT:    sb a1, 8(a0)
; RV64-NEXT:    sb a1, 7(a0)
; RV64-NEXT:    sb a1, 6(a0)
; RV64-NEXT:    sb a1, 5(a0)
; RV64-NEXT:    sb a1, 4(a0)
; RV64-NEXT:    sb a1, 3(a0)
; RV64-NEXT:    sb a1, 2(a0)
; RV64-NEXT:    sb a1, 1(a0)
; RV64-NEXT:    sb a1, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: memset_16:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    andi a1, a1, 255
; RV32-FAST-NEXT:    lui a2, 4112
; RV32-FAST-NEXT:    addi a2, a2, 257
; RV32-FAST-NEXT:    mul a1, a1, a2
; RV32-FAST-NEXT:    sw a1, 12(a0)
; RV32-FAST-NEXT:    sw a1, 8(a0)
; RV32-FAST-NEXT:    sw a1, 4(a0)
; RV32-FAST-NEXT:    sw a1, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: memset_16:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    andi a1, a1, 255
; RV64-FAST-NEXT:    lui a2, 4112
; RV64-FAST-NEXT:    addiw a2, a2, 257
; RV64-FAST-NEXT:    slli a3, a2, 32
; RV64-FAST-NEXT:    add a2, a2, a3
; RV64-FAST-NEXT:    mul a1, a1, a2
; RV64-FAST-NEXT:    sd a1, 8(a0)
; RV64-FAST-NEXT:    sd a1, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 %value, i64 16, i1 0)
  ret void
}

define void @memset_32(ptr %a, i8 %value) nounwind {
; RV32-LABEL: memset_32:
; RV32:       # %bb.0:
; RV32-NEXT:    sb a1, 31(a0)
; RV32-NEXT:    sb a1, 30(a0)
; RV32-NEXT:    sb a1, 29(a0)
; RV32-NEXT:    sb a1, 28(a0)
; RV32-NEXT:    sb a1, 27(a0)
; RV32-NEXT:    sb a1, 26(a0)
; RV32-NEXT:    sb a1, 25(a0)
; RV32-NEXT:    sb a1, 24(a0)
; RV32-NEXT:    sb a1, 23(a0)
; RV32-NEXT:    sb a1, 22(a0)
; RV32-NEXT:    sb a1, 21(a0)
; RV32-NEXT:    sb a1, 20(a0)
; RV32-NEXT:    sb a1, 19(a0)
; RV32-NEXT:    sb a1, 18(a0)
; RV32-NEXT:    sb a1, 17(a0)
; RV32-NEXT:    sb a1, 16(a0)
; RV32-NEXT:    sb a1, 15(a0)
; RV32-NEXT:    sb a1, 14(a0)
; RV32-NEXT:    sb a1, 13(a0)
; RV32-NEXT:    sb a1, 12(a0)
; RV32-NEXT:    sb a1, 11(a0)
; RV32-NEXT:    sb a1, 10(a0)
; RV32-NEXT:    sb a1, 9(a0)
; RV32-NEXT:    sb a1, 8(a0)
; RV32-NEXT:    sb a1, 7(a0)
; RV32-NEXT:    sb a1, 6(a0)
; RV32-NEXT:    sb a1, 5(a0)
; RV32-NEXT:    sb a1, 4(a0)
; RV32-NEXT:    sb a1, 3(a0)
; RV32-NEXT:    sb a1, 2(a0)
; RV32-NEXT:    sb a1, 1(a0)
; RV32-NEXT:    sb a1, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: memset_32:
; RV64:       # %bb.0:
; RV64-NEXT:    sb a1, 31(a0)
; RV64-NEXT:    sb a1, 30(a0)
; RV64-NEXT:    sb a1, 29(a0)
; RV64-NEXT:    sb a1, 28(a0)
; RV64-NEXT:    sb a1, 27(a0)
; RV64-NEXT:    sb a1, 26(a0)
; RV64-NEXT:    sb a1, 25(a0)
; RV64-NEXT:    sb a1, 24(a0)
; RV64-NEXT:    sb a1, 23(a0)
; RV64-NEXT:    sb a1, 22(a0)
; RV64-NEXT:    sb a1, 21(a0)
; RV64-NEXT:    sb a1, 20(a0)
; RV64-NEXT:    sb a1, 19(a0)
; RV64-NEXT:    sb a1, 18(a0)
; RV64-NEXT:    sb a1, 17(a0)
; RV64-NEXT:    sb a1, 16(a0)
; RV64-NEXT:    sb a1, 15(a0)
; RV64-NEXT:    sb a1, 14(a0)
; RV64-NEXT:    sb a1, 13(a0)
; RV64-NEXT:    sb a1, 12(a0)
; RV64-NEXT:    sb a1, 11(a0)
; RV64-NEXT:    sb a1, 10(a0)
; RV64-NEXT:    sb a1, 9(a0)
; RV64-NEXT:    sb a1, 8(a0)
; RV64-NEXT:    sb a1, 7(a0)
; RV64-NEXT:    sb a1, 6(a0)
; RV64-NEXT:    sb a1, 5(a0)
; RV64-NEXT:    sb a1, 4(a0)
; RV64-NEXT:    sb a1, 3(a0)
; RV64-NEXT:    sb a1, 2(a0)
; RV64-NEXT:    sb a1, 1(a0)
; RV64-NEXT:    sb a1, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: memset_32:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    andi a1, a1, 255
; RV32-FAST-NEXT:    lui a2, 4112
; RV32-FAST-NEXT:    addi a2, a2, 257
; RV32-FAST-NEXT:    mul a1, a1, a2
; RV32-FAST-NEXT:    sw a1, 28(a0)
; RV32-FAST-NEXT:    sw a1, 24(a0)
; RV32-FAST-NEXT:    sw a1, 20(a0)
; RV32-FAST-NEXT:    sw a1, 16(a0)
; RV32-FAST-NEXT:    sw a1, 12(a0)
; RV32-FAST-NEXT:    sw a1, 8(a0)
; RV32-FAST-NEXT:    sw a1, 4(a0)
; RV32-FAST-NEXT:    sw a1, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: memset_32:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    andi a1, a1, 255
; RV64-FAST-NEXT:    lui a2, 4112
; RV64-FAST-NEXT:    addiw a2, a2, 257
; RV64-FAST-NEXT:    slli a3, a2, 32
; RV64-FAST-NEXT:    add a2, a2, a3
; RV64-FAST-NEXT:    mul a1, a1, a2
; RV64-FAST-NEXT:    sd a1, 24(a0)
; RV64-FAST-NEXT:    sd a1, 16(a0)
; RV64-FAST-NEXT:    sd a1, 8(a0)
; RV64-FAST-NEXT:    sd a1, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 %value, i64 32, i1 0)
  ret void
}

define void @memset_64(ptr %a, i8 %value) nounwind {
; RV32-LABEL: memset_64:
; RV32:       # %bb.0:
; RV32-NEXT:    sb a1, 63(a0)
; RV32-NEXT:    sb a1, 62(a0)
; RV32-NEXT:    sb a1, 61(a0)
; RV32-NEXT:    sb a1, 60(a0)
; RV32-NEXT:    sb a1, 59(a0)
; RV32-NEXT:    sb a1, 58(a0)
; RV32-NEXT:    sb a1, 57(a0)
; RV32-NEXT:    sb a1, 56(a0)
; RV32-NEXT:    sb a1, 55(a0)
; RV32-NEXT:    sb a1, 54(a0)
; RV32-NEXT:    sb a1, 53(a0)
; RV32-NEXT:    sb a1, 52(a0)
; RV32-NEXT:    sb a1, 51(a0)
; RV32-NEXT:    sb a1, 50(a0)
; RV32-NEXT:    sb a1, 49(a0)
; RV32-NEXT:    sb a1, 48(a0)
; RV32-NEXT:    sb a1, 47(a0)
; RV32-NEXT:    sb a1, 46(a0)
; RV32-NEXT:    sb a1, 45(a0)
; RV32-NEXT:    sb a1, 44(a0)
; RV32-NEXT:    sb a1, 43(a0)
; RV32-NEXT:    sb a1, 42(a0)
; RV32-NEXT:    sb a1, 41(a0)
; RV32-NEXT:    sb a1, 40(a0)
; RV32-NEXT:    sb a1, 39(a0)
; RV32-NEXT:    sb a1, 38(a0)
; RV32-NEXT:    sb a1, 37(a0)
; RV32-NEXT:    sb a1, 36(a0)
; RV32-NEXT:    sb a1, 35(a0)
; RV32-NEXT:    sb a1, 34(a0)
; RV32-NEXT:    sb a1, 33(a0)
; RV32-NEXT:    sb a1, 32(a0)
; RV32-NEXT:    sb a1, 31(a0)
; RV32-NEXT:    sb a1, 30(a0)
; RV32-NEXT:    sb a1, 29(a0)
; RV32-NEXT:    sb a1, 28(a0)
; RV32-NEXT:    sb a1, 27(a0)
; RV32-NEXT:    sb a1, 26(a0)
; RV32-NEXT:    sb a1, 25(a0)
; RV32-NEXT:    sb a1, 24(a0)
; RV32-NEXT:    sb a1, 23(a0)
; RV32-NEXT:    sb a1, 22(a0)
; RV32-NEXT:    sb a1, 21(a0)
; RV32-NEXT:    sb a1, 20(a0)
; RV32-NEXT:    sb a1, 19(a0)
; RV32-NEXT:    sb a1, 18(a0)
; RV32-NEXT:    sb a1, 17(a0)
; RV32-NEXT:    sb a1, 16(a0)
; RV32-NEXT:    sb a1, 15(a0)
; RV32-NEXT:    sb a1, 14(a0)
; RV32-NEXT:    sb a1, 13(a0)
; RV32-NEXT:    sb a1, 12(a0)
; RV32-NEXT:    sb a1, 11(a0)
; RV32-NEXT:    sb a1, 10(a0)
; RV32-NEXT:    sb a1, 9(a0)
; RV32-NEXT:    sb a1, 8(a0)
; RV32-NEXT:    sb a1, 7(a0)
; RV32-NEXT:    sb a1, 6(a0)
; RV32-NEXT:    sb a1, 5(a0)
; RV32-NEXT:    sb a1, 4(a0)
; RV32-NEXT:    sb a1, 3(a0)
; RV32-NEXT:    sb a1, 2(a0)
; RV32-NEXT:    sb a1, 1(a0)
; RV32-NEXT:    sb a1, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: memset_64:
; RV64:       # %bb.0:
; RV64-NEXT:    sb a1, 63(a0)
; RV64-NEXT:    sb a1, 62(a0)
; RV64-NEXT:    sb a1, 61(a0)
; RV64-NEXT:    sb a1, 60(a0)
; RV64-NEXT:    sb a1, 59(a0)
; RV64-NEXT:    sb a1, 58(a0)
; RV64-NEXT:    sb a1, 57(a0)
; RV64-NEXT:    sb a1, 56(a0)
; RV64-NEXT:    sb a1, 55(a0)
; RV64-NEXT:    sb a1, 54(a0)
; RV64-NEXT:    sb a1, 53(a0)
; RV64-NEXT:    sb a1, 52(a0)
; RV64-NEXT:    sb a1, 51(a0)
; RV64-NEXT:    sb a1, 50(a0)
; RV64-NEXT:    sb a1, 49(a0)
; RV64-NEXT:    sb a1, 48(a0)
; RV64-NEXT:    sb a1, 47(a0)
; RV64-NEXT:    sb a1, 46(a0)
; RV64-NEXT:    sb a1, 45(a0)
; RV64-NEXT:    sb a1, 44(a0)
; RV64-NEXT:    sb a1, 43(a0)
; RV64-NEXT:    sb a1, 42(a0)
; RV64-NEXT:    sb a1, 41(a0)
; RV64-NEXT:    sb a1, 40(a0)
; RV64-NEXT:    sb a1, 39(a0)
; RV64-NEXT:    sb a1, 38(a0)
; RV64-NEXT:    sb a1, 37(a0)
; RV64-NEXT:    sb a1, 36(a0)
; RV64-NEXT:    sb a1, 35(a0)
; RV64-NEXT:    sb a1, 34(a0)
; RV64-NEXT:    sb a1, 33(a0)
; RV64-NEXT:    sb a1, 32(a0)
; RV64-NEXT:    sb a1, 31(a0)
; RV64-NEXT:    sb a1, 30(a0)
; RV64-NEXT:    sb a1, 29(a0)
; RV64-NEXT:    sb a1, 28(a0)
; RV64-NEXT:    sb a1, 27(a0)
; RV64-NEXT:    sb a1, 26(a0)
; RV64-NEXT:    sb a1, 25(a0)
; RV64-NEXT:    sb a1, 24(a0)
; RV64-NEXT:    sb a1, 23(a0)
; RV64-NEXT:    sb a1, 22(a0)
; RV64-NEXT:    sb a1, 21(a0)
; RV64-NEXT:    sb a1, 20(a0)
; RV64-NEXT:    sb a1, 19(a0)
; RV64-NEXT:    sb a1, 18(a0)
; RV64-NEXT:    sb a1, 17(a0)
; RV64-NEXT:    sb a1, 16(a0)
; RV64-NEXT:    sb a1, 15(a0)
; RV64-NEXT:    sb a1, 14(a0)
; RV64-NEXT:    sb a1, 13(a0)
; RV64-NEXT:    sb a1, 12(a0)
; RV64-NEXT:    sb a1, 11(a0)
; RV64-NEXT:    sb a1, 10(a0)
; RV64-NEXT:    sb a1, 9(a0)
; RV64-NEXT:    sb a1, 8(a0)
; RV64-NEXT:    sb a1, 7(a0)
; RV64-NEXT:    sb a1, 6(a0)
; RV64-NEXT:    sb a1, 5(a0)
; RV64-NEXT:    sb a1, 4(a0)
; RV64-NEXT:    sb a1, 3(a0)
; RV64-NEXT:    sb a1, 2(a0)
; RV64-NEXT:    sb a1, 1(a0)
; RV64-NEXT:    sb a1, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: memset_64:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    andi a1, a1, 255
; RV32-FAST-NEXT:    lui a2, 4112
; RV32-FAST-NEXT:    addi a2, a2, 257
; RV32-FAST-NEXT:    mul a1, a1, a2
; RV32-FAST-NEXT:    sw a1, 60(a0)
; RV32-FAST-NEXT:    sw a1, 56(a0)
; RV32-FAST-NEXT:    sw a1, 52(a0)
; RV32-FAST-NEXT:    sw a1, 48(a0)
; RV32-FAST-NEXT:    sw a1, 44(a0)
; RV32-FAST-NEXT:    sw a1, 40(a0)
; RV32-FAST-NEXT:    sw a1, 36(a0)
; RV32-FAST-NEXT:    sw a1, 32(a0)
; RV32-FAST-NEXT:    sw a1, 28(a0)
; RV32-FAST-NEXT:    sw a1, 24(a0)
; RV32-FAST-NEXT:    sw a1, 20(a0)
; RV32-FAST-NEXT:    sw a1, 16(a0)
; RV32-FAST-NEXT:    sw a1, 12(a0)
; RV32-FAST-NEXT:    sw a1, 8(a0)
; RV32-FAST-NEXT:    sw a1, 4(a0)
; RV32-FAST-NEXT:    sw a1, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: memset_64:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    andi a1, a1, 255
; RV64-FAST-NEXT:    lui a2, 4112
; RV64-FAST-NEXT:    addiw a2, a2, 257
; RV64-FAST-NEXT:    slli a3, a2, 32
; RV64-FAST-NEXT:    add a2, a2, a3
; RV64-FAST-NEXT:    mul a1, a1, a2
; RV64-FAST-NEXT:    sd a1, 56(a0)
; RV64-FAST-NEXT:    sd a1, 48(a0)
; RV64-FAST-NEXT:    sd a1, 40(a0)
; RV64-FAST-NEXT:    sd a1, 32(a0)
; RV64-FAST-NEXT:    sd a1, 24(a0)
; RV64-FAST-NEXT:    sd a1, 16(a0)
; RV64-FAST-NEXT:    sd a1, 8(a0)
; RV64-FAST-NEXT:    sd a1, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 %value, i64 64, i1 0)
  ret void
}

; /////////////////////////////////////////////////////////////////////////////

define void @aligned_memset_2(ptr align 2 %a, i8 %value) nounwind {
; RV32-BOTH-LABEL: aligned_memset_2:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    andi a2, a1, 255
; RV32-BOTH-NEXT:    slli a1, a1, 8
; RV32-BOTH-NEXT:    or a1, a1, a2
; RV32-BOTH-NEXT:    sh a1, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_memset_2:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    andi a2, a1, 255
; RV64-BOTH-NEXT:    slli a1, a1, 8
; RV64-BOTH-NEXT:    or a1, a1, a2
; RV64-BOTH-NEXT:    sh a1, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 2 %a, i8 %value, i64 2, i1 0)
  ret void
}

define void @aligned_memset_4(ptr align 4 %a, i8 %value) nounwind {
; RV32-BOTH-LABEL: aligned_memset_4:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    andi a1, a1, 255
; RV32-BOTH-NEXT:    lui a2, 4112
; RV32-BOTH-NEXT:    addi a2, a2, 257
; RV32-BOTH-NEXT:    mul a1, a1, a2
; RV32-BOTH-NEXT:    sw a1, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_memset_4:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    slli a1, a1, 56
; RV64-BOTH-NEXT:    lui a2, 65793
; RV64-BOTH-NEXT:    slli a2, a2, 4
; RV64-BOTH-NEXT:    addi a2, a2, 256
; RV64-BOTH-NEXT:    mulhu a1, a1, a2
; RV64-BOTH-NEXT:    sw a1, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 4 %a, i8 %value, i64 4, i1 0)
  ret void
}

define void @aligned_memset_8(ptr align 8 %a, i8 %value) nounwind {
; RV32-BOTH-LABEL: aligned_memset_8:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    andi a1, a1, 255
; RV32-BOTH-NEXT:    lui a2, 4112
; RV32-BOTH-NEXT:    addi a2, a2, 257
; RV32-BOTH-NEXT:    mul a1, a1, a2
; RV32-BOTH-NEXT:    sw a1, 4(a0)
; RV32-BOTH-NEXT:    sw a1, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_memset_8:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    andi a1, a1, 255
; RV64-BOTH-NEXT:    lui a2, 4112
; RV64-BOTH-NEXT:    addiw a2, a2, 257
; RV64-BOTH-NEXT:    slli a3, a2, 32
; RV64-BOTH-NEXT:    add a2, a2, a3
; RV64-BOTH-NEXT:    mul a1, a1, a2
; RV64-BOTH-NEXT:    sd a1, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 8 %a, i8 %value, i64 8, i1 0)
  ret void
}

define void @aligned_memset_16(ptr align 16 %a, i8 %value) nounwind {
; RV32-BOTH-LABEL: aligned_memset_16:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    andi a1, a1, 255
; RV32-BOTH-NEXT:    lui a2, 4112
; RV32-BOTH-NEXT:    addi a2, a2, 257
; RV32-BOTH-NEXT:    mul a1, a1, a2
; RV32-BOTH-NEXT:    sw a1, 12(a0)
; RV32-BOTH-NEXT:    sw a1, 8(a0)
; RV32-BOTH-NEXT:    sw a1, 4(a0)
; RV32-BOTH-NEXT:    sw a1, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_memset_16:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    andi a1, a1, 255
; RV64-BOTH-NEXT:    lui a2, 4112
; RV64-BOTH-NEXT:    addiw a2, a2, 257
; RV64-BOTH-NEXT:    slli a3, a2, 32
; RV64-BOTH-NEXT:    add a2, a2, a3
; RV64-BOTH-NEXT:    mul a1, a1, a2
; RV64-BOTH-NEXT:    sd a1, 8(a0)
; RV64-BOTH-NEXT:    sd a1, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 16 %a, i8 %value, i64 16, i1 0)
  ret void
}

define void @aligned_memset_32(ptr align 32 %a, i8 %value) nounwind {
; RV32-BOTH-LABEL: aligned_memset_32:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    andi a1, a1, 255
; RV32-BOTH-NEXT:    lui a2, 4112
; RV32-BOTH-NEXT:    addi a2, a2, 257
; RV32-BOTH-NEXT:    mul a1, a1, a2
; RV32-BOTH-NEXT:    sw a1, 28(a0)
; RV32-BOTH-NEXT:    sw a1, 24(a0)
; RV32-BOTH-NEXT:    sw a1, 20(a0)
; RV32-BOTH-NEXT:    sw a1, 16(a0)
; RV32-BOTH-NEXT:    sw a1, 12(a0)
; RV32-BOTH-NEXT:    sw a1, 8(a0)
; RV32-BOTH-NEXT:    sw a1, 4(a0)
; RV32-BOTH-NEXT:    sw a1, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_memset_32:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    andi a1, a1, 255
; RV64-BOTH-NEXT:    lui a2, 4112
; RV64-BOTH-NEXT:    addiw a2, a2, 257
; RV64-BOTH-NEXT:    slli a3, a2, 32
; RV64-BOTH-NEXT:    add a2, a2, a3
; RV64-BOTH-NEXT:    mul a1, a1, a2
; RV64-BOTH-NEXT:    sd a1, 24(a0)
; RV64-BOTH-NEXT:    sd a1, 16(a0)
; RV64-BOTH-NEXT:    sd a1, 8(a0)
; RV64-BOTH-NEXT:    sd a1, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 32 %a, i8 %value, i64 32, i1 0)
  ret void
}

define void @aligned_memset_64(ptr align 64 %a, i8 %value) nounwind {
; RV32-BOTH-LABEL: aligned_memset_64:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    andi a1, a1, 255
; RV32-BOTH-NEXT:    lui a2, 4112
; RV32-BOTH-NEXT:    addi a2, a2, 257
; RV32-BOTH-NEXT:    mul a1, a1, a2
; RV32-BOTH-NEXT:    sw a1, 60(a0)
; RV32-BOTH-NEXT:    sw a1, 56(a0)
; RV32-BOTH-NEXT:    sw a1, 52(a0)
; RV32-BOTH-NEXT:    sw a1, 48(a0)
; RV32-BOTH-NEXT:    sw a1, 44(a0)
; RV32-BOTH-NEXT:    sw a1, 40(a0)
; RV32-BOTH-NEXT:    sw a1, 36(a0)
; RV32-BOTH-NEXT:    sw a1, 32(a0)
; RV32-BOTH-NEXT:    sw a1, 28(a0)
; RV32-BOTH-NEXT:    sw a1, 24(a0)
; RV32-BOTH-NEXT:    sw a1, 20(a0)
; RV32-BOTH-NEXT:    sw a1, 16(a0)
; RV32-BOTH-NEXT:    sw a1, 12(a0)
; RV32-BOTH-NEXT:    sw a1, 8(a0)
; RV32-BOTH-NEXT:    sw a1, 4(a0)
; RV32-BOTH-NEXT:    sw a1, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_memset_64:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    andi a1, a1, 255
; RV64-BOTH-NEXT:    lui a2, 4112
; RV64-BOTH-NEXT:    addiw a2, a2, 257
; RV64-BOTH-NEXT:    slli a3, a2, 32
; RV64-BOTH-NEXT:    add a2, a2, a3
; RV64-BOTH-NEXT:    mul a1, a1, a2
; RV64-BOTH-NEXT:    sd a1, 56(a0)
; RV64-BOTH-NEXT:    sd a1, 48(a0)
; RV64-BOTH-NEXT:    sd a1, 40(a0)
; RV64-BOTH-NEXT:    sd a1, 32(a0)
; RV64-BOTH-NEXT:    sd a1, 24(a0)
; RV64-BOTH-NEXT:    sd a1, 16(a0)
; RV64-BOTH-NEXT:    sd a1, 8(a0)
; RV64-BOTH-NEXT:    sd a1, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 64 %a, i8 %value, i64 64, i1 0)
  ret void
}

; /////////////////////////////////////////////////////////////////////////////

define void @bzero_1(ptr %a) nounwind {
; RV32-BOTH-LABEL: bzero_1:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    sb zero, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: bzero_1:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    sb zero, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 1, i1 0)
  ret void
}

define void @bzero_2(ptr %a) nounwind {
; RV32-LABEL: bzero_2:
; RV32:       # %bb.0:
; RV32-NEXT:    sb zero, 1(a0)
; RV32-NEXT:    sb zero, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: bzero_2:
; RV64:       # %bb.0:
; RV64-NEXT:    sb zero, 1(a0)
; RV64-NEXT:    sb zero, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: bzero_2:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    sh zero, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: bzero_2:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    sh zero, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 2, i1 0)
  ret void
}

define void @bzero_4(ptr %a) nounwind {
; RV32-LABEL: bzero_4:
; RV32:       # %bb.0:
; RV32-NEXT:    sb zero, 3(a0)
; RV32-NEXT:    sb zero, 2(a0)
; RV32-NEXT:    sb zero, 1(a0)
; RV32-NEXT:    sb zero, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: bzero_4:
; RV64:       # %bb.0:
; RV64-NEXT:    sb zero, 3(a0)
; RV64-NEXT:    sb zero, 2(a0)
; RV64-NEXT:    sb zero, 1(a0)
; RV64-NEXT:    sb zero, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: bzero_4:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    sw zero, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: bzero_4:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    sw zero, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 4, i1 0)
  ret void
}

define void @bzero_8(ptr %a) nounwind {
; RV32-LABEL: bzero_8:
; RV32:       # %bb.0:
; RV32-NEXT:    sb zero, 7(a0)
; RV32-NEXT:    sb zero, 6(a0)
; RV32-NEXT:    sb zero, 5(a0)
; RV32-NEXT:    sb zero, 4(a0)
; RV32-NEXT:    sb zero, 3(a0)
; RV32-NEXT:    sb zero, 2(a0)
; RV32-NEXT:    sb zero, 1(a0)
; RV32-NEXT:    sb zero, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: bzero_8:
; RV64:       # %bb.0:
; RV64-NEXT:    sb zero, 7(a0)
; RV64-NEXT:    sb zero, 6(a0)
; RV64-NEXT:    sb zero, 5(a0)
; RV64-NEXT:    sb zero, 4(a0)
; RV64-NEXT:    sb zero, 3(a0)
; RV64-NEXT:    sb zero, 2(a0)
; RV64-NEXT:    sb zero, 1(a0)
; RV64-NEXT:    sb zero, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: bzero_8:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    sw zero, 4(a0)
; RV32-FAST-NEXT:    sw zero, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: bzero_8:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    sd zero, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 8, i1 0)
  ret void
}

define void @bzero_16(ptr %a) nounwind {
; RV32-LABEL: bzero_16:
; RV32:       # %bb.0:
; RV32-NEXT:    sb zero, 15(a0)
; RV32-NEXT:    sb zero, 14(a0)
; RV32-NEXT:    sb zero, 13(a0)
; RV32-NEXT:    sb zero, 12(a0)
; RV32-NEXT:    sb zero, 11(a0)
; RV32-NEXT:    sb zero, 10(a0)
; RV32-NEXT:    sb zero, 9(a0)
; RV32-NEXT:    sb zero, 8(a0)
; RV32-NEXT:    sb zero, 7(a0)
; RV32-NEXT:    sb zero, 6(a0)
; RV32-NEXT:    sb zero, 5(a0)
; RV32-NEXT:    sb zero, 4(a0)
; RV32-NEXT:    sb zero, 3(a0)
; RV32-NEXT:    sb zero, 2(a0)
; RV32-NEXT:    sb zero, 1(a0)
; RV32-NEXT:    sb zero, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: bzero_16:
; RV64:       # %bb.0:
; RV64-NEXT:    sb zero, 15(a0)
; RV64-NEXT:    sb zero, 14(a0)
; RV64-NEXT:    sb zero, 13(a0)
; RV64-NEXT:    sb zero, 12(a0)
; RV64-NEXT:    sb zero, 11(a0)
; RV64-NEXT:    sb zero, 10(a0)
; RV64-NEXT:    sb zero, 9(a0)
; RV64-NEXT:    sb zero, 8(a0)
; RV64-NEXT:    sb zero, 7(a0)
; RV64-NEXT:    sb zero, 6(a0)
; RV64-NEXT:    sb zero, 5(a0)
; RV64-NEXT:    sb zero, 4(a0)
; RV64-NEXT:    sb zero, 3(a0)
; RV64-NEXT:    sb zero, 2(a0)
; RV64-NEXT:    sb zero, 1(a0)
; RV64-NEXT:    sb zero, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: bzero_16:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    sw zero, 12(a0)
; RV32-FAST-NEXT:    sw zero, 8(a0)
; RV32-FAST-NEXT:    sw zero, 4(a0)
; RV32-FAST-NEXT:    sw zero, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: bzero_16:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    sd zero, 8(a0)
; RV64-FAST-NEXT:    sd zero, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 16, i1 0)
  ret void
}

define void @bzero_32(ptr %a) nounwind {
; RV32-LABEL: bzero_32:
; RV32:       # %bb.0:
; RV32-NEXT:    sb zero, 31(a0)
; RV32-NEXT:    sb zero, 30(a0)
; RV32-NEXT:    sb zero, 29(a0)
; RV32-NEXT:    sb zero, 28(a0)
; RV32-NEXT:    sb zero, 27(a0)
; RV32-NEXT:    sb zero, 26(a0)
; RV32-NEXT:    sb zero, 25(a0)
; RV32-NEXT:    sb zero, 24(a0)
; RV32-NEXT:    sb zero, 23(a0)
; RV32-NEXT:    sb zero, 22(a0)
; RV32-NEXT:    sb zero, 21(a0)
; RV32-NEXT:    sb zero, 20(a0)
; RV32-NEXT:    sb zero, 19(a0)
; RV32-NEXT:    sb zero, 18(a0)
; RV32-NEXT:    sb zero, 17(a0)
; RV32-NEXT:    sb zero, 16(a0)
; RV32-NEXT:    sb zero, 15(a0)
; RV32-NEXT:    sb zero, 14(a0)
; RV32-NEXT:    sb zero, 13(a0)
; RV32-NEXT:    sb zero, 12(a0)
; RV32-NEXT:    sb zero, 11(a0)
; RV32-NEXT:    sb zero, 10(a0)
; RV32-NEXT:    sb zero, 9(a0)
; RV32-NEXT:    sb zero, 8(a0)
; RV32-NEXT:    sb zero, 7(a0)
; RV32-NEXT:    sb zero, 6(a0)
; RV32-NEXT:    sb zero, 5(a0)
; RV32-NEXT:    sb zero, 4(a0)
; RV32-NEXT:    sb zero, 3(a0)
; RV32-NEXT:    sb zero, 2(a0)
; RV32-NEXT:    sb zero, 1(a0)
; RV32-NEXT:    sb zero, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: bzero_32:
; RV64:       # %bb.0:
; RV64-NEXT:    sb zero, 31(a0)
; RV64-NEXT:    sb zero, 30(a0)
; RV64-NEXT:    sb zero, 29(a0)
; RV64-NEXT:    sb zero, 28(a0)
; RV64-NEXT:    sb zero, 27(a0)
; RV64-NEXT:    sb zero, 26(a0)
; RV64-NEXT:    sb zero, 25(a0)
; RV64-NEXT:    sb zero, 24(a0)
; RV64-NEXT:    sb zero, 23(a0)
; RV64-NEXT:    sb zero, 22(a0)
; RV64-NEXT:    sb zero, 21(a0)
; RV64-NEXT:    sb zero, 20(a0)
; RV64-NEXT:    sb zero, 19(a0)
; RV64-NEXT:    sb zero, 18(a0)
; RV64-NEXT:    sb zero, 17(a0)
; RV64-NEXT:    sb zero, 16(a0)
; RV64-NEXT:    sb zero, 15(a0)
; RV64-NEXT:    sb zero, 14(a0)
; RV64-NEXT:    sb zero, 13(a0)
; RV64-NEXT:    sb zero, 12(a0)
; RV64-NEXT:    sb zero, 11(a0)
; RV64-NEXT:    sb zero, 10(a0)
; RV64-NEXT:    sb zero, 9(a0)
; RV64-NEXT:    sb zero, 8(a0)
; RV64-NEXT:    sb zero, 7(a0)
; RV64-NEXT:    sb zero, 6(a0)
; RV64-NEXT:    sb zero, 5(a0)
; RV64-NEXT:    sb zero, 4(a0)
; RV64-NEXT:    sb zero, 3(a0)
; RV64-NEXT:    sb zero, 2(a0)
; RV64-NEXT:    sb zero, 1(a0)
; RV64-NEXT:    sb zero, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: bzero_32:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    sw zero, 28(a0)
; RV32-FAST-NEXT:    sw zero, 24(a0)
; RV32-FAST-NEXT:    sw zero, 20(a0)
; RV32-FAST-NEXT:    sw zero, 16(a0)
; RV32-FAST-NEXT:    sw zero, 12(a0)
; RV32-FAST-NEXT:    sw zero, 8(a0)
; RV32-FAST-NEXT:    sw zero, 4(a0)
; RV32-FAST-NEXT:    sw zero, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: bzero_32:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    sd zero, 24(a0)
; RV64-FAST-NEXT:    sd zero, 16(a0)
; RV64-FAST-NEXT:    sd zero, 8(a0)
; RV64-FAST-NEXT:    sd zero, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 32, i1 0)
  ret void
}

define void @bzero_64(ptr %a) nounwind {
; RV32-LABEL: bzero_64:
; RV32:       # %bb.0:
; RV32-NEXT:    sb zero, 63(a0)
; RV32-NEXT:    sb zero, 62(a0)
; RV32-NEXT:    sb zero, 61(a0)
; RV32-NEXT:    sb zero, 60(a0)
; RV32-NEXT:    sb zero, 59(a0)
; RV32-NEXT:    sb zero, 58(a0)
; RV32-NEXT:    sb zero, 57(a0)
; RV32-NEXT:    sb zero, 56(a0)
; RV32-NEXT:    sb zero, 55(a0)
; RV32-NEXT:    sb zero, 54(a0)
; RV32-NEXT:    sb zero, 53(a0)
; RV32-NEXT:    sb zero, 52(a0)
; RV32-NEXT:    sb zero, 51(a0)
; RV32-NEXT:    sb zero, 50(a0)
; RV32-NEXT:    sb zero, 49(a0)
; RV32-NEXT:    sb zero, 48(a0)
; RV32-NEXT:    sb zero, 47(a0)
; RV32-NEXT:    sb zero, 46(a0)
; RV32-NEXT:    sb zero, 45(a0)
; RV32-NEXT:    sb zero, 44(a0)
; RV32-NEXT:    sb zero, 43(a0)
; RV32-NEXT:    sb zero, 42(a0)
; RV32-NEXT:    sb zero, 41(a0)
; RV32-NEXT:    sb zero, 40(a0)
; RV32-NEXT:    sb zero, 39(a0)
; RV32-NEXT:    sb zero, 38(a0)
; RV32-NEXT:    sb zero, 37(a0)
; RV32-NEXT:    sb zero, 36(a0)
; RV32-NEXT:    sb zero, 35(a0)
; RV32-NEXT:    sb zero, 34(a0)
; RV32-NEXT:    sb zero, 33(a0)
; RV32-NEXT:    sb zero, 32(a0)
; RV32-NEXT:    sb zero, 31(a0)
; RV32-NEXT:    sb zero, 30(a0)
; RV32-NEXT:    sb zero, 29(a0)
; RV32-NEXT:    sb zero, 28(a0)
; RV32-NEXT:    sb zero, 27(a0)
; RV32-NEXT:    sb zero, 26(a0)
; RV32-NEXT:    sb zero, 25(a0)
; RV32-NEXT:    sb zero, 24(a0)
; RV32-NEXT:    sb zero, 23(a0)
; RV32-NEXT:    sb zero, 22(a0)
; RV32-NEXT:    sb zero, 21(a0)
; RV32-NEXT:    sb zero, 20(a0)
; RV32-NEXT:    sb zero, 19(a0)
; RV32-NEXT:    sb zero, 18(a0)
; RV32-NEXT:    sb zero, 17(a0)
; RV32-NEXT:    sb zero, 16(a0)
; RV32-NEXT:    sb zero, 15(a0)
; RV32-NEXT:    sb zero, 14(a0)
; RV32-NEXT:    sb zero, 13(a0)
; RV32-NEXT:    sb zero, 12(a0)
; RV32-NEXT:    sb zero, 11(a0)
; RV32-NEXT:    sb zero, 10(a0)
; RV32-NEXT:    sb zero, 9(a0)
; RV32-NEXT:    sb zero, 8(a0)
; RV32-NEXT:    sb zero, 7(a0)
; RV32-NEXT:    sb zero, 6(a0)
; RV32-NEXT:    sb zero, 5(a0)
; RV32-NEXT:    sb zero, 4(a0)
; RV32-NEXT:    sb zero, 3(a0)
; RV32-NEXT:    sb zero, 2(a0)
; RV32-NEXT:    sb zero, 1(a0)
; RV32-NEXT:    sb zero, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: bzero_64:
; RV64:       # %bb.0:
; RV64-NEXT:    sb zero, 63(a0)
; RV64-NEXT:    sb zero, 62(a0)
; RV64-NEXT:    sb zero, 61(a0)
; RV64-NEXT:    sb zero, 60(a0)
; RV64-NEXT:    sb zero, 59(a0)
; RV64-NEXT:    sb zero, 58(a0)
; RV64-NEXT:    sb zero, 57(a0)
; RV64-NEXT:    sb zero, 56(a0)
; RV64-NEXT:    sb zero, 55(a0)
; RV64-NEXT:    sb zero, 54(a0)
; RV64-NEXT:    sb zero, 53(a0)
; RV64-NEXT:    sb zero, 52(a0)
; RV64-NEXT:    sb zero, 51(a0)
; RV64-NEXT:    sb zero, 50(a0)
; RV64-NEXT:    sb zero, 49(a0)
; RV64-NEXT:    sb zero, 48(a0)
; RV64-NEXT:    sb zero, 47(a0)
; RV64-NEXT:    sb zero, 46(a0)
; RV64-NEXT:    sb zero, 45(a0)
; RV64-NEXT:    sb zero, 44(a0)
; RV64-NEXT:    sb zero, 43(a0)
; RV64-NEXT:    sb zero, 42(a0)
; RV64-NEXT:    sb zero, 41(a0)
; RV64-NEXT:    sb zero, 40(a0)
; RV64-NEXT:    sb zero, 39(a0)
; RV64-NEXT:    sb zero, 38(a0)
; RV64-NEXT:    sb zero, 37(a0)
; RV64-NEXT:    sb zero, 36(a0)
; RV64-NEXT:    sb zero, 35(a0)
; RV64-NEXT:    sb zero, 34(a0)
; RV64-NEXT:    sb zero, 33(a0)
; RV64-NEXT:    sb zero, 32(a0)
; RV64-NEXT:    sb zero, 31(a0)
; RV64-NEXT:    sb zero, 30(a0)
; RV64-NEXT:    sb zero, 29(a0)
; RV64-NEXT:    sb zero, 28(a0)
; RV64-NEXT:    sb zero, 27(a0)
; RV64-NEXT:    sb zero, 26(a0)
; RV64-NEXT:    sb zero, 25(a0)
; RV64-NEXT:    sb zero, 24(a0)
; RV64-NEXT:    sb zero, 23(a0)
; RV64-NEXT:    sb zero, 22(a0)
; RV64-NEXT:    sb zero, 21(a0)
; RV64-NEXT:    sb zero, 20(a0)
; RV64-NEXT:    sb zero, 19(a0)
; RV64-NEXT:    sb zero, 18(a0)
; RV64-NEXT:    sb zero, 17(a0)
; RV64-NEXT:    sb zero, 16(a0)
; RV64-NEXT:    sb zero, 15(a0)
; RV64-NEXT:    sb zero, 14(a0)
; RV64-NEXT:    sb zero, 13(a0)
; RV64-NEXT:    sb zero, 12(a0)
; RV64-NEXT:    sb zero, 11(a0)
; RV64-NEXT:    sb zero, 10(a0)
; RV64-NEXT:    sb zero, 9(a0)
; RV64-NEXT:    sb zero, 8(a0)
; RV64-NEXT:    sb zero, 7(a0)
; RV64-NEXT:    sb zero, 6(a0)
; RV64-NEXT:    sb zero, 5(a0)
; RV64-NEXT:    sb zero, 4(a0)
; RV64-NEXT:    sb zero, 3(a0)
; RV64-NEXT:    sb zero, 2(a0)
; RV64-NEXT:    sb zero, 1(a0)
; RV64-NEXT:    sb zero, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: bzero_64:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    sw zero, 60(a0)
; RV32-FAST-NEXT:    sw zero, 56(a0)
; RV32-FAST-NEXT:    sw zero, 52(a0)
; RV32-FAST-NEXT:    sw zero, 48(a0)
; RV32-FAST-NEXT:    sw zero, 44(a0)
; RV32-FAST-NEXT:    sw zero, 40(a0)
; RV32-FAST-NEXT:    sw zero, 36(a0)
; RV32-FAST-NEXT:    sw zero, 32(a0)
; RV32-FAST-NEXT:    sw zero, 28(a0)
; RV32-FAST-NEXT:    sw zero, 24(a0)
; RV32-FAST-NEXT:    sw zero, 20(a0)
; RV32-FAST-NEXT:    sw zero, 16(a0)
; RV32-FAST-NEXT:    sw zero, 12(a0)
; RV32-FAST-NEXT:    sw zero, 8(a0)
; RV32-FAST-NEXT:    sw zero, 4(a0)
; RV32-FAST-NEXT:    sw zero, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: bzero_64:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    sd zero, 56(a0)
; RV64-FAST-NEXT:    sd zero, 48(a0)
; RV64-FAST-NEXT:    sd zero, 40(a0)
; RV64-FAST-NEXT:    sd zero, 32(a0)
; RV64-FAST-NEXT:    sd zero, 24(a0)
; RV64-FAST-NEXT:    sd zero, 16(a0)
; RV64-FAST-NEXT:    sd zero, 8(a0)
; RV64-FAST-NEXT:    sd zero, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr %a, i8 0, i64 64, i1 0)
  ret void
}

; /////////////////////////////////////////////////////////////////////////////

define void @aligned_bzero_2(ptr %a) nounwind {
; RV32-BOTH-LABEL: aligned_bzero_2:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    sh zero, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_bzero_2:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    sh zero, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 2 %a, i8 0, i64 2, i1 0)
  ret void
}

define void @aligned_bzero_4(ptr %a) nounwind {
; RV32-BOTH-LABEL: aligned_bzero_4:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    sw zero, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_bzero_4:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    sw zero, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 4 %a, i8 0, i64 4, i1 0)
  ret void
}

define void @aligned_bzero_8(ptr %a) nounwind {
; RV32-BOTH-LABEL: aligned_bzero_8:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    sw zero, 4(a0)
; RV32-BOTH-NEXT:    sw zero, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_bzero_8:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    sd zero, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 8 %a, i8 0, i64 8, i1 0)
  ret void
}


define void @aligned_bzero_16(ptr %a) nounwind {
; RV32-BOTH-LABEL: aligned_bzero_16:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    sw zero, 12(a0)
; RV32-BOTH-NEXT:    sw zero, 8(a0)
; RV32-BOTH-NEXT:    sw zero, 4(a0)
; RV32-BOTH-NEXT:    sw zero, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_bzero_16:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    sd zero, 8(a0)
; RV64-BOTH-NEXT:    sd zero, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 16 %a, i8 0, i64 16, i1 0)
  ret void
}

define void @aligned_bzero_32(ptr %a) nounwind {
; RV32-BOTH-LABEL: aligned_bzero_32:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    sw zero, 28(a0)
; RV32-BOTH-NEXT:    sw zero, 24(a0)
; RV32-BOTH-NEXT:    sw zero, 20(a0)
; RV32-BOTH-NEXT:    sw zero, 16(a0)
; RV32-BOTH-NEXT:    sw zero, 12(a0)
; RV32-BOTH-NEXT:    sw zero, 8(a0)
; RV32-BOTH-NEXT:    sw zero, 4(a0)
; RV32-BOTH-NEXT:    sw zero, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_bzero_32:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    sd zero, 24(a0)
; RV64-BOTH-NEXT:    sd zero, 16(a0)
; RV64-BOTH-NEXT:    sd zero, 8(a0)
; RV64-BOTH-NEXT:    sd zero, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 32 %a, i8 0, i64 32, i1 0)
  ret void
}

define void @aligned_bzero_64(ptr %a) nounwind {
; RV32-BOTH-LABEL: aligned_bzero_64:
; RV32-BOTH:       # %bb.0:
; RV32-BOTH-NEXT:    sw zero, 60(a0)
; RV32-BOTH-NEXT:    sw zero, 56(a0)
; RV32-BOTH-NEXT:    sw zero, 52(a0)
; RV32-BOTH-NEXT:    sw zero, 48(a0)
; RV32-BOTH-NEXT:    sw zero, 44(a0)
; RV32-BOTH-NEXT:    sw zero, 40(a0)
; RV32-BOTH-NEXT:    sw zero, 36(a0)
; RV32-BOTH-NEXT:    sw zero, 32(a0)
; RV32-BOTH-NEXT:    sw zero, 28(a0)
; RV32-BOTH-NEXT:    sw zero, 24(a0)
; RV32-BOTH-NEXT:    sw zero, 20(a0)
; RV32-BOTH-NEXT:    sw zero, 16(a0)
; RV32-BOTH-NEXT:    sw zero, 12(a0)
; RV32-BOTH-NEXT:    sw zero, 8(a0)
; RV32-BOTH-NEXT:    sw zero, 4(a0)
; RV32-BOTH-NEXT:    sw zero, 0(a0)
; RV32-BOTH-NEXT:    ret
;
; RV64-BOTH-LABEL: aligned_bzero_64:
; RV64-BOTH:       # %bb.0:
; RV64-BOTH-NEXT:    sd zero, 56(a0)
; RV64-BOTH-NEXT:    sd zero, 48(a0)
; RV64-BOTH-NEXT:    sd zero, 40(a0)
; RV64-BOTH-NEXT:    sd zero, 32(a0)
; RV64-BOTH-NEXT:    sd zero, 24(a0)
; RV64-BOTH-NEXT:    sd zero, 16(a0)
; RV64-BOTH-NEXT:    sd zero, 8(a0)
; RV64-BOTH-NEXT:    sd zero, 0(a0)
; RV64-BOTH-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 64 %a, i8 0, i64 64, i1 0)
  ret void
}


; /////////////////////////////////////////////////////////////////////////////
; Usual overlap tricks

define void @aligned_bzero_7(ptr %a) nounwind {
; RV32-LABEL: aligned_bzero_7:
; RV32:       # %bb.0:
; RV32-NEXT:    sb zero, 6(a0)
; RV32-NEXT:    sh zero, 4(a0)
; RV32-NEXT:    sw zero, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: aligned_bzero_7:
; RV64:       # %bb.0:
; RV64-NEXT:    sb zero, 6(a0)
; RV64-NEXT:    sh zero, 4(a0)
; RV64-NEXT:    sw zero, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: aligned_bzero_7:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    sw zero, 3(a0)
; RV32-FAST-NEXT:    sw zero, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: aligned_bzero_7:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    sw zero, 3(a0)
; RV64-FAST-NEXT:    sw zero, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 8 %a, i8 0, i64 7, i1 0)
  ret void
}

define void @aligned_bzero_15(ptr %a) nounwind {
; RV32-LABEL: aligned_bzero_15:
; RV32:       # %bb.0:
; RV32-NEXT:    sb zero, 14(a0)
; RV32-NEXT:    sh zero, 12(a0)
; RV32-NEXT:    sw zero, 8(a0)
; RV32-NEXT:    sw zero, 4(a0)
; RV32-NEXT:    sw zero, 0(a0)
; RV32-NEXT:    ret
;
; RV64-LABEL: aligned_bzero_15:
; RV64:       # %bb.0:
; RV64-NEXT:    sb zero, 14(a0)
; RV64-NEXT:    sh zero, 12(a0)
; RV64-NEXT:    sw zero, 8(a0)
; RV64-NEXT:    sd zero, 0(a0)
; RV64-NEXT:    ret
;
; RV32-FAST-LABEL: aligned_bzero_15:
; RV32-FAST:       # %bb.0:
; RV32-FAST-NEXT:    sw zero, 11(a0)
; RV32-FAST-NEXT:    sw zero, 8(a0)
; RV32-FAST-NEXT:    sw zero, 4(a0)
; RV32-FAST-NEXT:    sw zero, 0(a0)
; RV32-FAST-NEXT:    ret
;
; RV64-FAST-LABEL: aligned_bzero_15:
; RV64-FAST:       # %bb.0:
; RV64-FAST-NEXT:    sd zero, 7(a0)
; RV64-FAST-NEXT:    sd zero, 0(a0)
; RV64-FAST-NEXT:    ret
  tail call void @llvm.memset.inline.p0.i64(ptr align 8 %a, i8 0, i64 15, i1 0)
  ret void
}