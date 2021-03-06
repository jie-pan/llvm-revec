// RUN: not llvm-mc -triple=aarch64 -show-encoding -mattr=+sve  2>&1 < %s| FileCheck %s

fadda b0, p7, b0, z31.b
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid operand for instruction
// CHECK-NEXT: fadda b0, p7, b0, z31.b
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

fadda h0, p7, h1, z31.h
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: operand must match destination register
// CHECK-NEXT: fadda h0, p7, h1, z31.h
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

fadda h0, p8, h0, z31.h
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: restricted predicate has range [0, 7].
// CHECK-NEXT: fadda h0, p8, h0, z31.h
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}:

fadda v0.8h, p7, v0.8h, z31.h
// CHECK: [[@LINE-1]]:{{[0-9]+}}: error: invalid operand for instruction
// CHECK-NEXT: fadda v0.8h, p7, v0.8h, z31.h
// CHECK-NOT: [[@LINE-1]]:{{[0-9]+}}: