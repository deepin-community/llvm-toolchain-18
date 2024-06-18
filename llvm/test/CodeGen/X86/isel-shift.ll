; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-apple-darwin10 | FileCheck %s --check-prefixes=X86,SDAG,SDAG-X86
; RUN: llc < %s -mtriple=i686-apple-darwin10 -fast-isel -fast-isel-abort=1 | FileCheck %s --check-prefixes=X86,FASTISEL-X86
; TODO: llc < %s -mtriple=i686-apple-darwin10 -global-isel -global-isel-abort=1 | FileCheck %s --check-prefixes=X86,GISEL-X86
; RUN: llc < %s -mtriple=x86_64-apple-darwin10 | FileCheck %s --check-prefixes=X64,SDAG,SDAG-X64
; RUN: llc < %s -mtriple=x86_64-apple-darwin10 -fast-isel -fast-isel-abort=1 | FileCheck %s --check-prefixes=X64,FASTISEL-X64
; RUN: llc < %s -mtriple=x86_64-apple-darwin10 -global-isel -global-isel-abort=1 | FileCheck %s --check-prefixes=X64,GISEL-X64

define i8 @shl_i8(i8 %a, i8 %b) {
; X86-LABEL: shl_i8:
; X86:       ## %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shlb %cl, %al
; X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_i8:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movl %edi, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    shlb %cl, %al
; SDAG-X64-NEXT:    ## kill: def $al killed $al killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_i8:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; FASTISEL-X64-NEXT:    shlb %cl, %al
; FASTISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_i8:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    shlb %cl, %al
; GISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; GISEL-X64-NEXT:    retq
  %c = shl i8 %a, %b
  ret i8 %c
}

define i16 @shl_i16(i16 %a, i16 %b) {
; SDAG-X86-LABEL: shl_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shll %cl, %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    ## kill: def $cl killed $cx
; FASTISEL-X86-NEXT:    shlw %cl, %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movl %edi, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    shll %cl, %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cx killed $cx killed $ecx
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $cx
; FASTISEL-X64-NEXT:    shlw %cl, %ax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    shlw %cl, %ax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = shl i16 %a, %b
  ret i16 %c
}

define i32 @shl_i32(i32 %a, i32 %b) {
; SDAG-X86-LABEL: shl_i32:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shll %cl, %eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_i32:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    ## kill: def $cl killed $ecx
; FASTISEL-X86-NEXT:    shll %cl, %eax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_i32:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movl %edi, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    shll %cl, %eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_i32:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $ecx
; FASTISEL-X64-NEXT:    shll %cl, %eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_i32:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    shll %cl, %eax
; GISEL-X64-NEXT:    retq
  %c = shl i32 %a, %b
  ret i32 %c
}

define i64 @shl_i64(i64 %a, i64 %b) nounwind {
; SDAG-X86-LABEL: shl_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    pushl %esi
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; SDAG-X86-NEXT:    movl %esi, %eax
; SDAG-X86-NEXT:    shll %cl, %eax
; SDAG-X86-NEXT:    shldl %cl, %esi, %edx
; SDAG-X86-NEXT:    testb $32, %cl
; SDAG-X86-NEXT:    je LBB3_2
; SDAG-X86-NEXT:  ## %bb.1:
; SDAG-X86-NEXT:    movl %eax, %edx
; SDAG-X86-NEXT:    xorl %eax, %eax
; SDAG-X86-NEXT:  LBB3_2:
; SDAG-X86-NEXT:    popl %esi
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shldl %cl, %eax, %edx
; FASTISEL-X86-NEXT:    shll %cl, %eax
; FASTISEL-X86-NEXT:    testb $32, %cl
; FASTISEL-X86-NEXT:    je LBB3_2
; FASTISEL-X86-NEXT:  ## %bb.1:
; FASTISEL-X86-NEXT:    movl %eax, %edx
; FASTISEL-X86-NEXT:    xorl %eax, %eax
; FASTISEL-X86-NEXT:  LBB3_2:
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_i64:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movq %rsi, %rcx
; SDAG-X64-NEXT:    movq %rdi, %rax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $rcx
; SDAG-X64-NEXT:    shlq %cl, %rax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_i64:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movq %rsi, %rcx
; FASTISEL-X64-NEXT:    movq %rdi, %rax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $rcx
; FASTISEL-X64-NEXT:    shlq %cl, %rax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_i64:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movq %rdi, %rax
; GISEL-X64-NEXT:    movq %rsi, %rcx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $rcx
; GISEL-X64-NEXT:    shlq %cl, %rax
; GISEL-X64-NEXT:    retq
  %c = shl i64 %a, %b
  ret i64 %c
}

