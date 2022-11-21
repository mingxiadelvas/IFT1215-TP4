#Tiendrebeogo Ismael Lionnel 20102656
#Ming-Xia Delvas 20104038 
    
     READIN # 0 lit x
     READIN # 1 lit y
     READIN # 2 lit z
     PUSH K
     PROUT
     HALT

# On calcule 
# K(x, y, z) = F(x+G(y*z),  x+z, H(G(y+x), x*y))
# x y z * G + x z + y x + G x y * H F en postfixe

K: PUSH 0(FP) # empile une copie de x
   PUSH 1(FP) # empile une copie de y
   PUSH 2(FP) # empile une copie de z
   MUL            # x y z *
   PUSH G      # appel de G
   CALL 1        #G a un argument
   ADD    # x y z * G +
   PUSH 0(FP) # empile une copie de x
   PUSH 2(FP) # empile une copie de z
   ADD             # x y z * G + x z +
   PUSH 1(FP) 
   PUSH 0(FP) 
   ADD # x y z * G + x z + y x +
   PUSH G
   CALL 1
   PUSH 0(FP) 
   PUSH 1(FP) 
   MUL # x y z * G + x z + y x + G x y *
   PUSH H # appel de H
   CALL 2  # H a deux arguments
   PUSH F
   CALL 3
   # le code pour le return de la fonction K est 
   POP 0(FP) # met la valeur de K dans 0(FP)
   RETFORM 3 # K a trois parametres 

# On calcule
# F(x, y, z) = 2*x + 3*y + 4*z
# 2 x * 3 y * + 4 z * + en postfixe

F: PUSH 2 # 2
   PUSH 0(FP) # empile une copie de x
   MUL # 2 x *
   PUSH 3 # 3
   PUSH 1(FP) # empile une copie de y
   MUL # 2 x * 3 y
   ADD
   PUSH 4
   PUSH 2(FP)
   MUL
   ADD # 2 x * 3 y * + 4 z * +
   POP 0(FP)
   RETFORM 3 # F a 3 parametres 

# On calcule
# H(x, y) = x*y
# x y * en postfixe

H: PUSH 0(FP) # x
   PUSH 1(FP) # y
   MUL # x y *
   POP 0(FP) 
   RETFORM 2

# On calcule
# G(x) = 5*x
# 5 x * en postfixe

G: PUSH 5 # 5 
   PUSH 0(FP) # empile une copie de x
   MUL # 5 x *
   POP 0(FP) 
   RETFORM 1 
