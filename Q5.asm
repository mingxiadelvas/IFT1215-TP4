#Tiendrebeogo Ismael Lionnel 20102656
#Ming-Xia Delvas 20104038

READIN # 0 lit un entier
READIN # 1 lit un entier
PUSH PGCD
CALL 2
PROUT
HALT

PGCD:PUSH 1(FP) # empile une copie de b
     PUSH 0
     EQ               # si b == 0
     PUSH SIOUI
     BRIF
     PUSH 0(FP)    #a
     PUSH 1(FP)    #b
     EQ # si b == a on imprime a
     PUSH SIOUI
     BRIF
     PUSH 0(FP) # si non on lit a
     PUSH 1(FP) # on lit b
     PUSH CALC
     CALL 2
     POP 0(FP) # retourne
     RETFROM 2

SIOUI: PUSH 0(FP) # a 
       PROUT #imprime a
       HALT

CALC:PUSH 1(FP)    # b
     PUSH 0(FP)    #a
     PUSH 0(FP)
     PUSH 1(FP)
     DIV           # a a b //
     PUSH 1(FP)
     MUL           # a a b // b *
     SUB       
     PUSH PGCD
     CALL 2
     POP 0(FP)    # retourne 
     RETFROM 2