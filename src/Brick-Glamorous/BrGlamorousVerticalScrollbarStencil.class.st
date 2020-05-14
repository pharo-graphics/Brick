Class {
	#name : #BrGlamorousVerticalScrollbarStencil,
	#superclass : #BrStencil,
	#instVars : [
		'scrollable'
	],
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #'api - instantiation' }
BrGlamorousVerticalScrollbarStencil >> create [
	<return: #Object>

	^ BrScrollbar new
		scrollable: scrollable;
		look: BrScrollbarLook new;
		thumb: (BrScrollbarThumb new look: BrGlamorousScrollbarThumbLook new);
		track: (BrScrollbarTrack new look: BrGlamorousScrollbarTrackLook new);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored horizontal alignRight ]
]

{ #category : #accessing }
BrGlamorousVerticalScrollbarStencil >> scrollable [
	^ scrollable
]

{ #category : #accessing }
BrGlamorousVerticalScrollbarStencil >> scrollable: anObject [
	scrollable := anObject
]
