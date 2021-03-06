// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sve < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d -mattr=+sve - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN

mla z0.b, p7/m, z1.b, z31.b
// CHECK-INST: mla	z0.b, p7/m, z1.b, z31.b
// CHECK-ENCODING: [0x20,0x5c,0x1f,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 5c 1f 04 <unknown>

mla z0.h, p7/m, z1.h, z31.h
// CHECK-INST: mla	z0.h, p7/m, z1.h, z31.h
// CHECK-ENCODING: [0x20,0x5c,0x5f,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 5c 5f 04 <unknown>

mla z0.s, p7/m, z1.s, z31.s
// CHECK-INST: mla	z0.s, p7/m, z1.s, z31.s
// CHECK-ENCODING: [0x20,0x5c,0x9f,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 5c 9f 04 <unknown>

mla z0.d, p7/m, z1.d, z31.d
// CHECK-INST: mla	z0.d, p7/m, z1.d, z31.d
// CHECK-ENCODING: [0x20,0x5c,0xdf,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 5c df 04 <unknown>