define i8 @lshr_i8(i8 %a, i8 %b) {
; X86-LABEL: lshr_i8:
; X86:       ## %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrb %cl, %al
; X86-NEXT:    retl
;
; SDAG-X64-LABEL: lshr_i8:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movl %edi, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    shrb %cl, %al
; SDAG-X64-NEXT:    ## kill: def $al killed $al killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: lshr_i8:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; FASTISEL-X64-NEXT:    shrb %cl, %al
; FASTISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: lshr_i8:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    shrb %cl, %al
; GISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; GISEL-X64-NEXT:    retq
  %c = lshr i8 %a, %b
  ret i8 %c
}

define i16 @lshr_i16(i16 %a, i16 %b) {
; SDAG-X86-LABEL: lshr_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shrl %cl, %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: lshr_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    ## kill: def $cl killed $cx
; FASTISEL-X86-NEXT:    shrw %cl, %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: lshr_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movzwl %di, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    shrl %cl, %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: lshr_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cx killed $cx killed $ecx
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $cx
; FASTISEL-X64-NEXT:    shrw %cl, %ax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: lshr_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    shrw %cl, %ax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = lshr i16 %a, %b
  ret i16 %c
}

define i32 @lshr_i32(i32 %a, i32 %b) {
; SDAG-X86-LABEL: lshr_i32:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shrl %cl, %eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: lshr_i32:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    ## kill: def $cl killed $ecx
; FASTISEL-X86-NEXT:    shrl %cl, %eax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: lshr_i32:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movl %edi, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    shrl %cl, %eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: lshr_i32:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $ecx
; FASTISEL-X64-NEXT:    shrl %cl, %eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: lshr_i32:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    shrl %cl, %eax
; GISEL-X64-NEXT:    retq
  %c = lshr i32 %a, %b
  ret i32 %c
}

define i64 @lshr_i64(i64 %a, i64 %b) nounwind {
; SDAG-X86-LABEL: lshr_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    pushl %esi
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; SDAG-X86-NEXT:    movl %esi, %edx
; SDAG-X86-NEXT:    shrl %cl, %edx
; SDAG-X86-NEXT:    shrdl %cl, %esi, %eax
; SDAG-X86-NEXT:    testb $32, %cl
; SDAG-X86-NEXT:    je LBB7_2
; SDAG-X86-NEXT:  ## %bb.1:
; SDAG-X86-NEXT:    movl %edx, %eax
; SDAG-X86-NEXT:    xorl %edx, %edx
; SDAG-X86-NEXT:  LBB7_2:
; SDAG-X86-NEXT:    popl %esi
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: lshr_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shrdl %cl, %edx, %eax
; FASTISEL-X86-NEXT:    shrl %cl, %edx
; FASTISEL-X86-NEXT:    testb $32, %cl
; FASTISEL-X86-NEXT:    je LBB7_2
; FASTISEL-X86-NEXT:  ## %bb.1:
; FASTISEL-X86-NEXT:    movl %edx, %eax
; FASTISEL-X86-NEXT:    xorl %edx, %edx
; FASTISEL-X86-NEXT:  LBB7_2:
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: lshr_i64:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movq %rsi, %rcx
; SDAG-X64-NEXT:    movq %rdi, %rax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $rcx
; SDAG-X64-NEXT:    shrq %cl, %rax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: lshr_i64:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movq %rsi, %rcx
; FASTISEL-X64-NEXT:    movq %rdi, %rax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $rcx
; FASTISEL-X64-NEXT:    shrq %cl, %rax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: lshr_i64:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movq %rdi, %rax
; GISEL-X64-NEXT:    movq %rsi, %rcx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $rcx
; GISEL-X64-NEXT:    shrq %cl, %rax
; GISEL-X64-NEXT:    retq
  %c = lshr i64 %a, %b
  ret i64 %c
}

