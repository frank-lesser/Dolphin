﻿"Filed out from Dolphin Smalltalk 7"!

OS.TEXTRANGE subclass: #'OS.FINDTEXTEX'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {
		'_OffsetOf_chrgText' -> 16rC
	}!
OS.FINDTEXTEX guid: (Core.GUID fromString: '{be0e52c5-c59b-4277-ac2a-cb775eac3904}')!
OS.FINDTEXTEX comment: '<FINDTEXTEX> is an <ExternalStructure> class to wrap the struct ''Win.FINDTEXTEX'' from type information in the ''Windows API (ANSI)'' library.

This structure is used in conjunction with the RichEdit control''s EM_FINDTEXTEX message, but is defined in the base as it is also used by Scintilla.

IDL definition follows:

typedef 
struct tagFINDTEXTEX {
	CHARRANGE chrg;
	long lpstrText;
	CHARRANGE chrgText;
} FINDTEXTEX;
'!
!OS.FINDTEXTEX categoriesForClass!Win-Structs! !
!OS.FINDTEXTEX methodsFor!

chrgText
	"Answer the <CHARRANGE> value of the receiver's 'chrgText' field."

	^CHARRANGE fromAddress: bytes yourAddress + _OffsetOf_chrgText! !
!OS.FINDTEXTEX categoriesFor: #chrgText!**compiled accessors**!public! !

!OS.FINDTEXTEX class methodsFor!

defineFields
	"Define the fields of the FINDTEXTEX structure.
		FINDTEXTEX compileDefinition

		typedef 
		struct tagFINDTEXTEX {
			CHARRANGE chrg;
			LPSTR lpstrText;
			CHARRANGE chrgText;
		} FINDTEXTEX;"

	super defineFields.
	self defineField: #chrgText type: (StructureField type: CHARRANGE) beReadOnly!

getFieldNames
	^#(#chrg #lpstrText #chrgText)! !
!OS.FINDTEXTEX class categoriesFor: #defineFields!public!template definition! !
!OS.FINDTEXTEX class categoriesFor: #getFieldNames!**compiled accessors**!constants!private! !

