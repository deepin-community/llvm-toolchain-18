; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 2
; RUN: opt < %s -passes=instcombine -S | FileCheck %s
; PR12234

@g = extern_weak global i32
define i32 @function(i32 %x) nounwind {
; CHECK-LABEL: define i32 @function
; CHECK-SAME: (i32 [[X:%.*]]) #[[ATTR0:[0-9]+]] {
; CHECK-NEXT:  entry:
; CHECK-NEXT:    [[XOR:%.*]] = xor i32 [[X]], 1
; CHECK-NEXT:    store volatile i32 [[XOR]], ptr inttoptr (i64 1 to ptr), align 4
; CHECK-NEXT:    [[OR4:%.*]] = or i32 [[X]], 1
; CHECK-NEXT:    ret i32 [[OR4]]
;
entry:
  %xor = xor i32 %x, 1
  store volatile i32 %xor, ptr inttoptr (i64 1 to ptr), align 4
  %ext = zext i1 icmp eq (ptr @g, ptr null) to i32
  %or = or i32 %ext, 1
  %or4 = or i32 %or, %xor
  ret i32 %or4
}