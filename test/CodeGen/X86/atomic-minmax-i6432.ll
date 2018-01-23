; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mattr=+cmov,cx16 -mtriple=i386-pc-linux -verify-machineinstrs < %s | FileCheck %s -check-prefix=LINUX
; RUN: llc -mattr=cx16 -mtriple=i386-macosx -relocation-model=pic -verify-machineinstrs < %s | FileCheck %s -check-prefix=PIC

@sc64 = external global i64

define i64 @atomic_max_i64() nounwind {
; LINUX-LABEL: atomic_max_i64:
; LINUX:       # %bb.0: # %entry
; LINUX-NEXT:    pushl %ebx
; LINUX-NEXT:    pushl %esi
; LINUX-NEXT:    movl sc64+4, %edx
; LINUX-NEXT:    movl sc64, %eax
; LINUX-NEXT:    movl $4, %esi
; LINUX-NEXT:    .p2align 4, 0x90
; LINUX-NEXT:  .LBB0_1: # %atomicrmw.start
; LINUX-NEXT:    # =>This Inner Loop Header: Depth=1
; LINUX-NEXT:    cmpl %eax, %esi
; LINUX-NEXT:    movl $0, %ecx
; LINUX-NEXT:    sbbl %edx, %ecx
; LINUX-NEXT:    movl $0, %ecx
; LINUX-NEXT:    cmovll %edx, %ecx
; LINUX-NEXT:    movl $5, %ebx
; LINUX-NEXT:    cmovll %eax, %ebx
; LINUX-NEXT:    lock cmpxchg8b sc64
; LINUX-NEXT:    jne .LBB0_1
; LINUX-NEXT:  # %bb.2: # %atomicrmw.end
; LINUX-NEXT:    popl %esi
; LINUX-NEXT:    popl %ebx
; LINUX-NEXT:    retl
;
; PIC-LABEL: atomic_max_i64:
; PIC:       ## %bb.0: ## %entry
; PIC-NEXT:    pushl %ebx
; PIC-NEXT:    pushl %edi
; PIC-NEXT:    pushl %esi
; PIC-NEXT:    calll L0$pb
; PIC-NEXT:  L0$pb:
; PIC-NEXT:    popl %eax
; PIC-NEXT:    movl L_sc64$non_lazy_ptr-L0$pb(%eax), %esi
; PIC-NEXT:    movl (%esi), %eax
; PIC-NEXT:    movl 4(%esi), %edx
; PIC-NEXT:    movl $4, %edi
; PIC-NEXT:    .p2align 4, 0x90
; PIC-NEXT:  LBB0_1: ## %atomicrmw.start
; PIC-NEXT:    ## =>This Inner Loop Header: Depth=1
; PIC-NEXT:    cmpl %eax, %edi
; PIC-NEXT:    movl $0, %ecx
; PIC-NEXT:    sbbl %edx, %ecx
; PIC-NEXT:    movl $0, %ecx
; PIC-NEXT:    cmovll %edx, %ecx
; PIC-NEXT:    movl $5, %ebx
; PIC-NEXT:    cmovll %eax, %ebx
; PIC-NEXT:    lock cmpxchg8b (%esi)
; PIC-NEXT:    jne LBB0_1
; PIC-NEXT:  ## %bb.2: ## %atomicrmw.end
; PIC-NEXT:    popl %esi
; PIC-NEXT:    popl %edi
; PIC-NEXT:    popl %ebx
; PIC-NEXT:    retl
; PIC-NEXT:    ## -- End function
entry:
  %max = atomicrmw max i64* @sc64, i64 5 acquire
  ret i64 %max
}

