﻿"Filed out from Dolphin Smalltalk 7"!

Kernel.ParseNodeVisitor subclass: #'Refactory.Browser.ParseTreeSearcher'
	instanceVariableNames: 'searches answer argumentSearches context messages'
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Refactory.Browser.ParseTreeSearcher guid: (Core.GUID fromString: '{88f9b089-e658-4426-8d0a-f18303952cad}')!
Refactory.Browser.ParseTreeSearcher comment: 'ParseTreeSearcher walks over a normal source code parse tree using the visitor pattern, and then matches these nodes against the meta-nodes using the match:inContext: methods defined for the meta-nodes.

Instance Variables:
	answer	<Object>	the "answer" that is propagated between matches
	argumentSearches	<Collection of: (Association key: BRProgramNode value: BlockClosure)>	argument searches (search for the BRProgramNode and perform the BlockClosure when its found)
	context	<BRSmallDictionary>	a dictionary that contains what each meta-node matches against. This could be a normal Dictionary that is created for each search, but is created once and reused (efficiency).
	searches	<Collection of: (Association key: BRProgramNode value: BlockClosure)>	non-argument searches (search for the BRProgramNode and perform the BlockClosure when its found)'!
!Refactory.Browser.ParseTreeSearcher categoriesForClass!Refactory-ParseTree Matching! !
!Refactory.Browser.ParseTreeSearcher methodsFor!

addArgumentRule: aParseTreeRule
	argumentSearches := argumentSearches asOrderedCollection.
	self basicAddArgumentRule: aParseTreeRule!

addArgumentRules: ruleCollection
	ruleCollection do: [:each | self basicAddArgumentRule: each]!

addRule: aParseTreeRule
	searches := searches asOrderedCollection.
	self basicAddRule: aParseTreeRule!

addRules: ruleCollection
	ruleCollection do: [:each | self basicAddRule: each]!

answer
	^answer!

answer: anObject
	answer := anObject!

basicAddArgumentRule: aParseTreeRule
	argumentSearches add: aParseTreeRule.
	aParseTreeRule owner: self!

basicAddRule: aParseTreeRule
	searches add: aParseTreeRule.
	aParseTreeRule owner: self!

basicExecuteTree: aParseTree
	| oldContext result |
	searches := searches asArray.
	argumentSearches := argumentSearches asArray.
	oldContext := context.
	context := RBSmallDictionary new.
	result := self visitNode: aParseTree.
	context := oldContext.
	^result!

canMatchMethod: aCompiledMethod
	| msgs |
	msgs := self messages.
	^msgs isEmpty or: 
			[| symbols |
			symbols := aCompiledMethod allSymbolLiterals.
			msgs anySatisfy: [:each | symbols includes: each]]!

context
	^context!

executeMethod: aParseTree initialAnswer: anObject 
	answer := anObject.
	searches detect: [:each | (each performOn: aParseTree) notNil] ifNone: [].
	^answer!

executeTree: aParseTree
	self basicExecuteTree: aParseTree.
	^answer!

executeTree: aParseTree initialAnswer: aValue 
	answer := aValue.
	^self executeTree: aParseTree!

foundMatch!

initialize
	super initialize.
	context := RBSmallDictionary new.
	searches := OrderedCollection new.
	argumentSearches := #().
	answer := nil!

lookForMoreMatchesInContext: oldContext
	oldContext keysAndValuesDo: 
			[:key :value |
			((key isKindOf: String) not and: [key recurseInto])
				ifTrue: [value do: [:each | self visitNode: each]]]!

matches: aString do: aBlock
	self addRule: (RBSearchRule searchFor: aString thenDo: aBlock)!

matchesAnyArgumentOf: stringCollection do: aBlock 
	stringCollection do: [:each | self matchesArgument: each do: aBlock]!

matchesAnyMethodOf: aStringCollection do: aBlock 
	aStringCollection do: [:each | self matchesMethod: each do: aBlock]!

matchesAnyOf: aStringCollection do: aBlock 
	aStringCollection do: [:each | self matches: each do: aBlock]!

matchesAnyTreeOf: treeCollection do: aBlock 
	treeCollection do: [:each | self matchesTree: each do: aBlock]!

matchesArgument: aString do: aBlock
	self addArgumentRule: (RBSearchRule searchFor: aString thenDo: aBlock)!

matchesArgumentTree: aBRProgramNode do: aBlock
	self addArgumentRule: (RBSearchRule searchForTree: aBRProgramNode thenDo: aBlock)!

matchesMethod: aString do: aBlock
	self addRule: (RBSearchRule searchForMethod: aString thenDo: aBlock)!

matchesTree: aBRProgramNode do: aBlock
	self addRule: (RBSearchRule searchForTree: aBRProgramNode thenDo: aBlock)!

