"
! Glamorous vertical scrollbar look
Is designed to add a vertical ${class:BrScrollbar}$ to a widget with a ${class:TBlScrollable}$ content. Due to the fact that the scrollbar should be above the scrollable content it should be added """"after"""" a look that adds a scrollable content.
"
Class {
	#name : #BrGlamorousWithVerticalScrollbarLook,
	#superclass : #BrLook,
	#instVars : [
		'scrollbar'
	],
	#category : #'Brick-Glamorous-Scrollbar'
}

{ #category : #initialization }
BrGlamorousWithVerticalScrollbarLook >> initialize [
	super initialize.

	scrollbar := BrScrollbar new
		look: BrScrollbarLook new;
		thumb: (BrScrollbarThumb new look: BrGlamorousScrollbarThumbLook new);
		track: (BrScrollbarTrack new look: BrGlamorousScrollbarTrackLook new);
		constraintsDo: [ :c |
			c ignoreByLayout.
			c ignored horizontal alignRight ].

	self addChangeAddChildAs: #(content verticalScrollbar) with: [ scrollbar scrollable: (self widget childNamed: #scrollable) ]
]
