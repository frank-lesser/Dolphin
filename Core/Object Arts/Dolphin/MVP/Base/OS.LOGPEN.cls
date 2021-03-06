﻿"Filed out from Dolphin Smalltalk 7"!

OS.Win32Structure subclass: #'OS.LOGPEN'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {
		'_OffsetOf_lopnColor' -> 16rC.
		'_OffsetOf_lopnStyle' -> 16r0.
		'_OffsetOf_lopnWidth' -> 16r4
	}!
OS.LOGPEN guid: (Core.GUID fromString: '{87b4c5fb-026e-11d3-9fd7-00a0cc3e4a32}')!
OS.LOGPEN comment: '<LOGPEN> is an <ExternalStructure> class to wrap the struct ''Win32.LOGPEN'' from type information in the ''Win32 API'' library.

The type library contains the following helpstring for this struct
	"The LOGPEN structure defines the style, width, and color of a pen. The CreatePenIndirect function uses the LOGPEN structure."

IDL definition follows:

typedef [uuid(87B4C5FB-026E-11D3-9FD7-00A0CC3E4A32), helpstring("The LOGPEN structure defines the style, width, and color of a pen. The CreatePenIndirect function uses the LOGPEN structure.")]
struct tagLOGPEN {
	unsigned int lopnStyle;
	POINTL lopnWidth;
	unsigned long lopnColor;
} LOGPEN;
'!
!OS.LOGPEN categoriesForClass!Win32-Structs! !
!OS.LOGPEN methodsFor!

color
	"Answer the <Color> of the pen described by the receiver."

	^Graphics.Color fromCOLORREF: self lopnColor!

color: aColor 
	"Set the <Color> of the pen described by the receiver."

	self lopnColor: aColor asCOLORREF!

lopnColor
	"Answer the <Integer> value of the receiver's 'lopnColor' field."

	^bytes dwordAtOffset: _OffsetOf_lopnColor!

lopnColor: anInteger
	"Set the receiver's 'lopnColor' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_lopnColor put: anInteger!

lopnStyle
	"Answer the <Integer> value of the receiver's 'lopnStyle' field."

	^bytes dwordAtOffset: _OffsetOf_lopnStyle!

lopnStyle: anInteger
	"Set the receiver's 'lopnStyle' field to the value of the argument, anInteger"

	bytes dwordAtOffset: _OffsetOf_lopnStyle put: anInteger!

width
	"Answer <integer> width of the pen described by the receiver."

	^bytes sdwordAtOffset: 4!

width: anInteger 
	"Set the <integer> width of the pen described by the receiver."

	bytes sdwordAtOffset: 4 put: anInteger! !
!OS.LOGPEN categoriesFor: #color!accessing!public! !
!OS.LOGPEN categoriesFor: #color:!accessing!public! !
!OS.LOGPEN categoriesFor: #lopnColor!**compiled accessors**!public! !
!OS.LOGPEN categoriesFor: #lopnColor:!**compiled accessors**!public! !
!OS.LOGPEN categoriesFor: #lopnStyle!**compiled accessors**!public! !
!OS.LOGPEN categoriesFor: #lopnStyle:!**compiled accessors**!public! !
!OS.LOGPEN categoriesFor: #width!accessing!public! !
!OS.LOGPEN categoriesFor: #width:!accessing!public! !

!OS.LOGPEN class methodsFor!

defineFields
	"Define the fields of the LOGPEN structure.
		LOGPEN compileDefinition
	
		typedef [uuid(87B4C5FB-026E-11D3-9FD7-00A0CC3E4A32), helpstring('The LOGPEN structure defines the style, width, and color of a pen. The CreatePenIndirect function uses the LOGPEN structure.')]
		struct tagLOGPEN {
			unsigned int lopnStyle;
			POINTL lopnWidth;
			unsigned long lopnColor;
		} LOGPEN;
"

	self
		defineField: #lopnStyle type: DWORDField new;
		defineField: #lopnWidth type: (StructureField type: POINTL) beFiller;
		defineField: #lopnColor type: DWORDField new!

getFieldNames
	^#(#lopnStyle #lopnColor)! !
!OS.LOGPEN class categoriesFor: #defineFields!public!template definition! !
!OS.LOGPEN class categoriesFor: #getFieldNames!**compiled accessors**!constants!private! !

