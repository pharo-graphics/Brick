Class {
	#name : #BrGlamorousListWithScrollbarLook,
	#superclass : #BrGlamorousWithVerticalScrollbarLook,
	#instVars : [
		'scrollableHandler'
	],
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #'api - orientation' }
BrGlamorousListWithScrollbarLook >> beHorizontal [
	scrollbar beHorizontal
]

{ #category : #'api - orientation' }
BrGlamorousListWithScrollbarLook >> beVertical [
	scrollbar beVertical
]

{ #category : #initialization }
BrGlamorousListWithScrollbarLook >> initialize [
	super initialize.

	scrollableHandler := BlEventHandler 
		on: BlElementRemovedFromParentEvent 
		do: [ :anEvent | self onScrollableRemovedFromParent: anEvent ].

	self add: (BrListOrientationLook new
		horizontal: [ :aStyle | aStyle do: [ :aWidget | self beHorizontal ] ];
		vertical: [ :aStyle | aStyle do: [ :aWidget | self beVertical ] ])
]

{ #category : #'private - event handling' }
BrGlamorousListWithScrollbarLook >> onScrollableRemovedFromParent: anEvent [
	"Since we have to remove and add a new infinite element to switch between
	horizontal and vertical orientation, we listen to scrollable element removal from its parent.
	Once it happens, we enqueue a new action to obtain new scrollable element in the next phase."
	anEvent currentTarget removeEventHandler: scrollableHandler.
	self widgetDo: [ :aWidget | 
		aWidget enqueueTask: (BlTaskAction new action: [
			self updateScrollable ]) ]
	
]

{ #category : #'private - updating' }
BrGlamorousListWithScrollbarLook >> updateScrollable [
	super updateScrollable.
	self scrollable addEventHandler: scrollableHandler
]