define i8 @ashr_i8(i8 %a, i8 %b) {
; X86-LABEL: ashr_i8:
; X86:       ## %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    sarb %cl, %al
; X86-NEXT:    retl
;
; SDAG-X64-LABEL: ashr_i8:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movl %edi, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    sarb %cl, %al
; SDAG-X64-NEXT:    ## kill: def $al killed $al killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: ashr_i8:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; FASTISEL-X64-NEXT:    sarb %cl, %al
; FASTISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: ashr_i8:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    sarb %cl, %al
; GISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; GISEL-X64-NEXT:    retq
  %c = ashr i8 %a, %b
  ret i8 %c
}

define i16 @ashr_i16(i16 %a, i16 %b) {
; SDAG-X86-LABEL: ashr_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movswl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    sarl %cl, %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: ashr_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    ## kill: def $cl killed $cx
; FASTISEL-X86-NEXT:    sarw %cl, %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: ashr_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movswl %di, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    sarl %cl, %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: ashr_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cx killed $cx killed $ecx
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $cx
; FASTISEL-X64-NEXT:    sarw %cl, %ax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: ashr_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    sarw %cl, %ax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = ashr i16 %a, %b
  ret i16 %c
}

define i32 @ashr_i32(i32 %a, i32 %b) {
; SDAG-X86-LABEL: ashr_i32:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    sarl %cl, %eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: ashr_i32:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    ## kill: def $cl killed $ecx
; FASTISEL-X86-NEXT:    sarl %cl, %eax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: ashr_i32:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %esi, %ecx
; SDAG-X64-NEXT:    movl %edi, %eax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; SDAG-X64-NEXT:    sarl %cl, %eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: ashr_i32:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %esi, %ecx
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $ecx
; FASTISEL-X64-NEXT:    sarl %cl, %eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: ashr_i32:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    movl %esi, %ecx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $ecx
; GISEL-X64-NEXT:    sarl %cl, %eax
; GISEL-X64-NEXT:    retq
  %c = ashr i32 %a, %b
  ret i32 %c
}

