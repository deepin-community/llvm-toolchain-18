# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=icelake-server -instruction-tables < %s | FileCheck %s

vpermb            %zmm16, %zmm17, %zmm19
vpermb            (%rax), %zmm17, %zmm19
vpermb            %zmm16, %zmm17, %zmm19 {k1}
vpermb            (%rax), %zmm17, %zmm19 {k1}
vpermb            %zmm16, %zmm17, %zmm19 {k1}{z}
vpermb            (%rax), %zmm17, %zmm19 {k1}{z}

vpermi2b          %zmm16, %zmm17, %zmm19
vpermi2b          (%rax), %zmm17, %zmm19
vpermi2b          %zmm16, %zmm17, %zmm19 {k1}
vpermi2b          (%rax), %zmm17, %zmm19 {k1}
vpermi2b          %zmm16, %zmm17, %zmm19 {k1}{z}
vpermi2b          (%rax), %zmm17, %zmm19 {k1}{z}

vpermt2b          %zmm16, %zmm17, %zmm19
vpermt2b          (%rax), %zmm17, %zmm19
vpermt2b          %zmm16, %zmm17, %zmm19 {k1}
vpermt2b          (%rax), %zmm17, %zmm19 {k1}
vpermt2b          %zmm16, %zmm17, %zmm19 {k1}{z}
vpermt2b          (%rax), %zmm17, %zmm19 {k1}{z}

vpmultishiftqb    %zmm16, %zmm17, %zmm19
vpmultishiftqb    (%rax), %zmm17, %zmm19
vpmultishiftqb    (%rax){1to8}, %zmm17, %zmm19
vpmultishiftqb    %zmm16, %zmm17, %zmm19 {k1}
vpmultishiftqb    (%rax), %zmm17, %zmm19 {k1}
vpmultishiftqb    (%rax){1to8}, %zmm17, %zmm19 {k1}
vpmultishiftqb    %zmm16, %zmm17, %zmm19 {k1}{z}
vpmultishiftqb    (%rax), %zmm17, %zmm19 {k1}{z}
vpmultishiftqb    (%rax){1to8}, %zmm17, %zmm19 {k1}{z}

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      3     1.00                        vpermb	%zmm16, %zmm17, %zmm19
# CHECK-NEXT:  2      10    1.00    *                   vpermb	(%rax), %zmm17, %zmm19
# CHECK-NEXT:  1      3     1.00                        vpermb	%zmm16, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  2      10    1.00    *                   vpermb	(%rax), %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  1      3     1.00                        vpermb	%zmm16, %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  2      10    1.00    *                   vpermb	(%rax), %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  1      3     1.00                        vpermi2b	%zmm16, %zmm17, %zmm19
# CHECK-NEXT:  2      10    1.00    *                   vpermi2b	(%rax), %zmm17, %zmm19
# CHECK-NEXT:  1      3     1.00                        vpermi2b	%zmm16, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  2      10    1.00    *                   vpermi2b	(%rax), %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  1      3     1.00                        vpermi2b	%zmm16, %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  2      10    1.00    *                   vpermi2b	(%rax), %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  1      3     1.00                        vpermt2b	%zmm16, %zmm17, %zmm19
# CHECK-NEXT:  2      10    1.00    *                   vpermt2b	(%rax), %zmm17, %zmm19
# CHECK-NEXT:  1      3     1.00                        vpermt2b	%zmm16, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  2      10    1.00    *                   vpermt2b	(%rax), %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  1      3     1.00                        vpermt2b	%zmm16, %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  2      10    1.00    *                   vpermt2b	(%rax), %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  1      1     1.00                        vpmultishiftqb	%zmm16, %zmm17, %zmm19
# CHECK-NEXT:  2      8     1.00    *                   vpmultishiftqb	(%rax), %zmm17, %zmm19
# CHECK-NEXT:  2      8     1.00    *                   vpmultishiftqb	(%rax){1to8}, %zmm17, %zmm19
# CHECK-NEXT:  1      1     1.00                        vpmultishiftqb	%zmm16, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  2      8     1.00    *                   vpmultishiftqb	(%rax), %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  2      8     1.00    *                   vpmultishiftqb	(%rax){1to8}, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  1      1     1.00                        vpmultishiftqb	%zmm16, %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  2      8     1.00    *                   vpmultishiftqb	(%rax), %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  2      8     1.00    *                   vpmultishiftqb	(%rax){1to8}, %zmm17, %zmm19 {%k1} {z}

# CHECK:      Resources:
# CHECK-NEXT: [0]   - ICXDivider
# CHECK-NEXT: [1]   - ICXFPDivider
# CHECK-NEXT: [2]   - ICXPort0
# CHECK-NEXT: [3]   - ICXPort1
# CHECK-NEXT: [4]   - ICXPort2
# CHECK-NEXT: [5]   - ICXPort3
# CHECK-NEXT: [6]   - ICXPort4
# CHECK-NEXT: [7]   - ICXPort5
# CHECK-NEXT: [8]   - ICXPort6
# CHECK-NEXT: [9]   - ICXPort7
# CHECK-NEXT: [10]  - ICXPort8
# CHECK-NEXT: [11]  - ICXPort9

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]
# CHECK-NEXT:  -      -     9.00    -     7.50   7.50    -     18.00   -      -      -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   Instructions:
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermb	%zmm16, %zmm17, %zmm19
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermb	(%rax), %zmm17, %zmm19
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermb	%zmm16, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermb	(%rax), %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermb	%zmm16, %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermb	(%rax), %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermi2b	%zmm16, %zmm17, %zmm19
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermi2b	(%rax), %zmm17, %zmm19
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermi2b	%zmm16, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermi2b	(%rax), %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermi2b	%zmm16, %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermi2b	(%rax), %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermt2b	%zmm16, %zmm17, %zmm19
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermt2b	(%rax), %zmm17, %zmm19
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermt2b	%zmm16, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermt2b	(%rax), %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -      -      -      -      -      -     1.00    -      -      -      -     vpermt2b	%zmm16, %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  -      -      -      -     0.50   0.50    -     1.00    -      -      -      -     vpermt2b	(%rax), %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -      -      -     vpmultishiftqb	%zmm16, %zmm17, %zmm19
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -      -      -     vpmultishiftqb	(%rax), %zmm17, %zmm19
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -      -      -     vpmultishiftqb	(%rax){1to8}, %zmm17, %zmm19
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -      -      -     vpmultishiftqb	%zmm16, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -      -      -     vpmultishiftqb	(%rax), %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -      -      -     vpmultishiftqb	(%rax){1to8}, %zmm17, %zmm19 {%k1}
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -      -      -      -     vpmultishiftqb	%zmm16, %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -      -      -     vpmultishiftqb	(%rax), %zmm17, %zmm19 {%k1} {z}
# CHECK-NEXT:  -      -     1.00    -     0.50   0.50    -      -      -      -      -      -     vpmultishiftqb	(%rax){1to8}, %zmm17, %zmm19 {%k1} {z}