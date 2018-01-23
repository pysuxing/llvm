// RUN: llvm-mc -triple i386-unknown-unknown --show-encoding %s | FileCheck %s

// CHECK: prefetch -485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x0d,0x84,0x82,0x10,0xe3,0x0f,0xe3]        
prefetch -485498096(%edx,%eax,4) 

// CHECK: prefetch 485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x0d,0x84,0x82,0xf0,0x1c,0xf0,0x1c]        
prefetch 485498096(%edx,%eax,4) 

// CHECK: prefetch 485498096(%edx) 
// CHECK: encoding: [0x0f,0x0d,0x82,0xf0,0x1c,0xf0,0x1c]        
prefetch 485498096(%edx) 

// CHECK: prefetch 485498096 
// CHECK: encoding: [0x0f,0x0d,0x05,0xf0,0x1c,0xf0,0x1c]        
prefetch 485498096 

// CHECK: prefetch 64(%edx,%eax) 
// CHECK: encoding: [0x0f,0x0d,0x44,0x02,0x40]        
prefetch 64(%edx,%eax) 

// CHECK: prefetch (%edx) 
// CHECK: encoding: [0x0f,0x0d,0x02]        
prefetch (%edx) 

// CHECK: prefetchnta -485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x18,0x84,0x82,0x10,0xe3,0x0f,0xe3]        
prefetchnta -485498096(%edx,%eax,4) 

// CHECK: prefetchnta 485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x18,0x84,0x82,0xf0,0x1c,0xf0,0x1c]        
prefetchnta 485498096(%edx,%eax,4) 

// CHECK: prefetchnta 485498096(%edx) 
// CHECK: encoding: [0x0f,0x18,0x82,0xf0,0x1c,0xf0,0x1c]        
prefetchnta 485498096(%edx) 

// CHECK: prefetchnta 485498096 
// CHECK: encoding: [0x0f,0x18,0x05,0xf0,0x1c,0xf0,0x1c]        
prefetchnta 485498096 

// CHECK: prefetchnta 64(%edx,%eax) 
// CHECK: encoding: [0x0f,0x18,0x44,0x02,0x40]        
prefetchnta 64(%edx,%eax) 

// CHECK: prefetchnta (%edx) 
// CHECK: encoding: [0x0f,0x18,0x02]        
prefetchnta (%edx) 

// CHECK: prefetcht0 -485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x18,0x8c,0x82,0x10,0xe3,0x0f,0xe3]        
prefetcht0 -485498096(%edx,%eax,4) 

// CHECK: prefetcht0 485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x18,0x8c,0x82,0xf0,0x1c,0xf0,0x1c]        
prefetcht0 485498096(%edx,%eax,4) 

// CHECK: prefetcht0 485498096(%edx) 
// CHECK: encoding: [0x0f,0x18,0x8a,0xf0,0x1c,0xf0,0x1c]        
prefetcht0 485498096(%edx) 

// CHECK: prefetcht0 485498096 
// CHECK: encoding: [0x0f,0x18,0x0d,0xf0,0x1c,0xf0,0x1c]        
prefetcht0 485498096 

// CHECK: prefetcht0 64(%edx,%eax) 
// CHECK: encoding: [0x0f,0x18,0x4c,0x02,0x40]        
prefetcht0 64(%edx,%eax) 

// CHECK: prefetcht0 (%edx) 
// CHECK: encoding: [0x0f,0x18,0x0a]        
prefetcht0 (%edx) 

// CHECK: prefetcht1 -485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x18,0x94,0x82,0x10,0xe3,0x0f,0xe3]        
prefetcht1 -485498096(%edx,%eax,4) 

// CHECK: prefetcht1 485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x18,0x94,0x82,0xf0,0x1c,0xf0,0x1c]        
prefetcht1 485498096(%edx,%eax,4) 

// CHECK: prefetcht1 485498096(%edx) 
// CHECK: encoding: [0x0f,0x18,0x92,0xf0,0x1c,0xf0,0x1c]        
prefetcht1 485498096(%edx) 

