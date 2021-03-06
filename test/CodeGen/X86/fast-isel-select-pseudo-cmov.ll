; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-apple-darwin10                                              | FileCheck %s --check-prefix=CHECK --check-prefix=SSE
; RUN: llc < %s -mtriple=x86_64-apple-darwin10 -fast-isel -fast-isel-abort=1                  | FileCheck %s --check-prefix=CHECK --check-prefix=SSE
; RUN: llc < %s -mtriple=x86_64-apple-darwin10                             -mcpu=corei7-avx | FileCheck %s --check-prefix=CHECK --check-prefix=AVX
; RUN: llc < %s -mtriple=x86_64-apple-darwin10 -fast-isel -fast-isel-abort=1 -mcpu=corei7-avx | FileCheck %s --check-prefix=CHECK --check-prefix=AVX


define float @select_fcmp_one_f32(float %a, float %b, float %c, float %d) {
; SSE-LABEL: select_fcmp_one_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    ucomiss %xmm1, %xmm0
; SSE-NEXT:    jne LBB0_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm3, %xmm2
; SSE-NEXT:  LBB0_2:
; SSE-NEXT:    movaps %xmm2, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: select_fcmp_one_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    vcmpneq_oqss %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vblendvps %xmm0, %xmm2, %xmm3, %xmm0
; AVX-NEXT:    retq
  %1 = fcmp one float %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define double @select_fcmp_one_f64(double %a, double %b, double %c, double %d) {
; SSE-LABEL: select_fcmp_one_f64:
; SSE:       ## %bb.0:
; SSE-NEXT:    ucomisd %xmm1, %xmm0
; SSE-NEXT:    jne LBB1_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm3, %xmm2
; SSE-NEXT:  LBB1_2:
; SSE-NEXT:    movaps %xmm2, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: select_fcmp_one_f64:
; AVX:       ## %bb.0:
; AVX-NEXT:    vcmpneq_oqsd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vblendvpd %xmm0, %xmm2, %xmm3, %xmm0
; AVX-NEXT:    retq
  %1 = fcmp one double %a, %b
  %2 = select i1 %1, double %c, double %d
  ret double %2
}

define float @select_icmp_eq_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_eq_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    je LBB2_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB2_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_eq_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    je LBB2_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB2_2:
; AVX-NEXT:    retq
  %1 = icmp eq i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_ne_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_ne_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    jne LBB3_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB3_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_ne_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    jne LBB3_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB3_2:
; AVX-NEXT:    retq
  %1 = icmp ne i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_ugt_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_ugt_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    ja LBB4_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB4_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_ugt_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    ja LBB4_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB4_2:
; AVX-NEXT:    retq
  %1 = icmp ugt i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_uge_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_uge_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    jae LBB5_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB5_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_uge_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    jae LBB5_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB5_2:
; AVX-NEXT:    retq
  %1 = icmp uge i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_ult_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_ult_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    jb LBB6_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB6_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_ult_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    jb LBB6_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB6_2:
; AVX-NEXT:    retq
  %1 = icmp ult i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_ule_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_ule_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    jbe LBB7_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB7_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_ule_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    jbe LBB7_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB7_2:
; AVX-NEXT:    retq
  %1 = icmp ule i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_sgt_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_sgt_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    jg LBB8_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB8_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_sgt_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    jg LBB8_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB8_2:
; AVX-NEXT:    retq
  %1 = icmp sgt i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_sge_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_sge_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    jge LBB9_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB9_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_sge_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    jge LBB9_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB9_2:
; AVX-NEXT:    retq
  %1 = icmp sge i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_slt_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_slt_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    jl LBB10_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB10_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_slt_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    jl LBB10_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB10_2:
; AVX-NEXT:    retq
  %1 = icmp slt i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define float @select_icmp_sle_f32(i64 %a, i64 %b, float %c, float %d) {
; SSE-LABEL: select_icmp_sle_f32:
; SSE:       ## %bb.0:
; SSE-NEXT:    cmpq %rsi, %rdi
; SSE-NEXT:    jle LBB11_2
; SSE-NEXT:  ## %bb.1:
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:  LBB11_2:
; SSE-NEXT:    retq
;
; AVX-LABEL: select_icmp_sle_f32:
; AVX:       ## %bb.0:
; AVX-NEXT:    cmpq %rsi, %rdi
; AVX-NEXT:    jle LBB11_2
; AVX-NEXT:  ## %bb.1:
; AVX-NEXT:    vmovaps %xmm1, %xmm0
; AVX-NEXT:  LBB11_2:
; AVX-NEXT:    retq
  %1 = icmp sle i64 %a, %b
  %2 = select i1 %1, float %c, float %d
  ret float %2
}

define i8 @select_icmp_sle_i8(i64 %a, i64 %b, i8 %c, i8 %d) {
; CHECK-LABEL: select_icmp_sle_i8:
; CHECK:       ## %bb.0:
; CHECK-NEXT:    cmpq %rsi, %rdi
; CHECK-NEXT:    jle LBB12_2
; CHECK-NEXT:  ## %bb.1:
; CHECK-NEXT:    movl %ecx, %edx
; CHECK-NEXT:  LBB12_2:
; CHECK-NEXT:    movl %edx, %eax
; CHECK-NEXT:    retq
  %1 = icmp sle i64 %a, %b
  %2 = select i1 %1, i8 %c, i8 %d
  ret i8 %2
}
