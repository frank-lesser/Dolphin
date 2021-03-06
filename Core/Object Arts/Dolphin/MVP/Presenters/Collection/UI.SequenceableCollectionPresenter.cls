﻿"Filed out from Dolphin Smalltalk 7"!

UI.CollectionPresenter subclass: #'UI.SequenceableCollectionPresenter'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.SequenceableCollectionPresenter guid: (Core.GUID fromString: '{87b4c68c-026e-11d3-9fd7-00a0cc3e4a32}')!
UI.SequenceableCollectionPresenter comment: 'SequenceableCollectionPresenter is a <valuePresenter> that presents a <sequencedCollection> accessed via its <valueModel>. It provides a number of [operations]for editing the list. As changes are made to the list it is applied back to the presenter''s <valueModel>.

'!
!UI.SequenceableCollectionPresenter categoriesForClass!MVP-Presenters! !
!UI.SequenceableCollectionPresenter methodsFor!

canReorder
	"Private - Answer true if it is valid to reorder the receiver's collection"

	^self isReadOnly not 
		and: [self model canSet and: [self model value class conformsToProtocol: #sequencedCollection]]!

moveDown
	"Moves the current selection closer to the end of the receiver's list"

	| index list |
	index := listPresenter selectionByIndex.
	list := self listModel.
	"Although we are only swapping two elements, the collection presenter responds to any event
	from the list model by refreshing everything (see
	CollectionPresenter>>createSchematicWiring). We don't want to refresh it twice."
	list noEventsDo: [list swap: index with: index + 1].
	list notifyListChanged.
	listPresenter selectionByIndex: index + 1!

moveFirst
	"Moves the current selection to be the first item in the receiver's list"

	| list index |
	index := listPresenter selectionByIndex.
	list := self listModel.
	list noEventsDo: 
			[| item |
			item := list at: index.
			list replaceFrom: 2 to: index with: list startingAt: 1.
			list at: 1 put: item].
	list notifyListChanged.
	listPresenter selectionByIndex: 1!

moveLast
	"Moves the current selection to be the last  item in the receiver's list"

	| list index last |
	index := listPresenter selectionByIndex.
	list := self listModel.
	last := list size.
	list noEventsDo: 
			[| item |
			item := list at: index.
			list 
				replaceFrom: index
				to: last - 1
				with: list
				startingAt: index + 1.
			list at: last put: item].
	list notifyListChanged.
	listPresenter selectionByIndex: last!

moveUp
	"Moves the current selection closer to the head of the receiver's list"

	| index list |
	index := listPresenter selectionByIndex.
	list := self listModel.
	list noEventsDo: [list swap: index with: index - 1].
	list notifyListChanged.
	listPresenter selectionByIndex: index - 1!

onValueChanged
	"Private - The value has been changed in the receiver's model.
	Transfer the value to the listModel"

	listPresenter list: self value!

queryCommand: query
	"Private - Enters details about a potential command for the receiver into 
	the <CommandQuery>, query"

	| command |
	command := query commandSymbol.
	(#(#moveUp #moveFirst) identityIncludes: command) 
		ifTrue: 
			[query isEnabled: (self canReorder and: [listPresenter selectionByIndex > 1]).
			^true].
	(#(#moveDown #moveLast) identityIncludes: command) 
		ifTrue: 
			[query 
				isEnabled: (self canReorder and: 
							[| selected |
							selected := listPresenter selectionByIndex.
							selected > 0 and: [selected < self listModel size]]).
			^true].
	^super queryCommand: query! !
!UI.SequenceableCollectionPresenter categoriesFor: #canReorder!private!testing! !
!UI.SequenceableCollectionPresenter categoriesFor: #moveDown!commands!operations!public! !
!UI.SequenceableCollectionPresenter categoriesFor: #moveFirst!commands!operations!public! !
!UI.SequenceableCollectionPresenter categoriesFor: #moveLast!commands!operations!public! !
!UI.SequenceableCollectionPresenter categoriesFor: #moveUp!commands!operations!public! !
!UI.SequenceableCollectionPresenter categoriesFor: #onValueChanged!event handling!private! !
!UI.SequenceableCollectionPresenter categoriesFor: #queryCommand:!commands!private! !

!UI.SequenceableCollectionPresenter class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 985166 10 ##(UI.STBViewProxy) ##(UI.ContainerView) 34 15 nil nil 34 2 8 1409286144 131073 416 nil nil nil 5 nil nil nil 416 984838 ##(UI.BorderLayout) 1 1 410 ##(UI.ReferenceView) 34 14 nil 416 34 2 8 1140850688 131073 512 nil nil nil 5 nil nil nil 512 1376838 1 ##(UI.ResourceIdentifier) ##(UI.Toolbar) #resource_List_tools nil 1310982 ##(Core.MessageSequence) 138 144 34 2 1049350 ##(Core.MessageSend) #createAt:extent: 34 2 655878 ##(Graphics.Point) 1 1 722 501 51 512 674 #text: 34 1 8 'toolbar' 512 1179910 ##(OS.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 250 0 0 0 25 0 0 0] 8 #() 722 193 193 nil 27 nil nil nil 410 ##(UI.ListView) 34 45 nil 416 34 2 8 1140936781 1025 896 787270 2 ##(UI.ListModel) 138 144 864 nil 1638406 ##(Kernel.IdentitySearchPolicy) 917510 ##(Graphics.Color) #default nil 5 461638 4 ##(UI.Menu) nil true 34 4 1180742 2 ##(UI.CommandMenuItem) 1 1377606 4 ##(UI.CommandDescription) #moveFirst 8 'Move to &First' 1 1 nil nil nil 1122 1 1154 #moveUp 8 'Move to &Previous' 1 1 nil nil nil 1122 1 1154 #moveDown 8 'Move to &Next' 1 1 nil nil nil 1122 1 1154 #moveLast 8 'Move to &Last' 1 1 nil nil nil 8 '' nil 1 nil nil nil nil nil nil nil 896 nil 8 1920618720 786950 ##(Core.Message) #displayString 8 #() ##(UI.IconicListAbstract) 1639750 1 ##(Graphics.IconImageManager) nil nil nil nil nil nil 138 144 34 1 1117254 5 ##(UI.ListViewColumn) 8 '' 493 #left 1378 #displayString 1408 1378 #<= 8 #() nil nil 896 nil 3 nil nil #report 8 #() nil 133217 nil 1 nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil 610 138 144 34 2 674 #createAt:extent: 34 2 722 1 51 722 501 251 896 674 #contextMenu: 34 1 1088 896 818 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 25 0 0 0 250 0 0 0 150 0 0 0] 8 #() 880 nil 35 170 192 34 2 896 8 'list' nil 610 138 144 34 1 674 #createAt:extent: 34 2 722 6143 21 722 501 301 416 818 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 11 0 0 10 0 0 0 249 12 0 0 160 0 0 0] 34 2 512 896 880 nil 27)! !
!UI.SequenceableCollectionPresenter class categoriesFor: #resource_Default_view!public!resources-views! !

