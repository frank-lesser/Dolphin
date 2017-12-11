"Filed out from Dolphin Smalltalk 7"!

IniFileAbstract subclass: #IniFile
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
IniFile guid: (GUID fromString: '{c373c097-bfde-42ca-968c-28008b7eff49}')!
IniFile comment: 'Implements <abstractDictionary> over a Windows .ini file'!
!IniFile categoriesForClass!Unclassified! !
!IniFile methodsFor!

at: aString ifAbsent: operation
	"Answer the named section of the initialization file.  If there is no such section,
	answer the result of evaluating the <niladicValuable>, operation."

	| key |
	key := aString shallowCopy.
	^(self hasSectionNamed: key) ifTrue: [self getValue: key] ifFalse: [operation value]!

at: keyString put: valueDictionary
	"Store the key-value pairs in the <abstractDictionary> argument as the named section of the initialization file."

	| kvps |
	kvps := String writeStream.
	valueDictionary keysAndValuesDo: 
			[:eachKey :eachValue |
			kvps
				display: eachKey;
				nextPut: $=;
				display: eachValue;
				nextPut: $\0].
	kvps nextPut: $\0.
	kvps := kvps contents.
	(KernelLibrary default
		writePrivateProfileSection: keyString shallowCopy
		lpString: kvps
		lpFileName: filename) == 0
		ifTrue: [Win32Error signal].
	^valueDictionary!

getValue: aString
	^IniFileSection open: filename section: aString!

hasSectionNamed: aString
	| lib |
	lib := KernelLibrary default.
	^(lib
		getPrivateProfileSection: aString
		lpReturnedString: (String newFixed: 3)
		nSize: 3
		lpFileName: filename) ~~ 0
		or: [
			"Special case of empty section is OK"
			lib getLastError == 0]!

includesKey: aString
	"Answer whether the receiver has a section with the specified name."

	"The API has a bug whereby it writes a null term to the string. This fails if the key is in read-only memory, so we always make a copy."

	^self hasSectionNamed: aString shallowCopy!

keysDo: operation
	"Evaluate the <monadicValuable>, operation, for each of the receiver's section names."

	| buf lib count start end |
	buf := String new: 512.
	lib := KernelLibrary default.
	
	[count := lib
				getPrivateProfileSectionNames: buf
				nSize: buf size
				lpFileName: filename.
	count = (buf size - 2)]
			whileTrue: [buf := String new: buf size * 2].
	start := 1.
	
	[end := buf
				nextIndexOf: $\0
				from: start
				to: count.
	end == 0] whileFalse: 
				[operation value: (buf copyFrom: start to: end - 1).
				start := end + 1]!

removeKey: aString ifAbsent: aNiladicValuable
	"Remove the section named by the <String> argument from the initialization file. If there is no such section,
	answer the result of evaluating the <niladicValuable>, operation. Otherwise, answer the named <IniFileSection>."

	| value key |
	key := aString shallowCopy.
	(self hasSectionNamed: key) ifFalse: [^aNiladicValuable value].
	value := self getValue: key.
	^(KernelLibrary default
		writePrivateProfileSection: key
		lpString: nil
		lpFileName: filename) ifTrue: [value] ifFalse: [Win32Error signal]! !
!IniFile categoriesFor: #at:ifAbsent:!accessing!public! !
!IniFile categoriesFor: #at:put:!adding!public! !
!IniFile categoriesFor: #getValue:!helpers!private! !
!IniFile categoriesFor: #hasSectionNamed:!accessing!private! !
!IniFile categoriesFor: #includesKey:!accessing!public! !
!IniFile categoriesFor: #keysDo:!enumerating!public! !
!IniFile categoriesFor: #removeKey:ifAbsent:!public!removing! !