define i64 @ashr_i64(i64 %a, i64 %b) nounwind {
; SDAG-X86-LABEL: ashr_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    pushl %esi
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %ecx
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; SDAG-X86-NEXT:    movl %esi, %edx
; SDAG-X86-NEXT:    sarl %cl, %edx
; SDAG-X86-NEXT:    shrdl %cl, %esi, %eax
; SDAG-X86-NEXT:    testb $32, %cl
; SDAG-X86-NEXT:    je LBB11_2
; SDAG-X86-NEXT:  ## %bb.1:
; SDAG-X86-NEXT:    sarl $31, %esi
; SDAG-X86-NEXT:    movl %edx, %eax
; SDAG-X86-NEXT:    movl %esi, %edx
; SDAG-X86-NEXT:  LBB11_2:
; SDAG-X86-NEXT:    popl %esi
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: ashr_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    pushl %esi
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %esi
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shrdl %cl, %esi, %eax
; FASTISEL-X86-NEXT:    movl %esi, %edx
; FASTISEL-X86-NEXT:    sarl %cl, %edx
; FASTISEL-X86-NEXT:    testb $32, %cl
; FASTISEL-X86-NEXT:    je LBB11_2
; FASTISEL-X86-NEXT:  ## %bb.1:
; FASTISEL-X86-NEXT:    sarl $31, %esi
; FASTISEL-X86-NEXT:    movl %edx, %eax
; FASTISEL-X86-NEXT:    movl %esi, %edx
; FASTISEL-X86-NEXT:  LBB11_2:
; FASTISEL-X86-NEXT:    popl %esi
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: ashr_i64:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movq %rsi, %rcx
; SDAG-X64-NEXT:    movq %rdi, %rax
; SDAG-X64-NEXT:    ## kill: def $cl killed $cl killed $rcx
; SDAG-X64-NEXT:    sarq %cl, %rax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: ashr_i64:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movq %rsi, %rcx
; FASTISEL-X64-NEXT:    movq %rdi, %rax
; FASTISEL-X64-NEXT:    ## kill: def $cl killed $rcx
; FASTISEL-X64-NEXT:    sarq %cl, %rax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: ashr_i64:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movq %rdi, %rax
; GISEL-X64-NEXT:    movq %rsi, %rcx
; GISEL-X64-NEXT:    ## kill: def $cl killed $cl killed $rcx
; GISEL-X64-NEXT:    sarq %cl, %rax
; GISEL-X64-NEXT:    retq
  %c = ashr i64 %a, %b
  ret i64 %c
}

define i8 @shl_imm1_i8(i8 %a) {
; SDAG-X86-LABEL: shl_imm1_i8:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    addb %al, %al
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_imm1_i8:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shlb %al
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_imm1_i8:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; SDAG-X64-NEXT:    leal (%rdi,%rdi), %eax
; SDAG-X64-NEXT:    ## kill: def $al killed $al killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_imm1_i8:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; FASTISEL-X64-NEXT:    leal (,%rdi,2), %eax
; FASTISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_imm1_i8:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; GISEL-X64-NEXT:    leal (%rdi,%rdi), %eax
; GISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; GISEL-X64-NEXT:    retq
  %c = shl i8 %a, 1
  ret i8 %c
}

define i16 @shl_imm1_i16(i16 %a) {
; SDAG-X86-LABEL: shl_imm1_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    addl %eax, %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_imm1_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shlw %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_imm1_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; SDAG-X64-NEXT:    leal (%rdi,%rdi), %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_imm1_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; FASTISEL-X64-NEXT:    leal (,%rdi,2), %eax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_imm1_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; GISEL-X64-NEXT:    leal (%rdi,%rdi), %eax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = shl i16 %a, 1
  ret i16 %c
}

define i32 @shl_imm1_i32(i32 %a) {
; SDAG-X86-LABEL: shl_imm1_i32:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    addl %eax, %eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_imm1_i32:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shll %eax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_imm1_i32:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; SDAG-X64-NEXT:    leal (%rdi,%rdi), %eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_imm1_i32:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; FASTISEL-X64-NEXT:    leal (,%rdi,2), %eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_imm1_i32:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    ## kill: def $edi killed $edi def $rdi
; GISEL-X64-NEXT:    leal (%rdi,%rdi), %eax
; GISEL-X64-NEXT:    retq
  %c = shl i32 %a, 1
  ret i32 %c
}

define i64 @shl_imm1_i64(i64 %a) {
; SDAG-X86-LABEL: shl_imm1_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; SDAG-X86-NEXT:    shldl $1, %eax, %edx
; SDAG-X86-NEXT:    addl %eax, %eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_imm1_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shldl $1, %eax, %edx
; FASTISEL-X86-NEXT:    addl %eax, %eax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_imm1_i64:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    leaq (%rdi,%rdi), %rax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_imm1_i64:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    leaq (,%rdi,2), %rax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_imm1_i64:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    leaq (%rdi,%rdi), %rax
; GISEL-X64-NEXT:    retq
  %c = shl i64 %a, 1
  ret i64 %c
}

