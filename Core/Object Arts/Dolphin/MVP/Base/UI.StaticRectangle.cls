﻿"Filed out from Dolphin Smalltalk 7"!

UI.ControlView subclass: #'UI.StaticRectangle'
	instanceVariableNames: ''
	classVariableNames: 'StyleMap'
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.StaticRectangle guid: (Core.GUID fromString: '{aad4f3a9-dc68-42b2-bedc-0a4fc49880f2}')!
UI.StaticRectangle comment: '`StaticRectangle` is a simple `ControlView` class which wraps the Windows STATIC control for simple rectangles and frames.

The rectangle styles paint a solid block of colour filling the client area. The frame styles draw a border/frame around the edge of the client area of the control allowing the background colour to show through.

Apart from its uses for background rectangles and frames, StaticRectangle can also be used for horizontal and vertical lines by setting the width or height appropriately. When using in conjunction with a `ProportionalLayout` to add some kind of divider, set the arrangement to 0 to maintain the specified width/height.

## Class Variables:
  `StyleMap`		`LookupTable` of `Symbol` rectangle/frame style names Windows styles.'!
!UI.StaticRectangle categoriesForClass!MVP-Views! !
!UI.StaticRectangle methodsFor!

setStyle: rectangleStyleBits
	"Private - Sets the rectangle style of this static control."

	self baseStyle: rectangleStyleBits maskedBy: SS_TYPEMASK recreateIfChanged: true!

style
	"Answer the style of rectangle currently adopted by the receiver."

	| styleFlags |
	styleFlags := self baseStyle bitAnd: SS_TYPEMASK.
	^StyleMap keyAtValue: styleFlags ifAbsent: [#blackFrame]!

style: rectangleStyleName
	"Set the style of rectangle required of the receiver to that identifier by the symbolic
	name, rectangleStyleName."

	self setStyle: (StyleMap at: rectangleStyleName)! !
!UI.StaticRectangle categoriesFor: #setStyle:!accessing!private! !
!UI.StaticRectangle categoriesFor: #style!accessing!public! !
!UI.StaticRectangle categoriesFor: #style:!accessing!public! !

!UI.StaticRectangle class methodsFor!

initialize
	"Private - Initialise the receiver's class variables:

			self initialize
	"

	self addClassConstant: 'StyleMap'
		value: (IdentityDictionary new
				at: #blackFrame put: SS_BLACKFRAME;
				at: #blackRectangle put: SS_BLACKRECT;
				at: #grayFrame put: SS_GRAYFRAME;
				at: #grayRectangle put: SS_GRAYRECT;
				at: #whiteFrame put: SS_WHITEFRAME;
				at: #whiteRectangle put: SS_WHITERECT;
				at: #etchedFrame put: SS_ETCHEDFRAME;
				at: #etchedHorizontal put: SS_ETCHEDHORZ;
				at: #etchedVertical put: SS_ETCHEDVERT;
				shrink;
				isImmutable: true;
				yourself)!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 985166 10 ##(UI.STBViewProxy) ##(UI.StaticRectangle) 34 14 nil nil 34 2 8 1140850951 1 416 nil 917510 ##(Graphics.Color) #default nil 7 nil nil nil 416 nil 8 1920531648 1310982 ##(Core.MessageSequence) 138 144 34 2 1049350 ##(Core.MessageSend) #createAt:extent: 34 2 655878 ##(Graphics.Point) 6143 21 642 211 51 416 594 #isEnabled: 8 #(false) 416 1179910 ##(OS.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 11 0 0 10 0 0 0 104 12 0 0 35 0 0 0] 8 #() 642 193 193 nil 27)!

winClassName
	"Private - Answer the name of the Windows window class to use when realizing the receiver."

	^'STATIC'
! !
!UI.StaticRectangle class categoriesFor: #initialize!development!initializing!private! !
!UI.StaticRectangle class categoriesFor: #resource_Default_view!public!resources-views! !
!UI.StaticRectangle class categoriesFor: #winClassName!constants!private! !

