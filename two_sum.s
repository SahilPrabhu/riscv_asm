.data
a: .half 0x8000 , 0x0001

.text
la x10, a  // psuedo instruction, see disassembled code
lh x1, 0(x10)
lh x2, 2(x10)
add x3,x2,x1
lhu x4, 0(x10)
lhu x5, 2(x10)
add x6,x5,x4
sh x3,4(x10)
sh x6,6(x10)

# Disassembled machine code 

# 0:        10000517        auipc x10 0x10000
# 4:        00050513        addi x10 x10 0
# 8:        00051083        lh x1 0 x10
# c:        00251103        lh x2 2 x10
# 10:       001101b3        add x3 x2 x1
# 14:       00055203        lhu x4 0 x10
# 18:       00255283        lhu x5 2 x10
# 1c:       00428333        add x6 x5 x4
# 20:       00351223        sh x3 4 x10
# 24:       00651323        sh x6 6 x10
