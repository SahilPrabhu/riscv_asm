.data
a: .byte 0x12

.text 
la x10,a
lbu x11,0(x10)
andi x12,x11,0xE0
bnez x12,exit
addi x22,x0,5
back: 
    andi x12,x11,0x01 # anding the lsb to see if 1 is present
    beqz x12,next  # branch if 1 is not present
    addi x23,x23,1  # add 1 to counter
next: 
    srli x11,x11,1  # right shift original number to compare next lsb
    addi x22,x22,-1
    bnez x22,back
exit: 
    addi x15,x0,0x00
    
    
# Disassembled Machine Code

#    0:         10000517        auipc x10 0x10000
#    4:         00050513        addi x10 x10 0
#    8:         00054583        lbu x11 0 x10
#    c:         0e05f613        andi x12 x11 224
#    10:        02061063        bne x12 x0 32 <exit>
#    14:        00500b13        addi x22 x0 5

#00000018 <back>:
#    18:        0015f613        andi x12 x11 1
#    1c:        00060463        beq x12 x0 8 <next>
#    20:        001b8b93        addi x23 x23 1

#00000024 <next>:
#    24:        0015d593        srli x11 x11 1
#    28:        fffb0b13        addi x22 x22 -1
#    2c:        fe0b16e3        bne x22 x0 -20 <back>

#00000030 <exit>:
#    30:        00000793        addi x15 x0 0
 
