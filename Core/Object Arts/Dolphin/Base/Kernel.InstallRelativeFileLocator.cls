﻿"Filed out from Dolphin Smalltalk 7"!

Kernel.RelativeFileLocator subclass: #'Kernel.InstallRelativeFileLocator'
	instanceVariableNames: ''
	classVariableNames: 'Current'
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Kernel.InstallRelativeFileLocator guid: (Core.GUID fromString: '{2543c5ae-b739-4aae-9aee-fe5537083fb7}')!
Kernel.InstallRelativeFileLocator comment: 'An ImageRelativeFileLocator is used to indicate the location of an external file that may be referenced within the image. 
Instances of this class always locate files relative to the image directory, unless the file is outside the local directory hierarchy below the install directory, in which case an absolute path is used.
'!
!Kernel.InstallRelativeFileLocator categoriesForClass!System-Support! !
!Kernel.InstallRelativeFileLocator methodsFor!

basePath
	^SessionManager current installationDirectory!

stbSaveOn: anSTBOutFiler 
	"Save out a binary representation of the receiver to anSTBOutFiler."

	anSTBOutFiler writePreambleFor: self! !
!Kernel.InstallRelativeFileLocator categoriesFor: #basePath!accessing!public! !
!Kernel.InstallRelativeFileLocator categoriesFor: #stbSaveOn:!binary filing!public! !

!Kernel.InstallRelativeFileLocator class methodsFor!

current
	"Answer the singleton instance of the receiver"

	Current isNil ifTrue: [ Current := self new ].
	^Current!

onPreStripImage
	"Private -  Assist in the image stripping process by clearning down any
	lazily initialized variables held by the receiver."

	self uninitialize!

stbReadFrom: anSTBInFiler format: anSTBClassConversion 
	"Read an instance of the receiver from the binary filer, aSTBInFiler."

	| singleton |
	singleton := self current.
	anSTBInFiler register: singleton.
	^singleton!

uninitialize
	"Private - Uninitialize the receiver as it is about to be removed from the system."

	Current := nil! !
!Kernel.InstallRelativeFileLocator class categoriesFor: #current!accessing!public! !
!Kernel.InstallRelativeFileLocator class categoriesFor: #onPreStripImage!class hierarchy-removing!private! !
!Kernel.InstallRelativeFileLocator class categoriesFor: #stbReadFrom:format:!binary filing!public! !
!Kernel.InstallRelativeFileLocator class categoriesFor: #uninitialize!class hierarchy-removing!private! !

