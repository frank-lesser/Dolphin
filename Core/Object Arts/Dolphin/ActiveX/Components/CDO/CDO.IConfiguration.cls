﻿"Filed out from Dolphin Smalltalk 7"!

OS.COM.IDispatch subclass: #'CDO.IConfiguration'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
CDO.IConfiguration guid: (OS.COM.IID fromString: '{cd000022-8b95-11d1-82db-00c04fb1625d}')!
CDO.IConfiguration comment: '<CDO.IConfiguration> is a wrapper class for the COM interface ''CDO.IConfiguration'' generated from type information in the ''Microsoft CDO for Windows 2000 Library'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Defines abstract methods and properties used to manage configuration information for CDO objects"

Warning: This comment was automatically generated from the interface''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.'!
!CDO.IConfiguration categoriesForClass!CDO-Interfaces!COM-Interfaces! !
!CDO.IConfiguration methodsFor!

fields
	"Answer the <ADODB.Fields> value of the 'Fields' property of the receiver.
	Helpstring: 'Returns the Fields collection for the object'
	Implementation Note: Originally auto-generated from the ADO type library,
	this method has been modified to answer a Smalltalk <sequencedReadableCollection>."

	| answer |
	answer := ADODB.Fields newPointer.
	self get_Fields: answer.
	^ADODB.ADOCollection on: answer

!

get_Fields: varFields
	"Private - Get the value of the 'Fields' property of the receiver.
	Helpstring: 'The object''s Fields collection.'

		HRESULT __stdcall Fields(
			[out, retval] Fields** varFields);
	"

	<virtual stdcall: hresult 8 ADODB.Fields**>
	^self invalidCall: _failureCode!

getInterface: interface
	"Answer the <IDispatch> result of invoking the COM Object's GetInterface() method.
	Helpstring: 'Returns a specified interface on this object; provided for script languages.'"

	| answer |
	answer := IDispatch newPointer.
	self
		GetInterface: interface
		ppUnknown: answer.
	^answer asObject
!

GetInterface: interface ppUnknown: ppUnknown
	"Private - Invoke the GetInterface() method of the COM object wrapped by the receiver.
	Helpstring: 'Returns a specified interface on this object; provided for script languages.'

		HRESULT __stdcall GetInterface(
			[in] BSTR Interface,
			[out, retval] IDispatch** ppUnknown);
	"

	<virtual stdcall: hresult 10 bstr IDispatch**>
	^self invalidCall: _failureCode!

isExtensible
	"Answer whether the receiver may add methods at run-time."

	^false!

isVBCollection
	"Answer whether the receiver is a VB style collection."

	^false!

Load: loadFrom URL: url
	"Invoke the Load() method of the COM object wrapped by the receiver.
	Helpstring: 'Loads the specified configuration.'

		HRESULT __stdcall Load(
			[in] CdoConfigSource LoadFrom,
			[in, optional] BSTR URL);
	"

	<virtual stdcall: hresult 9 sdword bstr>
	^self invalidCall: _failureCode!

value
	"Answer the <ADODB.Fields> value of the 'Fields' property of the receiver.
	Helpstring: 'The object''s Fields collection.'
	This is the default value (DISPID_VALUE) property of the receiver."

	^self fields
! !
!CDO.IConfiguration categoriesFor: #fields!properties!public! !
!CDO.IConfiguration categoriesFor: #get_Fields:!**auto generated**!COM Interfaces-IConfiguration!private! !
!CDO.IConfiguration categoriesFor: #getInterface:!**auto generated**!methods!public! !
!CDO.IConfiguration categoriesFor: #GetInterface:ppUnknown:!**auto generated**!COM Interfaces-IConfiguration!private! !
!CDO.IConfiguration categoriesFor: #isExtensible!**auto generated**!public!testing! !
!CDO.IConfiguration categoriesFor: #isVBCollection!**auto generated**!public!testing! !
!CDO.IConfiguration categoriesFor: #Load:URL:!**auto generated**!COM Interfaces-IConfiguration!public! !
!CDO.IConfiguration categoriesFor: #value!**auto generated**!properties!public! !

!CDO.IConfiguration class methodsFor!

clsid
	"Private - Answer the CLSID of the coclass (Configuration) for which the receiver is the default interface.
	"

	^CLSID fromString: '{CD000002-8B95-11D1-82DB-00C04FB1625D}'
!

defineFunctions
	"Declare the virtual function table for the COM interface 'CDO.IConfiguration'
		CDO.IConfiguration defineTemplate
	"

	self
		defineFunction: #get_Fields:
			argumentTypes: 'ADODB.Fields**';
		defineFunction: #Load:URL:
			argumentTypes: 'sdword bstr';
		defineFunction: #GetInterface:ppUnknown:
			argumentTypes: 'bstr IDispatch**'
!

initializeTypeLib
	"Private - Establish a connection to the receiver's type library.
		CDO.IConfiguration initializeTypeLib
	"

	typeLib := CDOLib! !
!CDO.IConfiguration class categoriesFor: #clsid!**auto generated**!constants!private! !
!CDO.IConfiguration class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !
!CDO.IConfiguration class categoriesFor: #initializeTypeLib!**auto generated**!initializing!private! !
