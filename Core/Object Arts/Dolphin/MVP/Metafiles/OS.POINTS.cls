﻿"Filed out from Dolphin Smalltalk 7"!

External.POINT subclass: #'OS.POINTS'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {
		'_OffsetOf_x' -> 16r0.
		'_OffsetOf_y' -> 16r2
	}!
OS.POINTS guid: (Core.GUID fromString: '{3278b910-3376-47e3-be99-02afe78a6230}')!
OS.POINTS comment: '<POINTS> is an <ExternalStructure> class to wrap the struct ''Win32.POINTS'' from type information in the ''Win32 API (ANSI). Derived from Bruce McKinney´s Hardcore Visual Basic Type Library'' library.

The type library contains no documentation for this struct

Warning: This comment was automatically generated from the struct''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.

IDL definition follows:

typedef [uuid(3278B910-3376-47E3-BE99-02AFE78A6230)]
struct tagPOINTS {
	short x;
	short y;
} POINTS;
'!
!OS.POINTS categoriesForClass!Win32-Structs! !
!OS.POINTS methodsFor!

asDword
	"Answer the receiver in a form suitable for passing or returning 
	as a 32-bit value (i.e. a 32-bit integer)."

	^bytes dwordAtOffset: 0!

asUIntPtr
	"Answer the receiver in a form suitable for passing or returning 
	as a  machine-word sized (32 or 64-bit) value."

	"Implementation Note: The compiler will optimise out the condition because it is constant."

	^VMConstants.IsWin64 ifTrue: [self asPoint asUIntPtr] ifFalse: [bytes dwordAtOffset: 0]!

x
	"Answer the <Integer> value of the receiver's 'x' field."

	^bytes swordAtOffset: _OffsetOf_x!

x: anInteger
	"Set the receiver's 'x' field to the value of the argument, anInteger"

	bytes swordAtOffset: _OffsetOf_x put: anInteger!

y
	"Answer the <Integer> value of the receiver's 'y' field."

	^bytes swordAtOffset: _OffsetOf_y!

y: anInteger
	"Set the receiver's 'y' field to the value of the argument, anInteger"

	bytes swordAtOffset: _OffsetOf_y put: anInteger! !
!OS.POINTS categoriesFor: #asDword!converting!public! !
!OS.POINTS categoriesFor: #asUIntPtr!converting!public! !
!OS.POINTS categoriesFor: #x!**compiled accessors**!public! !
!OS.POINTS categoriesFor: #x:!**compiled accessors**!public! !
!OS.POINTS categoriesFor: #y!**compiled accessors**!public! !
!OS.POINTS categoriesFor: #y:!**compiled accessors**!public! !

!OS.POINTS class methodsFor!

defineFields
	"Define the fields of the POINTS structure.

	POINTS  compileDefinition

		typedef [uuid(3278B910-3376-47E3-BE99-02AFE78A6230)]
		struct tagPOINTS {
			short x;
			short y;
		} POINTS;
"

	self
		defineField: #x type: SWORDField new beOverride;
		defineField: #y type: SWORDField new beOverride!

x: x y: y
	^self basicNew bytes: ((ByteArray newFixed: 4)
				swordAtOffset: _OffsetOf_x put: x;
				swordAtOffset: _OffsetOf_y put: y;
				yourself)! !
!OS.POINTS class categoriesFor: #defineFields!**auto generated**!public!template definition! !
!OS.POINTS class categoriesFor: #x:y:!instance creation!public! !

