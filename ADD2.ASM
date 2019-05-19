        .model small
        .stack 100h
        .386
        .data
a dq 2.0
b dq 3.0
c dq 4.5
d dq 2.0
e dq 5.0
temp3 dq 3.0
temp2 dq 2.0
h dq ?
g dq ?
f dq ?
        .code
start:  mov ax, @data
        mov ds, ax
        finit
        fld a
        fld b
        fadd st, st(1)
        fst st(1)
        fmul st, st
        fmul st, st(1)
        fld a
        fdiv st(1), st
        fld temp3
        fdiv st(2), st
        fxch st(2)
        fstp h

        
        fld d
        fst st(1)
        fmul st, st
        fmul st, st(1)
        fld c
        fld temp3
        fmul st, st(1)
        fsub st, st(2)
        fld a
        fmul st, st(1)
        fld e
        fmul st, st
        fdiv st(1), st
        fld temp2
        fdiv st(2), st
        fxch st(2)
        fstp g

        fld h
        fld g
        fadd st, st(1)
        fstp f

        mov ax, 4C00h
        int 21h
        end start