// CHECK: prefetcht1 485498096 
// CHECK: encoding: [0x0f,0x18,0x15,0xf0,0x1c,0xf0,0x1c]        
prefetcht1 485498096 

// CHECK: prefetcht1 64(%edx,%eax) 
// CHECK: encoding: [0x0f,0x18,0x54,0x02,0x40]        
prefetcht1 64(%edx,%eax) 

// CHECK: prefetcht1 (%edx) 
// CHECK: encoding: [0x0f,0x18,0x12]        
prefetcht1 (%edx) 

// CHECK: prefetcht2 -485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x18,0x9c,0x82,0x10,0xe3,0x0f,0xe3]        
prefetcht2 -485498096(%edx,%eax,4) 

// CHECK: prefetcht2 485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x18,0x9c,0x82,0xf0,0x1c,0xf0,0x1c]        
prefetcht2 485498096(%edx,%eax,4) 

// CHECK: prefetcht2 485498096(%edx) 
// CHECK: encoding: [0x0f,0x18,0x9a,0xf0,0x1c,0xf0,0x1c]        
prefetcht2 485498096(%edx) 

// CHECK: prefetcht2 485498096 
// CHECK: encoding: [0x0f,0x18,0x1d,0xf0,0x1c,0xf0,0x1c]        
prefetcht2 485498096 

// CHECK: prefetcht2 64(%edx,%eax) 
// CHECK: encoding: [0x0f,0x18,0x5c,0x02,0x40]        
prefetcht2 64(%edx,%eax) 

// CHECK: prefetcht2 (%edx) 
// CHECK: encoding: [0x0f,0x18,0x1a]        
prefetcht2 (%edx) 

// CHECK: prefetchw -485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x0d,0x8c,0x82,0x10,0xe3,0x0f,0xe3]        
prefetchw -485498096(%edx,%eax,4) 

// CHECK: prefetchw 485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x0d,0x8c,0x82,0xf0,0x1c,0xf0,0x1c]        
prefetchw 485498096(%edx,%eax,4) 

// CHECK: prefetchw 485498096(%edx) 
// CHECK: encoding: [0x0f,0x0d,0x8a,0xf0,0x1c,0xf0,0x1c]        
prefetchw 485498096(%edx) 

// CHECK: prefetchw 485498096 
// CHECK: encoding: [0x0f,0x0d,0x0d,0xf0,0x1c,0xf0,0x1c]        
prefetchw 485498096 

// CHECK: prefetchw 64(%edx,%eax) 
// CHECK: encoding: [0x0f,0x0d,0x4c,0x02,0x40]        
prefetchw 64(%edx,%eax) 

// CHECK: prefetchw (%edx) 
// CHECK: encoding: [0x0f,0x0d,0x0a]        
prefetchw (%edx) 

// CHECK: prefetchwt1 -485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x0d,0x94,0x82,0x10,0xe3,0x0f,0xe3]
prefetchwt1 -485498096(%edx,%eax,4) 

// CHECK: prefetchwt1 485498096(%edx,%eax,4) 
// CHECK: encoding: [0x0f,0x0d,0x94,0x82,0xf0,0x1c,0xf0,0x1c]
prefetchwt1 485498096(%edx,%eax,4) 

// CHECK: prefetchwt1 485498096(%edx) 
// CHECK: encoding: [0x0f,0x0d,0x92,0xf0,0x1c,0xf0,0x1c]
prefetchwt1 485498096(%edx) 

// CHECK: prefetchwt1 485498096 
// CHECK: encoding: [0x0f,0x0d,0x15,0xf0,0x1c,0xf0,0x1c]
prefetchwt1 485498096 

// CHECK: prefetchwt1 64(%edx,%eax) 
// CHECK: encoding: [0x0f,0x0d,0x54,0x02,0x40
prefetchwt1 64(%edx,%eax) 

// CHECK: prefetchwt1 (%edx) 
// CHECK: encoding:  [0x0f,0x0d,0x12]
prefetchwt1 (%edx) 