define i8 @lshr_imm1_i8(i8 %a) {
; X86-LABEL: lshr_imm1_i8:
; X86:       ## %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrb %al
; X86-NEXT:    retl
;
; X64-LABEL: lshr_imm1_i8:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shrb %al
; X64-NEXT:    ## kill: def $al killed $al killed $eax
; X64-NEXT:    retq
  %c = lshr i8 %a, 1
  ret i8 %c
}

define i16 @lshr_imm1_i16(i16 %a) {
; SDAG-X86-LABEL: lshr_imm1_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shrl %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: lshr_imm1_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shrw %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: lshr_imm1_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movzwl %di, %eax
; SDAG-X64-NEXT:    shrl %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: lshr_imm1_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    shrw %ax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: lshr_imm1_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    shrw %ax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = lshr i16 %a, 1
  ret i16 %c
}

define i32 @lshr_imm1_i32(i32 %a) {
; X86-LABEL: lshr_imm1_i32:
; X86:       ## %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrl %eax
; X86-NEXT:    retl
;
; X64-LABEL: lshr_imm1_i32:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shrl %eax
; X64-NEXT:    retq
  %c = lshr i32 %a, 1
  ret i32 %c
}

define i64 @lshr_imm1_i64(i64 %a) {
; SDAG-X86-LABEL: lshr_imm1_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; SDAG-X86-NEXT:    shrdl $1, %edx, %eax
; SDAG-X86-NEXT:    shrl %edx
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: lshr_imm1_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shrdl $1, %edx, %eax
; FASTISEL-X86-NEXT:    shrl %edx
; FASTISEL-X86-NEXT:    retl
;
; X64-LABEL: lshr_imm1_i64:
; X64:       ## %bb.0:
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    shrq %rax
; X64-NEXT:    retq
  %c = lshr i64 %a, 1
  ret i64 %c
}

define i8 @ashr_imm1_i8(i8 %a) {
; X86-LABEL: ashr_imm1_i8:
; X86:       ## %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    sarb %al
; X86-NEXT:    retl
;
; X64-LABEL: ashr_imm1_i8:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    sarb %al
; X64-NEXT:    ## kill: def $al killed $al killed $eax
; X64-NEXT:    retq
  %c = ashr i8 %a, 1
  ret i8 %c
}

define i16 @ashr_imm1_i16(i16 %a) {
; SDAG-X86-LABEL: ashr_imm1_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movswl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shrl %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: ashr_imm1_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    sarw %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: ashr_imm1_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movswl %di, %eax
; SDAG-X64-NEXT:    shrl %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: ashr_imm1_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    sarw %ax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: ashr_imm1_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    sarw %ax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = ashr i16 %a, 1
  ret i16 %c
}

define i32 @ashr_imm1_i32(i32 %a) {
; X86-LABEL: ashr_imm1_i32:
; X86:       ## %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    sarl %eax
; X86-NEXT:    retl
;
; X64-LABEL: ashr_imm1_i32:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    sarl %eax
; X64-NEXT:    retq
  %c = ashr i32 %a, 1
  ret i32 %c
}

define i64 @ashr_imm1_i64(i64 %a) {
; SDAG-X86-LABEL: ashr_imm1_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; SDAG-X86-NEXT:    shrdl $1, %edx, %eax
; SDAG-X86-NEXT:    sarl %edx
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: ashr_imm1_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shrdl $1, %edx, %eax
; FASTISEL-X86-NEXT:    sarl %edx
; FASTISEL-X86-NEXT:    retl
;
; X64-LABEL: ashr_imm1_i64:
; X64:       ## %bb.0:
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    sarq %rax
; X64-NEXT:    retq
  %c = ashr i64 %a, 1
  ret i64 %c
}

define i8 @shl_imm4_i8(i8 %a) {
; X86-LABEL: shl_imm4_i8:
; X86:       ## %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shlb $4, %al
; X86-NEXT:    retl
;
; X64-LABEL: shl_imm4_i8:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shlb $4, %al
; X64-NEXT:    ## kill: def $al killed $al killed $eax
; X64-NEXT:    retq
  %c = shl i8 %a, 4
  ret i8 %c
}

