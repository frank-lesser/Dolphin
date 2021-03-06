﻿"Filed out from Dolphin Smalltalk 7"!

Core.Object subclass: #'Core.Magnitude'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Core.Magnitude guid: (Core.GUID fromString: '{87b4c49b-026e-11d3-9fd7-00a0cc3e4a32}')!
Core.Magnitude isNonInstantiable: true!
Core.Magnitude comment: 'Magnitude is an abstract class which provides the protocol objects which can be compared
along a linear dimension, e.g. Numbers, Dates, Times.

Subclasses of Magnitude must implement the following comparing protocol (at the very least):
#<, #=, #hash'!
!Core.Magnitude categoriesForClass!Magnitude-General! !
!Core.Magnitude methodsFor!

< operand
	"Answer whether the receiver is less than the <magnitude>, operand.

	Only this relational operator need be implemented by subclasses, since the others can 
	be implemented in terms of it (though performance may dictate otherwise)."

	^self subclassResponsibility!

<= operand
	"Answer whether the receiver is less than or equal to the <magnitude>, operand.
	Implemented in terms of #<, which must be implemented by subclasses."

	^(operand isNaN or: [operand < self]) not!

= aMagnitude
	"Answer whether the receiver is equivalent to the argument, aMagnitude."

	^self subclassResponsibility!

> operand
	"Answer whether the receiver is greater than the <magnitude>, operand.
	Implemented in terms of #<, which must be implemented by subclasses."

	^operand < self!

>= operand
	"Answer whether the receiver is greater than or equal to the <magnitude>, operand.
	Implemented in terms of #<, which must be implemented by subclasses."

	^(operand isNaN or: [self < operand]) not!

between: min and: max
	"Answer whether the receiver is inclusively between the <magnitude> arguments, 
	min and max."

	^self >= min and: [self <= max]!

clampBetween: minimum and: maximum
	"Clamp the receiver's value to the specified range."

	self < minimum ifTrue: [^minimum].
	self < maximum ifTrue: [^self].
	^maximum!

hash
	"Answer a SmallInteger hash value for the receiver which obeys the invariant that any two 
	objects which compare equal (using #=) must have the same hash value (but not 
	necessarily vice-versa). Like #=, and #<, must be implemented by subclasses."

	^self subclassResponsibility!

isNaN
	"Answer whether the receiver is Not a Number."

	^false!

max: operand
	"Answer the greater of the receiver and the <magnitude>, operand.
	 Implementation Note: #< is used since other relational operators are often implemented 
	in terms of it."

	^self < operand
		ifTrue:  [operand]
		ifFalse: [self]!

min: operand
	"Answer the lesser of the receiver and the <magnitude>, operand."

	^self < operand
		ifTrue:  [self]
		ifFalse: [operand]!

printString
	"Answer a <readableString> whose characters are a description of the receiver as a Smalltalk developer would want to see it."

	"Implementation Note: Avoid the cost of using a LimitedWriteStream for most cases."

	| stream |
	stream := String smalltalkWriteStream: 32.
	self printOn: stream.
	^stream contents! !
!Core.Magnitude categoriesFor: #<!comparing!public! !
!Core.Magnitude categoriesFor: #<=!comparing!public! !
!Core.Magnitude categoriesFor: #=!comparing!public! !
!Core.Magnitude categoriesFor: #>!comparing!public! !
!Core.Magnitude categoriesFor: #>=!comparing!public! !
!Core.Magnitude categoriesFor: #between:and:!comparing!public! !
!Core.Magnitude categoriesFor: #clampBetween:and:!comparing!public! !
!Core.Magnitude categoriesFor: #hash!comparing!public! !
!Core.Magnitude categoriesFor: #isNaN!public!testing! !
!Core.Magnitude categoriesFor: #max:!comparing!public! !
!Core.Magnitude categoriesFor: #min:!comparing!public! !
!Core.Magnitude categoriesFor: #printString!public! !

Core.Magnitude methodProtocol: #magnitude attributes: #(#ansi #readOnly) selectors: #(#< #<= #> #>= #between:and: #max: #min:)!

