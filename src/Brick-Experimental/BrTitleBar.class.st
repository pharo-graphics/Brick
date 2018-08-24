Class {
	#name : #BrTitleBar,
	#superclass : #BrToolbar,
	#category : 'Brick-Experimental-Window'
}

{ #category : #'as yet unclassified' }
BrTitleBar >> initialize [
	| iconMenu label action|
	super initialize.
	iconMenu := BrMdIcons menuIcon
		background: Color white;
		extent: 25 @ 25.
	label := BrLabel new
				text: 'New Window';
				fontColor: Color white;
				fontSize: 12;
				constraintsDo: [ :c | c vertical alignCenter ].
	action := BrActionItem new
				icon: iconMenu;
				action: [  ].
	
	self addChildren:{action. label}.
	
]

{ #category : #'as yet unclassified' }
BrTitleBar >> title [
]

{ #category : #'as yet unclassified' }
BrTitleBar >> title: anObject [
]
