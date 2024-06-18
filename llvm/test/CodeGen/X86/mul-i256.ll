; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i386-unknown | FileCheck %s --check-prefix=X32
; RUN: llc < %s -mtriple=x86_64-unknown | FileCheck %s --check-prefix=X64

target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"

define void @test(ptr %a, ptr %b, ptr %out) #0 {
; X32-LABEL: test:
; X32:       # %bb.0: # %entry
; X32-NEXT:    pushl %ebp
; X32-NEXT:    .cfi_def_cfa_offset 8
; X32-NEXT:    pushl %ebx
; X32-NEXT:    .cfi_def_cfa_offset 12
; X32-NEXT:    pushl %edi
; X32-NEXT:    .cfi_def_cfa_offset 16
; X32-NEXT:    pushl %esi
; X32-NEXT:    .cfi_def_cfa_offset 20
; X32-NEXT:    subl $72, %esp
; X32-NEXT:    .cfi_def_cfa_offset 92
; X32-NEXT:    .cfi_offset %esi, -20
; X32-NEXT:    .cfi_offset %edi, -16
; X32-NEXT:    .cfi_offset %ebx, -12
; X32-NEXT:    .cfi_offset %ebp, -8
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl 12(%eax), %ebx
; X32-NEXT:    movl 8(%eax), %ebp
; X32-NEXT:    movl (%edx), %edi
; X32-NEXT:    movl %edi, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %ebp, %eax
; X32-NEXT:    movl %ebp, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    mull %edi
; X32-NEXT:    movl %edx, %esi
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %ebx, %eax
; X32-NEXT:    movl %ebx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    mull %edi
; X32-NEXT:    movl %edx, %ecx
; X32-NEXT:    movl %eax, %edi
; X32-NEXT:    addl %esi, %edi
; X32-NEXT:    adcl $0, %ecx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl 4(%eax), %esi
; X32-NEXT:    movl %ebp, %eax
; X32-NEXT:    mull %esi
; X32-NEXT:    movl %esi, %ebp
; X32-NEXT:    movl %esi, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %edx, %esi
; X32-NEXT:    addl %edi, %eax
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    adcl %ecx, %esi
; X32-NEXT:    setb %cl
; X32-NEXT:    movl %ebx, %eax
; X32-NEXT:    mull %ebp
; X32-NEXT:    addl %esi, %eax
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movzbl %cl, %eax
; X32-NEXT:    adcl %eax, %edx
; X32-NEXT:    movl %edx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X32-NEXT:    movl (%esi), %ebx
; X32-NEXT:    movl %ebx, %eax
; X32-NEXT:    movl %ebx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Reload
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %edx, %edi
; X32-NEXT:    movl 4(%esi), %ebp
; X32-NEXT:    movl %ebp, %eax
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, %ecx
; X32-NEXT:    movl %eax, %esi
; X32-NEXT:    addl %edi, %esi
; X32-NEXT:    adcl $0, %ecx
; X32-NEXT:    movl %ebx, %eax
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %edi # 4-byte Reload
; X32-NEXT:    mull %edi
; X32-NEXT:    movl %edx, %ebx
; X32-NEXT:    addl %esi, %eax
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    adcl %ecx, %ebx
; X32-NEXT:    setb %cl
; X32-NEXT:    movl %ebp, %eax
; X32-NEXT:    movl %ebp, %esi
; X32-NEXT:    mull %edi
; X32-NEXT:    addl %ebx, %eax
; X32-NEXT:    movzbl %cl, %ecx
; X32-NEXT:    adcl %ecx, %edx
; X32-NEXT:    addl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Folded Reload
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %edx # 4-byte Folded Reload
; X32-NEXT:    movl %edx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    adcl $0, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Folded Spill
; X32-NEXT:    adcl $0, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Folded Spill
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl 8(%eax), %ecx
; X32-NEXT:    movl %ecx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %edi # 4-byte Reload
; X32-NEXT:    movl %edi, %eax
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %ebp, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %ebp, %eax
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, %ecx
; X32-NEXT:    movl %eax, %ebx
; X32-NEXT:    addl {{[-0-9]+}}(%e{{[sb]}}p), %ebx # 4-byte Folded Reload
; X32-NEXT:    adcl $0, %ecx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %eax
; X32-NEXT:    movl 12(%eax), %ebp
; X32-NEXT:    movl %edi, %eax
; X32-NEXT:    mull %ebp
; X32-NEXT:    movl %ebp, (%esp) # 4-byte Spill
; X32-NEXT:    movl %edx, %edi
; X32-NEXT:    addl %ebx, %eax
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    adcl %ecx, %edi
; X32-NEXT:    setb %cl
; X32-NEXT:    movl %esi, %eax
; X32-NEXT:    mull %ebp
; X32-NEXT:    movl %eax, %ebx
; X32-NEXT:    addl %edi, %ebx
; X32-NEXT:    movzbl %cl, %eax
; X32-NEXT:    adcl %eax, %edx
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; X32-NEXT:    addl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Folded Spill
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; X32-NEXT:    adcl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Folded Spill
; X32-NEXT:    adcl $0, %ebx
; X32-NEXT:    adcl $0, %edx
; X32-NEXT:    addl {{[-0-9]+}}(%e{{[sb]}}p), %ebx # 4-byte Folded Reload
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %edx # 4-byte Folded Reload
; X32-NEXT:    movl %edx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    setb {{[-0-9]+}}(%e{{[sb]}}p) # 1-byte Folded Spill
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %edi # 4-byte Reload
; X32-NEXT:    movl %edi, %eax
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Reload
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, %esi
; X32-NEXT:    movl %eax, %ebp
; X32-NEXT:    addl {{[-0-9]+}}(%e{{[sb]}}p), %ebp # 4-byte Folded Reload
; X32-NEXT:    adcl $0, %esi
; X32-NEXT:    movl %edi, %eax
; X32-NEXT:    movl (%esp), %ecx # 4-byte Reload
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, %edi
; X32-NEXT:    addl %ebp, %eax
; X32-NEXT:    movl %eax, %ebp
; X32-NEXT:    adcl %esi, %edi
; X32-NEXT:    setb {{[-0-9]+}}(%e{{[sb]}}p) # 1-byte Folded Spill
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; X32-NEXT:    mull %ecx
; X32-NEXT:    addl %edi, %eax
; X32-NEXT:    movl %eax, %esi
; X32-NEXT:    movzbl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 1-byte Folded Reload
; X32-NEXT:    adcl %eax, %edx
; X32-NEXT:    addl %ebx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Folded Spill
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %ebp # 4-byte Folded Reload
; X32-NEXT:    movl %ebp, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movzbl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 1-byte Folded Reload
; X32-NEXT:    adcl %eax, %esi
; X32-NEXT:    movl %esi, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    adcl $0, %edx
; X32-NEXT:    movl %edx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X32-NEXT:    movl 16(%ecx), %esi
; X32-NEXT:    movl (%esp), %edi # 4-byte Reload
; X32-NEXT:    imull %esi, %edi
; X32-NEXT:    movl %esi, %eax
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ebx # 4-byte Reload
; X32-NEXT:    mull %ebx
; X32-NEXT:    movl %eax, (%esp) # 4-byte Spill
; X32-NEXT:    addl %edi, %edx
; X32-NEXT:    movl 20(%ecx), %eax
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %ebx, %edi
; X32-NEXT:    imull %eax, %edi
; X32-NEXT:    addl %edx, %edi
; X32-NEXT:    movl 24(%ecx), %eax
; X32-NEXT:    movl %eax, %ecx
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ebp # 4-byte Reload
; X32-NEXT:    imull %ebp, %ecx
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ebx # 4-byte Reload
; X32-NEXT:    mull %ebx
; X32-NEXT:    addl %ecx, %edx
; X32-NEXT:    movl {{[0-9]+}}(%esp), %ecx
; X32-NEXT:    movl 28(%ecx), %ecx
; X32-NEXT:    imull %ebx, %ecx
; X32-NEXT:    addl %edx, %ecx
; X32-NEXT:    addl (%esp), %eax # 4-byte Folded Reload
; X32-NEXT:    movl %eax, (%esp) # 4-byte Spill
; X32-NEXT:    adcl %edi, %ecx
; X32-NEXT:    movl %ebx, %eax
; X32-NEXT:    mull %esi
; X32-NEXT:    movl %edx, %edi
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %ebp, %eax
; X32-NEXT:    mull %esi
; X32-NEXT:    movl %edx, %esi
; X32-NEXT:    movl %eax, %ebx
; X32-NEXT:    addl %edi, %ebx
; X32-NEXT:    adcl $0, %esi
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ebp # 4-byte Reload
; X32-NEXT:    mull %ebp
; X32-NEXT:    movl %edx, %edi
; X32-NEXT:    addl %ebx, %eax
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    adcl %esi, %edi
; X32-NEXT:    setb %bl
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; X32-NEXT:    mull %ebp
; X32-NEXT:    addl %edi, %eax
; X32-NEXT:    movzbl %bl, %esi
; X32-NEXT:    adcl %esi, %edx
; X32-NEXT:    addl (%esp), %eax # 4-byte Folded Reload
; X32-NEXT:    movl %eax, (%esp) # 4-byte Spill
; X32-NEXT:    adcl %ecx, %edx
; X32-NEXT:    movl %edx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl {{[0-9]+}}(%esp), %edi
; X32-NEXT:    movl 24(%edi), %esi
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Reload
; X32-NEXT:    movl %ecx, %eax
; X32-NEXT:    mull %esi
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    imull {{[-0-9]+}}(%e{{[sb]}}p), %esi # 4-byte Folded Reload
; X32-NEXT:    addl %edx, %esi
; X32-NEXT:    movl %edi, %edx
; X32-NEXT:    movl 28(%edi), %eax
; X32-NEXT:    imull %ecx, %eax
; X32-NEXT:    addl %eax, %esi
; X32-NEXT:    movl 16(%edi), %edi
; X32-NEXT:    movl 20(%edx), %ebp
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; X32-NEXT:    movl %eax, %ebx
; X32-NEXT:    imull %ebp, %ebx
; X32-NEXT:    movl %ebp, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    mull %edi
; X32-NEXT:    addl %ebx, %edx
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Reload
; X32-NEXT:    imull %edi, %ecx
; X32-NEXT:    addl %edx, %ecx
; X32-NEXT:    addl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Folded Reload
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    adcl %esi, %ecx
; X32-NEXT:    movl %ecx, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %edi, %eax
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Reload
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, %ebx
; X32-NEXT:    movl %eax, {{[-0-9]+}}(%e{{[sb]}}p) # 4-byte Spill
; X32-NEXT:    movl %ebp, %eax
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, %esi
; X32-NEXT:    movl %eax, %ebp
; X32-NEXT:    addl %ebx, %ebp
; X32-NEXT:    adcl $0, %esi
; X32-NEXT:    movl %edi, %eax
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Reload
; X32-NEXT:    mull %ecx
; X32-NEXT:    movl %edx, %ebx
; X32-NEXT:    movl %eax, %edi
; X32-NEXT:    addl %ebp, %edi
; X32-NEXT:    adcl %esi, %ebx
; X32-NEXT:    setb {{[-0-9]+}}(%e{{[sb]}}p) # 1-byte Folded Spill
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Reload
; X32-NEXT:    mull %ecx
; X32-NEXT:    addl %ebx, %eax
; X32-NEXT:    movzbl {{[-0-9]+}}(%e{{[sb]}}p), %esi # 1-byte Folded Reload
; X32-NEXT:    adcl %esi, %edx
; X32-NEXT:    addl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Folded Reload
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %edx # 4-byte Folded Reload
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Reload
; X32-NEXT:    addl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Folded Reload
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %edi # 4-byte Folded Reload
; X32-NEXT:    adcl (%esp), %eax # 4-byte Folded Reload
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %edx # 4-byte Folded Reload
; X32-NEXT:    addl {{[-0-9]+}}(%e{{[sb]}}p), %ecx # 4-byte Folded Reload
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %edi # 4-byte Folded Reload
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %eax # 4-byte Folded Reload
; X32-NEXT:    adcl {{[-0-9]+}}(%e{{[sb]}}p), %edx # 4-byte Folded Reload
; X32-NEXT:    movl {{[0-9]+}}(%esp), %esi
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ebx # 4-byte Reload
; X32-NEXT:    movl %ebx, (%esi)
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ebx # 4-byte Reload
; X32-NEXT:    movl %ebx, 4(%esi)
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ebx # 4-byte Reload
; X32-NEXT:    movl %ebx, 8(%esi)
; X32-NEXT:    movl {{[-0-9]+}}(%e{{[sb]}}p), %ebx # 4-byte Reload
; X32-NEXT:    movl %ebx, 12(%esi)
; X32-NEXT:    movl %ecx, 16(%esi)
; X32-NEXT:    movl %edi, 20(%esi)
; X32-NEXT:    movl %eax, 24(%esi)
; X32-NEXT:    movl %edx, 28(%esi)
; X32-NEXT:    addl $72, %esp
; X32-NEXT:    .cfi_def_cfa_offset 20
; X32-NEXT:    popl %esi
; X32-NEXT:    .cfi_def_cfa_offset 16
; X32-NEXT:    popl %edi
; X32-NEXT:    .cfi_def_cfa_offset 12
; X32-NEXT:    popl %ebx
; X32-NEXT:    .cfi_def_cfa_offset 8
; X32-NEXT:    popl %ebp
; X32-NEXT:    .cfi_def_cfa_offset 4
; X32-NEXT:    retl
;
; X64-LABEL: test:
; X64:       # %bb.0: # %entry
; X64-NEXT:    pushq %r15
; X64-NEXT:    .cfi_def_cfa_offset 16
; X64-NEXT:    pushq %r14
; X64-NEXT:    .cfi_def_cfa_offset 24
; X64-NEXT:    pushq %rbx
; X64-NEXT:    .cfi_def_cfa_offset 32
; X64-NEXT:    .cfi_offset %rbx, -32
; X64-NEXT:    .cfi_offset %r14, -24
; X64-NEXT:    .cfi_offset %r15, -16
; X64-NEXT:    movq %rdx, %rcx
; X64-NEXT:    movq (%rdi), %rbx
; X64-NEXT:    movq 8(%rdi), %r11
; X64-NEXT:    movq 16(%rdi), %r10
; X64-NEXT:    movq 16(%rsi), %r8
; X64-NEXT:    movq (%rsi), %r9
; X64-NEXT:    movq 8(%rsi), %r14
; X64-NEXT:    movq 24(%rdi), %r15
; X64-NEXT:    imulq %r9, %r15
; X64-NEXT:    movq %r9, %rax
; X64-NEXT:    mulq %r10
; X64-NEXT:    movq %rax, %rdi
; X64-NEXT:    imulq %r14, %r10
; X64-NEXT:    addq %rdx, %r10
; X64-NEXT:    addq %r15, %r10
; X64-NEXT:    movq %r8, %r15
; X64-NEXT:    imulq %r11, %r15
; X64-NEXT:    movq %r8, %rax
; X64-NEXT:    mulq %rbx
; X64-NEXT:    movq %rax, %r8
; X64-NEXT:    addq %r15, %rdx
; X64-NEXT:    movq 24(%rsi), %r15
; X64-NEXT:    imulq %rbx, %r15
; X64-NEXT:    addq %rdx, %r15
; X64-NEXT:    addq %rdi, %r8
; X64-NEXT:    adcq %r10, %r15
; X64-NEXT:    movq %rbx, %rax
; X64-NEXT:    mulq %r9
; X64-NEXT:    movq %rdx, %rsi
; X64-NEXT:    movq %rax, %r10
; X64-NEXT:    movq %r11, %rax
; X64-NEXT:    mulq %r9
; X64-NEXT:    movq %rdx, %rdi
; X64-NEXT:    movq %rax, %r9
; X64-NEXT:    addq %rsi, %r9
; X64-NEXT:    adcq $0, %rdi
; X64-NEXT:    movq %rbx, %rax
; X64-NEXT:    mulq %r14
; X64-NEXT:    movq %rdx, %rsi
; X64-NEXT:    movq %rax, %rbx
; X64-NEXT:    addq %r9, %rbx
; X64-NEXT:    adcq %rdi, %rsi
; X64-NEXT:    setb %al
; X64-NEXT:    movzbl %al, %edi
; X64-NEXT:    movq %r11, %rax
; X64-NEXT:    mulq %r14
; X64-NEXT:    addq %rsi, %rax
; X64-NEXT:    adcq %rdi, %rdx
; X64-NEXT:    addq %r8, %rax
; X64-NEXT:    adcq %r15, %rdx
; X64-NEXT:    movq %r10, (%rcx)
; X64-NEXT:    movq %rbx, 8(%rcx)
; X64-NEXT:    movq %rax, 16(%rcx)
; X64-NEXT:    movq %rdx, 24(%rcx)
; X64-NEXT:    popq %rbx
; X64-NEXT:    .cfi_def_cfa_offset 24
; X64-NEXT:    popq %r14
; X64-NEXT:    .cfi_def_cfa_offset 16
; X64-NEXT:    popq %r15
; X64-NEXT:    .cfi_def_cfa_offset 8
; X64-NEXT:    retq
entry:
  %av = load i256, ptr %a
  %bv = load i256, ptr %b
  %r = mul i256 %av, %bv
  store i256 %r, ptr %out
  ret void
}

attributes #0 = { norecurse nounwind uwtable }