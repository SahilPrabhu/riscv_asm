.data
a: .word 0x12345678

.text
la x10,a
lw x11,0(x10)
addi x3,x0,3
back:
    andi x12,x11,0xFF
    add x14,x14,x12
    slli x14,x14,8
    srli x11,x11,8
    addi x3,x3,-1
bnez x3,back
andi x15,x11,0xFF
add x15,x14,x15 


# Disassembled Machine Code
 
#    0:        10000517        auipc x10 0x10000
#    4:        00050513        addi x10 x10 0
#    8:        00052583        lw x11 0 x10
#    c:        00300193        addi x3 x0 3

# 00000010 <back>:
#    10:        0ff5f613        andi x12 x11 255
#    14:        00c70733        add x14 x14 x12
#    18:        00871713        slli x14 x14 8
#    1c:        0085d593        srli x11 x11 8
#    20:        fff18193        addi x3 x3 -1
#    24:        fe0196e3        bne x3 x0 -20 <back>
#    28:        0ff5f793        andi x15 x11 255
#    2c:        00f707b3        add x15 x14 x15