define i64 @atomic_min_i64() nounwind {
; LINUX-LABEL: atomic_min_i64:
; LINUX:       # %bb.0: # %entry
; LINUX-NEXT:    pushl %ebx
; LINUX-NEXT:    movl sc64+4, %edx
; LINUX-NEXT:    movl sc64, %eax
; LINUX-NEXT:    .p2align 4, 0x90
; LINUX-NEXT:  .LBB1_1: # %atomicrmw.start
; LINUX-NEXT:    # =>This Inner Loop Header: Depth=1
; LINUX-NEXT:    cmpl $7, %eax
; LINUX-NEXT:    movl %edx, %ecx
; LINUX-NEXT:    sbbl $0, %ecx
; LINUX-NEXT:    movl $0, %ecx
; LINUX-NEXT:    cmovll %edx, %ecx
; LINUX-NEXT:    movl $6, %ebx
; LINUX-NEXT:    cmovll %eax, %ebx
; LINUX-NEXT:    lock cmpxchg8b sc64
; LINUX-NEXT:    jne .LBB1_1
; LINUX-NEXT:  # %bb.2: # %atomicrmw.end
; LINUX-NEXT:    popl %ebx
; LINUX-NEXT:    retl
;
; PIC-LABEL: atomic_min_i64:
; PIC:       ## %bb.0: ## %entry
; PIC-NEXT:    pushl %ebx
; PIC-NEXT:    pushl %esi
; PIC-NEXT:    calll L1$pb
; PIC-NEXT:  L1$pb:
; PIC-NEXT:    popl %eax
; PIC-NEXT:    movl L_sc64$non_lazy_ptr-L1$pb(%eax), %esi
; PIC-NEXT:    movl (%esi), %eax
; PIC-NEXT:    movl 4(%esi), %edx
; PIC-NEXT:    .p2align 4, 0x90
; PIC-NEXT:  LBB1_1: ## %atomicrmw.start
; PIC-NEXT:    ## =>This Inner Loop Header: Depth=1
; PIC-NEXT:    cmpl $7, %eax
; PIC-NEXT:    movl %edx, %ecx
; PIC-NEXT:    sbbl $0, %ecx
; PIC-NEXT:    movl $0, %ecx
; PIC-NEXT:    cmovll %edx, %ecx
; PIC-NEXT:    movl $6, %ebx
; PIC-NEXT:    cmovll %eax, %ebx
; PIC-NEXT:    lock cmpxchg8b (%esi)
; PIC-NEXT:    jne LBB1_1
; PIC-NEXT:  ## %bb.2: ## %atomicrmw.end
; PIC-NEXT:    popl %esi
; PIC-NEXT:    popl %ebx
; PIC-NEXT:    retl
; PIC-NEXT:    ## -- End function
entry:
  %min = atomicrmw min i64* @sc64, i64 6 acquire
  ret i64 %min
}

