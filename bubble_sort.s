.data
arr: .word 0x00000005, 0x00000003, 0x00000004, 0x00000001, 0x00000002  

.text
    la x2, arr         
    addi x18, x0, 5      # defining number of array elements into reg
    addi x19, x0, 0      # i = 0
    addi x20, x0, 0      # j = 0
    
i_loop:
    addi x21, x0, 0      # flag to indicate if swap is to be done

j_loop:
    lw x22, 0(x2)          
    lw x23, 4(x2)          
    bge x22, x23, no_swap   # If current element >= next element, no swap

   
    sw x23, 0(x2)        # swap elements
    sw x22, 4(x2)       
    addi x21, x0, 1      # set flag to 1

no_swap:
    addi x2, x2, 4          # move to next pair
    addi x20, x20, 1        
    blt x20, x18, i_loop    # check if j < 5 

    addi x19, x19, 1     
    bne x21, x0, j_loop     # If flag is 1, loopback

exit:
   jal x0,0   # infinite loop to end program
   
   
# Disassembled Machine Code

#     0:        10000117        auipc x2 0x10000
#     4:        00010113        addi x2 x2 0
#     8:        00500913        addi x18 x0 5
#     c:        00000993        addi x19 x0 0
#    10:        00000a13        addi x20 x0 0

#00000014 <i_loop>:
#    14:        00000a93        addi x21 x0 0

#00000018 <j_loop>:
#    18:        00012b03        lw x22 0 x2
#    1c:        00412b83        lw x23 4 x2
#    20:        017b5863        bge x22 x23 16 <no_swap>
#    24:        01712023        sw x23 0 x2
#    28:        01612223        sw x22 4 x2
#    2c:        00100a93        addi x21 x0 1

#00000030 <no_swap>:
#    30:        00410113        addi x2 x2 4
#    34:        001a0a13        addi x20 x20 1
#    38:        fd2a4ee3        blt x20 x18 -36 <i_loop>
#    3c:        00198993        addi x19 x19 1
#    40:        fc0a9ce3        bne x21 x0 -40 <j_loop>

#00000044 <exit>:
#    44:        0000006f        jal x0 0 <exit>

   
