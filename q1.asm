INCLUDE Irvine32.inc

.DATA
    ; Variables for Q1
    a WORD 100
    b WORD 50
    result1 WORD ?

    ; Variables for Q2
    m WORD 200
    n DWORD 10000
    o WORD 150
    result2 DWORD ?

    ; Messages
    msg1 BYTE "Answer for Q1: (a + b) - b", 0
    msg2 BYTE "Answer for Q2: (m + n) - o", 0

.CODE
MAIN PROC
    ; Initialize Registers
    MOV EAX, 0
    MOV EBX, 0
    MOV ECX, 0
    MOV EDX, 0

    ; ---------------------- QUESTION 1 ----------------------
    MOV AX, a       
    ADD AX, b       
    SUB AX, b       
    MOV result1, AX ; Store result1

    
    MOV EDX, OFFSET msg1
    CALL WriteString
    CALL Crlf

    
    MOVZX EAX, result1  
    CALL DumpRegs
    CALL Crlf

    ; ---------------------- QUESTION 2 ----------------------
    MOV AX, m       ; 
    MOV DX, 0       ;
    ADD AX, WORD PTR n      
    ADC DX, WORD PTR n+2    
    SUB AX, o       
    SBB DX, 0      
    MOV WORD PTR result2, AX
    MOV WORD PTR result2+2, DX

    ; Display Q2 Message
    MOV EDX, OFFSET msg2
    CALL WriteString
    CALL Crlf

    
    MOVZX EAX, WORD PTR result2    
    MOVZX EDX, WORD PTR result2+2  
    CALL DumpRegs
    CALL Crlf

    ; Exit Program
    CALL WaitMsg
    EXIT
MAIN ENDP
END MAIN