define i64 @atomic_umax_i64() nounwind {
; LINUX-LABEL: atomic_umax_i64:
; LINUX:       # %bb.0: # %entry
; LINUX-NEXT:    pushl %ebx
; LINUX-NEXT:    pushl %esi
; LINUX-NEXT:    movl sc64+4, %edx
; LINUX-NEXT:    movl sc64, %eax
; LINUX-NEXT:    movl $7, %esi
; LINUX-NEXT:    .p2align 4, 0x90
; LINUX-NEXT:  .LBB2_1: # %atomicrmw.start
; LINUX-NEXT:    # =>This Inner Loop Header: Depth=1
; LINUX-NEXT:    cmpl %eax, %esi
; LINUX-NEXT:    movl $0, %ecx
; LINUX-NEXT:    sbbl %edx, %ecx
; LINUX-NEXT:    movl $0, %ecx
; LINUX-NEXT:    cmovbl %edx, %ecx
; LINUX-NEXT:    movl $7, %ebx
; LINUX-NEXT:    cmovbl %eax, %ebx
; LINUX-NEXT:    lock cmpxchg8b sc64
; LINUX-NEXT:    jne .LBB2_1
; LINUX-NEXT:  # %bb.2: # %atomicrmw.end
; LINUX-NEXT:    popl %esi
; LINUX-NEXT:    popl %ebx
; LINUX-NEXT:    retl
;
; PIC-LABEL: atomic_umax_i64:
; PIC:       ## %bb.0: ## %entry
; PIC-NEXT:    pushl %ebx
; PIC-NEXT:    pushl %edi
; PIC-NEXT:    pushl %esi
; PIC-NEXT:    calll L2$pb
; PIC-NEXT:  L2$pb:
; PIC-NEXT:    popl %eax
; PIC-NEXT:    movl L_sc64$non_lazy_ptr-L2$pb(%eax), %esi
; PIC-NEXT:    movl (%esi), %eax
; PIC-NEXT:    movl 4(%esi), %edx
; PIC-NEXT:    movl $7, %edi
; PIC-NEXT:    .p2align 4, 0x90
; PIC-NEXT:  LBB2_1: ## %atomicrmw.start
; PIC-NEXT:    ## =>This Inner Loop Header: Depth=1
; PIC-NEXT:    cmpl %eax, %edi
; PIC-NEXT:    movl $0, %ecx
; PIC-NEXT:    sbbl %edx, %ecx
; PIC-NEXT:    movl $0, %ecx
; PIC-NEXT:    cmovbl %edx, %ecx
; PIC-NEXT:    movl $7, %ebx
; PIC-NEXT:    cmovbl %eax, %ebx
; PIC-NEXT:    lock cmpxchg8b (%esi)
; PIC-NEXT:    jne LBB2_1
; PIC-NEXT:  ## %bb.2: ## %atomicrmw.end
; PIC-NEXT:    popl %esi
; PIC-NEXT:    popl %edi
; PIC-NEXT:    popl %ebx
; PIC-NEXT:    retl
; PIC-NEXT:    ## -- End function
entry:
  %umax = atomicrmw umax i64* @sc64, i64 7 acquire
  ret i64 %umax
}

define i64 @atomic_umin_i64() nounwind {
; LINUX-LABEL: atomic_umin_i64:
; LINUX:       # %bb.0: # %entry
; LINUX-NEXT:    pushl %ebx
; LINUX-NEXT:    movl sc64+4, %edx
; LINUX-NEXT:    movl sc64, %eax
; LINUX-NEXT:    .p2align 4, 0x90
; LINUX-NEXT:  .LBB3_1: # %atomicrmw.start
; LINUX-NEXT:    # =>This Inner Loop Header: Depth=1
; LINUX-NEXT:    cmpl $9, %eax
; LINUX-NEXT:    movl %edx, %ecx
; LINUX-NEXT:    sbbl $0, %ecx
; LINUX-NEXT:    movl $0, %ecx
; LINUX-NEXT:    cmovbl %edx, %ecx
; LINUX-NEXT:    movl $8, %ebx
; LINUX-NEXT:    cmovbl %eax, %ebx
; LINUX-NEXT:    lock cmpxchg8b sc64
; LINUX-NEXT:    jne .LBB3_1
; LINUX-NEXT:  # %bb.2: # %atomicrmw.end
; LINUX-NEXT:    popl %ebx
; LINUX-NEXT:    retl
;
; PIC-LABEL: atomic_umin_i64:
; PIC:       ## %bb.0: ## %entry
; PIC-NEXT:    pushl %ebx
; PIC-NEXT:    pushl %esi
; PIC-NEXT:    calll L3$pb
; PIC-NEXT:  L3$pb:
; PIC-NEXT:    popl %eax
; PIC-NEXT:    movl L_sc64$non_lazy_ptr-L3$pb(%eax), %esi
; PIC-NEXT:    movl (%esi), %eax
; PIC-NEXT:    movl 4(%esi), %edx
; PIC-NEXT:    .p2align 4, 0x90
; PIC-NEXT:  LBB3_1: ## %atomicrmw.start
; PIC-NEXT:    ## =>This Inner Loop Header: Depth=1
; PIC-NEXT:    cmpl $9, %eax
; PIC-NEXT:    movl %edx, %ecx
; PIC-NEXT:    sbbl $0, %ecx
; PIC-NEXT:    movl $0, %ecx
; PIC-NEXT:    cmovbl %edx, %ecx
; PIC-NEXT:    movl $8, %ebx
; PIC-NEXT:    cmovbl %eax, %ebx
; PIC-NEXT:    lock cmpxchg8b (%esi)
; PIC-NEXT:    jne LBB3_1
; PIC-NEXT:  ## %bb.2: ## %atomicrmw.end
; PIC-NEXT:    popl %esi
; PIC-NEXT:    popl %ebx
; PIC-NEXT:    retl
; PIC-NEXT:    ## -- End function
entry:
  %umin = atomicrmw umin i64* @sc64, i64 8 acquire
  ret i64 %umin
}

