#!/bin/bash

set -e -o pipefail

temp=temp
trap "rm $temp" EXIT
mkfifo $temp

sanitize() {
    sed 's/\s*\(;.*\)\?$//'
}

encode() {
    sed "$(subst_op)" | sed "$(subst_port)"
}

link() {
    # local temp=
    tee $temp | sed -e "s/$label//" -f <(less -f $temp | subst_label) | bc
}

subst_label() {
    grep -aon '.\+:' | sed 's/\(.\+\):\(.\+\):/s|'"\x00\\2\x00|\\1|g/"
}

subst_op() {
    op1 add $((2#00))
    op1 cmp $((2#01))
    op1 mov $((2#10))
    op2 beq $((2#1100))
    op3 in  $((2#1110))
    op3 out $((2#1111))
}

subst_port() {
    port led   $((2#00000))
    port sseg  $((2#11000))
    port swt   $((2#00100))
    port btn_s $((2#01000))
    port btn_u $((2#01001))
    port btn_l $((2#01010))
    port btn_d $((2#01011))
    port btn_r $((2#01100))
}

label='\(.\+:\)\?\s*'
arg='\s*\(.\+\)\s*'

op1() { # [OP|   F   |   D   ]
    echo "s/$label$1 $arg,$arg/\1 $2 *2^14 + (\x00\2\x00 - 1) *2^7 + (\x00\3\x00 - 1)/i"
}

op2() { # [ OP |     |   D   ]
    echo "s/$label$1 $arg/\1 $2 *2^12 + (\x00\2\x00 - 1)/i"
}

op3() { # [ OP |  P  |   D   ]
    echo "s/$label$1 $arg,$arg/\1 $2 *2^12 + \x00\2\x00 *2^7 + (\x00\3\x00 - 1)/i"
}

port() {
    echo "s/\x00$1\x00/$2/"
}

sanitize | encode | link | perl -ne 'printf "%.16b\n", ($_+2**16)%2**16'