define i16 @shl_imm4_i16(i16 %a) {
; SDAG-X86-LABEL: shl_imm4_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shll $4, %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_imm4_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shlw $4, %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: shl_imm4_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movl %edi, %eax
; SDAG-X64-NEXT:    shll $4, %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: shl_imm4_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    shlw $4, %ax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: shl_imm4_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    shlw $4, %ax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = shl i16 %a, 4
  ret i16 %c
}

define i32 @shl_imm4_i32(i32 %a) {
; X86-LABEL: shl_imm4_i32:
; X86:       ## %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shll $4, %eax
; X86-NEXT:    retl
;
; X64-LABEL: shl_imm4_i32:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shll $4, %eax
; X64-NEXT:    retq
  %c = shl i32 %a, 4
  ret i32 %c
}

define i64 @shl_imm4_i64(i64 %a) {
; SDAG-X86-LABEL: shl_imm4_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; SDAG-X86-NEXT:    shldl $4, %eax, %edx
; SDAG-X86-NEXT:    shll $4, %eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: shl_imm4_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shldl $4, %eax, %edx
; FASTISEL-X86-NEXT:    shll $4, %eax
; FASTISEL-X86-NEXT:    retl
;
; X64-LABEL: shl_imm4_i64:
; X64:       ## %bb.0:
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    shlq $4, %rax
; X64-NEXT:    retq
  %c = shl i64 %a, 4
  ret i64 %c
}

define i8 @lshr_imm4_i8(i8 %a) {
; X86-LABEL: lshr_imm4_i8:
; X86:       ## %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrb $4, %al
; X86-NEXT:    retl
;
; X64-LABEL: lshr_imm4_i8:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shrb $4, %al
; X64-NEXT:    ## kill: def $al killed $al killed $eax
; X64-NEXT:    retq
  %c = lshr i8 %a, 4
  ret i8 %c
}

define i16 @lshr_imm4_i16(i16 %a) {
; SDAG-X86-LABEL: lshr_imm4_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shrl $4, %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: lshr_imm4_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shrw $4, %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: lshr_imm4_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movzwl %di, %eax
; SDAG-X64-NEXT:    shrl $4, %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: lshr_imm4_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    shrw $4, %ax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: lshr_imm4_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    shrw $4, %ax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = lshr i16 %a, 4
  ret i16 %c
}

define i32 @lshr_imm4_i32(i32 %a) {
; X86-LABEL: lshr_imm4_i32:
; X86:       ## %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    shrl $4, %eax
; X86-NEXT:    retl
;
; X64-LABEL: lshr_imm4_i32:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    shrl $4, %eax
; X64-NEXT:    retq
  %c = lshr i32 %a, 4
  ret i32 %c
}

define i64 @lshr_imm4_i64(i64 %a) {
; SDAG-X86-LABEL: lshr_imm4_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; SDAG-X86-NEXT:    shrdl $4, %edx, %eax
; SDAG-X86-NEXT:    shrl $4, %edx
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: lshr_imm4_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shrdl $4, %edx, %eax
; FASTISEL-X86-NEXT:    shrl $4, %edx
; FASTISEL-X86-NEXT:    retl
;
; X64-LABEL: lshr_imm4_i64:
; X64:       ## %bb.0:
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    shrq $4, %rax
; X64-NEXT:    retq
  %c = lshr i64 %a, 4
  ret i64 %c
}

define i8 @ashr_imm4_i8(i8 %a) {
; X86-LABEL: ashr_imm4_i8:
; X86:       ## %bb.0:
; X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    sarb $4, %al
; X86-NEXT:    retl
;
; X64-LABEL: ashr_imm4_i8:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    sarb $4, %al
; X64-NEXT:    ## kill: def $al killed $al killed $eax
; X64-NEXT:    retq
  %c = ashr i8 %a, 4
  ret i8 %c
}