messages
	messages notNil ifTrue: [^messages].
	argumentSearches notEmpty ifTrue: [^messages := #()].
	messages := IdentitySet new.
	searches do: 
			[:each |
			| searchMessages |
			searchMessages := each sentMessages.
			RBProgramNode optimizedSelectors do: [:sel | searchMessages remove: sel ifAbsent: []].
			searchMessages isEmpty ifTrue: [^messages := #()].
			messages addAll: searchMessages].
	^messages := messages asArray!

performSearches: aSearchCollection on: aNode 
	1 to: aSearchCollection size
		do: 
			[:i | 
			| value |
			value := (aSearchCollection at: i) performOn: aNode.
			value notNil 
				ifTrue: 
					[self foundMatch.
					^value]].
	^nil!

recusivelySearchInContext
	"We need to save the matched context since the other searches might overwrite it."

	| oldContext |
	oldContext := context.
	context := RBSmallDictionary new.
	self lookForMoreMatchesInContext: oldContext.
	context := oldContext!

visitArgumentNode: aNode
	| value |
	value := self performSearches: argumentSearches on: aNode.
	^value
		ifNil: 
			[super visitArgumentNode: aNode.
			aNode]!

visitNode: aNode
	^(self performSearches: searches on: aNode)
		ifNil: 
			[super visitNode: aNode.
			aNode]! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #addArgumentRule:!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #addArgumentRules:!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #addRule:!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #addRules:!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #answer!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #answer:!initialize/release!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #basicAddArgumentRule:!accessing!private! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #basicAddRule:!accessing!private! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #basicExecuteTree:!private!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #canMatchMethod:!public!testing! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #context!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #executeMethod:initialAnswer:!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #executeTree:!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #executeTree:initialAnswer:!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #foundMatch!helpers!private! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #initialize!initialize/release!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #lookForMoreMatchesInContext:!operations!private! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matches:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matchesAnyArgumentOf:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matchesAnyMethodOf:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matchesAnyOf:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matchesAnyTreeOf:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matchesArgument:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matchesArgumentTree:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matchesMethod:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #matchesTree:do:!public!searching! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #messages!accessing!public! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #performSearches:on:!operations!private! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #recusivelySearchInContext!operations!private! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #visitArgumentNode:!public!visiting! !
!Refactory.Browser.ParseTreeSearcher categoriesFor: #visitNode:!public!visiting! !

!Refactory.Browser.ParseTreeSearcher class methodsFor!

buildSelectorString: aSelector
	| stream keywords |
	aSelector argumentCount = 0 ifTrue: [^aSelector].
	stream := WriteStream on: String new.
	keywords := aSelector keywords.
	1 to: keywords size
		do: 
			[:i |
			stream
				nextPutAll: (keywords at: i);
				nextPutAll: ' ``@arg';
				nextPutAll: i printString;
				nextPut: $\x20].
	^stream contents!

buildSelectorTree: aSelector 
	aSelector isEmpty ifTrue: [^nil].
	^RBParser parseRewriteExpression: '``@receiver ' 
				, (self buildSelectorString: aSelector)
		onError: [:err :pos | ^nil]!

buildTree: aString method: aBoolean 
	^aBoolean 
		ifTrue: [RBParser parseRewriteMethod: aString]
		ifFalse: [RBParser parseRewriteExpression: aString]!

getterMethod: aVarName 
	^(self new)
		matchesMethod: '`method ^' , aVarName do: [:aNode :ans | aNode selector];
		yourself!

justSendsSuper
	^(self new)
		matchesAnyMethodOf: 
				#('`@method: `@Args ^super `@method: `@Args' 
				'`@method: `@Args super `@method: `@Args')
			do: [:aNode :ans | true];
		yourself!

returnSetterMethod: aVarName 
	^(self new)
		matchesMethod: '`method: `Arg ^' , aVarName , ' := `Arg'
			do: [:aNode :ans | aNode selector];
		yourself!

setterMethod: aVarName
	^self new
		matchesAnyMethodOf: {'`method: `Arg ' , aVarName , ' := `Arg'.
					'`method: `Arg ^' , aVarName , ' := `Arg'}
			do: [:aNode :ans | aNode selector];
		yourself!

treeMatching: aString in: aParseTree 
	(self new)
		matches: aString do: [:aNode :answer | ^aNode];
		executeTree: aParseTree.
	^nil!

treeMatchingStatements: aString in: aParseTree
	| notifier tree |
	notifier := self new.
	tree := RBParser parseExpression: aString.
	tree isSequence ifFalse: [tree := RBSequenceNode statements: {tree}].
	tree temporaries: {RBPatternVariableNode named: '`@temps'}.
	tree addNodeFirst: (RBPatternVariableNode named: '`@.S1').
	tree lastIsReturn ifFalse: [tree addNode: (RBPatternVariableNode named: '`@.S2')].
	notifier matchesTree: tree do: [:aNode :answer | ^RBParser parseExpression: aString].
	notifier executeTree: aParseTree.
	^nil! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #buildSelectorString:!helpers!private! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #buildSelectorTree:!helpers!private! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #buildTree:method:!helpers!private! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #getterMethod:!instance creation!public! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #justSendsSuper!instance creation!public! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #returnSetterMethod:!instance creation!public! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #setterMethod:!instance creation!public! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #treeMatching:in:!accessing!public! !
!Refactory.Browser.ParseTreeSearcher class categoriesFor: #treeMatchingStatements:in:!accessing!public! !

