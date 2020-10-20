﻿"Filed out from Dolphin Smalltalk 7"!

OS.COM.IDispatch subclass: #'CDO.INNTPOnPost'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
CDO.INNTPOnPost guid: (OS.COM.IID fromString: '{cd000027-8b95-11d1-82db-00c04fb1625d}')!
CDO.INNTPOnPost comment: '<CDO.INNTPOnPost> is a wrapper class for the COM interface ''CDO.INNTPOnPost'' generated from type information in the ''Microsoft CDO for Windows 2000 Library'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The interface to implement when creating NNTP OnPost event sinks"

Warning: This comment was automatically generated from the interface''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.'!
!CDO.INNTPOnPost categoriesForClass!CDO-Interfaces!COM-Interfaces! !
!CDO.INNTPOnPost methodsFor!

isExtensible
	"Answer whether the receiver may add methods at run-time."

	^false!

isVBCollection
	"Answer whether the receiver is a VB style collection."

	^false!

OnPost: msg EventStatus: eventStatus
	"Invoke the OnPost() method of the COM object wrapped by the receiver.
	Helpstring: 'Called by the NNTP event dispatcher when a message is posted.'

		HRESULT __stdcall OnPost(
			[in] IMessage* Msg,
			[in, out] CdoEventStatus* EventStatus);
	"

	<virtual stdcall: hresult 8 IMessage* sdword*>
	^self invalidCall: _failureCode! !
!CDO.INNTPOnPost categoriesFor: #isExtensible!**auto generated**!public!testing! !
!CDO.INNTPOnPost categoriesFor: #isVBCollection!**auto generated**!public!testing! !
!CDO.INNTPOnPost categoriesFor: #OnPost:EventStatus:!**auto generated**!COM Interfaces-INNTPOnPost!public! !

!CDO.INNTPOnPost class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'CDO.INNTPOnPost'
		CDO.INNTPOnPost defineTemplate
	"

	self
		defineFunction: #OnPost:EventStatus:
			argumentTypes: 'IMessage* sdword*'
!

initializeTypeLib
	"Private - Establish a connection to the receiver's type library.
		CDO.INNTPOnPost initializeTypeLib
	"

	typeLib := CDOLib! !
!CDO.INNTPOnPost class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !
!CDO.INNTPOnPost class categoriesFor: #initializeTypeLib!**auto generated**!initializing!private! !