@id = internal global i64 0, align 8

define void @tf_bug(i8* %ptr) nounwind {
; LINUX-LABEL: tf_bug:
; LINUX:       # %bb.0: # %entry
; LINUX-NEXT:    pushl %ebx
; LINUX-NEXT:    pushl %esi
; LINUX-NEXT:    movl {{[0-9]+}}(%esp), %esi
; LINUX-NEXT:    movl id+4, %edx
; LINUX-NEXT:    movl id, %eax
; LINUX-NEXT:    .p2align 4, 0x90
; LINUX-NEXT:  .LBB4_1: # %atomicrmw.start
; LINUX-NEXT:    # =>This Inner Loop Header: Depth=1
; LINUX-NEXT:    movl %eax, %ebx
; LINUX-NEXT:    addl $1, %ebx
; LINUX-NEXT:    movl %edx, %ecx
; LINUX-NEXT:    adcl $0, %ecx
; LINUX-NEXT:    lock cmpxchg8b id
; LINUX-NEXT:    jne .LBB4_1
; LINUX-NEXT:  # %bb.2: # %atomicrmw.end
; LINUX-NEXT:    addl $1, %eax
; LINUX-NEXT:    adcl $0, %edx
; LINUX-NEXT:    movl %eax, (%esi)
; LINUX-NEXT:    movl %edx, 4(%esi)
; LINUX-NEXT:    popl %esi
; LINUX-NEXT:    popl %ebx
; LINUX-NEXT:    retl
;
; PIC-LABEL: tf_bug:
; PIC:       ## %bb.0: ## %entry
; PIC-NEXT:    pushl %ebx
; PIC-NEXT:    pushl %edi
; PIC-NEXT:    pushl %esi
; PIC-NEXT:    calll L4$pb
; PIC-NEXT:  L4$pb:
; PIC-NEXT:    popl %edi
; PIC-NEXT:    movl {{[0-9]+}}(%esp), %esi
; PIC-NEXT:    movl (_id-L4$pb)+4(%edi), %edx
; PIC-NEXT:    movl _id-L4$pb(%edi), %eax
; PIC-NEXT:    .p2align 4, 0x90
; PIC-NEXT:  LBB4_1: ## %atomicrmw.start
; PIC-NEXT:    ## =>This Inner Loop Header: Depth=1
; PIC-NEXT:    movl %eax, %ebx
; PIC-NEXT:    addl $1, %ebx
; PIC-NEXT:    movl %edx, %ecx
; PIC-NEXT:    adcl $0, %ecx
; PIC-NEXT:    lock cmpxchg8b _id-L4$pb(%edi)
; PIC-NEXT:    jne LBB4_1
; PIC-NEXT:  ## %bb.2: ## %atomicrmw.end
; PIC-NEXT:    addl $1, %eax
; PIC-NEXT:    adcl $0, %edx
; PIC-NEXT:    movl %eax, (%esi)
; PIC-NEXT:    movl %edx, 4(%esi)
; PIC-NEXT:    popl %esi
; PIC-NEXT:    popl %edi
; PIC-NEXT:    popl %ebx
; PIC-NEXT:    retl
; PIC-NEXT:    ## -- End function
; PIC-NEXT:  .zerofill __DATA,__bss,_id,8,3 ## @id
entry:
  %tmp1 = atomicrmw add i64* @id, i64 1 seq_cst
  %tmp2 = add i64 %tmp1, 1
  %tmp3 = bitcast i8* %ptr to i64*
  store i64 %tmp2, i64* %tmp3, align 4
  ret void
}
