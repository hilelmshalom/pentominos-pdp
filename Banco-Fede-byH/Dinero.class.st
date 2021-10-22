"
Comentario de dineros
"
Class {
	#name : #Dinero,
	#superclass : #Object,
	#instVars : [
		'pesos',
		'centavos'
	],
	#category : #'Banco-Fede-byH'
}

{ #category : #accessing }
Dinero >> centavos [
	^centavos 
]

{ #category : #accessing }
Dinero >> centavos: unEntero [
	centavos := unEntero
]

{ #category : #accessing }
Dinero >> pesos [
"getter de pesos -variable de instancia-"
	^pesos
]

{ #category : #accessing }
Dinero >> pesos: unEntero [
	pesos := unEntero
]

{ #category : #accessing }
Dinero >> pesos:primero centavos:segundo [
|tCent pNec cNec|
self sonNumeros ifFalse:[^self].
tCent := primero*100 + segundo.
pNec:=tCent abs //100.
cNec := tCent abs \\100.
tCent <0 ifTrue:[pNec:= pNec negated ].
pesos:=pNec.
centavos:=cNec.
^self
]

{ #category : #printing }
Dinero >> printOn:myV [
"quiero que imprima formato $1234,56 o -$123,45"
self pesos<0 ifTrue:[myV  nextPut:$-]. "signo si es negativo"
myV nextPut:$$.
self pesos abs printOn: myV.
myV nextPut: $,. "coma decimal"
self centavos <=9 ifTrue:[myV nextPut:$0].
self centavos printOn: myV.
]

{ #category : #private }
Dinero >> sonNumeros [
(self pesos isInteger & self centavos isInteger)
	ifTrue: [ ^true ] 
 	ifFalse:[^false] 
]