define i16 @ashr_imm4_i16(i16 %a) {
; SDAG-X86-LABEL: ashr_imm4_i16:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movswl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    shrl $4, %eax
; SDAG-X86-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: ashr_imm4_i16:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzwl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    sarw $4, %ax
; FASTISEL-X86-NEXT:    retl
;
; SDAG-X64-LABEL: ashr_imm4_i16:
; SDAG-X64:       ## %bb.0:
; SDAG-X64-NEXT:    movswl %di, %eax
; SDAG-X64-NEXT:    shrl $4, %eax
; SDAG-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; SDAG-X64-NEXT:    retq
;
; FASTISEL-X64-LABEL: ashr_imm4_i16:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    sarw $4, %ax
; FASTISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: ashr_imm4_i16:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    sarw $4, %ax
; GISEL-X64-NEXT:    ## kill: def $ax killed $ax killed $eax
; GISEL-X64-NEXT:    retq
  %c = ashr i16 %a, 4
  ret i16 %c
}

define i32 @ashr_imm4_i32(i32 %a) {
; X86-LABEL: ashr_imm4_i32:
; X86:       ## %bb.0:
; X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X86-NEXT:    sarl $4, %eax
; X86-NEXT:    retl
;
; X64-LABEL: ashr_imm4_i32:
; X64:       ## %bb.0:
; X64-NEXT:    movl %edi, %eax
; X64-NEXT:    sarl $4, %eax
; X64-NEXT:    retq
  %c = ashr i32 %a, 4
  ret i32 %c
}

define i64 @ashr_imm4_i64(i64 %a) {
; SDAG-X86-LABEL: ashr_imm4_i64:
; SDAG-X86:       ## %bb.0:
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; SDAG-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; SDAG-X86-NEXT:    shrdl $4, %edx, %eax
; SDAG-X86-NEXT:    sarl $4, %edx
; SDAG-X86-NEXT:    retl
;
; FASTISEL-X86-LABEL: ashr_imm4_i64:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %edx
; FASTISEL-X86-NEXT:    movl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    shrdl $4, %edx, %eax
; FASTISEL-X86-NEXT:    sarl $4, %edx
; FASTISEL-X86-NEXT:    retl
;
; X64-LABEL: ashr_imm4_i64:
; X64:       ## %bb.0:
; X64-NEXT:    movq %rdi, %rax
; X64-NEXT:    sarq $4, %rax
; X64-NEXT:    retq
  %c = ashr i64 %a, 4
  ret i64 %c
}

define i8 @PR36731(i8 %a) {
; SDAG-LABEL: PR36731:
; SDAG:       ## %bb.0:
; SDAG-NEXT:    ret{{[l|q]}}
;
; FASTISEL-X86-LABEL: PR36731:
; FASTISEL-X86:       ## %bb.0:
; FASTISEL-X86-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; FASTISEL-X86-NEXT:    movb $255, %cl
; FASTISEL-X86-NEXT:    shlb %cl, %al
; FASTISEL-X86-NEXT:    retl
;
; FASTISEL-X64-LABEL: PR36731:
; FASTISEL-X64:       ## %bb.0:
; FASTISEL-X64-NEXT:    movl %edi, %eax
; FASTISEL-X64-NEXT:    movb $255, %cl
; FASTISEL-X64-NEXT:    shlb %cl, %al
; FASTISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; FASTISEL-X64-NEXT:    retq
;
; GISEL-X64-LABEL: PR36731:
; GISEL-X64:       ## %bb.0:
; GISEL-X64-NEXT:    movl %edi, %eax
; GISEL-X64-NEXT:    shlb $255, %al
; GISEL-X64-NEXT:    ## kill: def $al killed $al killed $eax
; GISEL-X64-NEXT:    retq
  %b = shl i8 %a, -1
  ret i8 %b
}