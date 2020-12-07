Class {
	#name : #BrScrollPaneLook,
	#superclass : #BrLook,
	#instVars : [
		'scrollable'
	],
	#category : #'Brick-Scrollable - Look'
}

{ #category : #initialization }
BrScrollPaneLook >> initialize [
	super initialize.

	scrollable := BlScrollableElement new.
	self add: (BrLayoutResizerLook inherit inherit: scrollable).

	self addChangeAddChildAs: #(content scrollable) with: [ scrollable ].

	self
		addChangeProperty: #(widgetContent layout)
		with: [ BlLinearLayout vertical ]
]

{ #category : #initialization }
BrScrollPaneLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrScrollableContentChanged do: [ :anEvent | self onContentChanged: anEvent contentStencil ].
	self when: BrScrollByWish do: [ :anEvent | self onScrollBy: anEvent ].
	self when: BrScrollToItemWish do: [ :anEvent | self onScrollToChild: anEvent ].
]

{ #category : #initialization }
BrScrollPaneLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrScrollableContentRequest new
]

{ #category : #'private - hooks' }
BrScrollPaneLook >> onContentChanged: aContentStencil [
	| aContentElement |
	
	aContentElement := aContentStencil asElement.
	aContentElement removeFromParent.
	
	scrollable scrolledElementDo: [ :aPreviousContent | aPreviousContent removeFromParent ].
	scrollable addChildFirst: aContentElement
]

{ #category : #'private - hooks' }
BrScrollPaneLook >> onScrollBy: aScrollByWish [
	aScrollByWish smooth
		ifTrue: [ scrollable smoothScrollBy: aScrollByWish delta ]
		ifFalse: [ scrollable scrollBy: aScrollByWish delta ]
]

{ #category : #'private - hooks' }
BrScrollPaneLook >> onScrollToChild: aScrollToItemWish [
	
]
