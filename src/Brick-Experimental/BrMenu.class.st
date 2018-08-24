Class {
	#name : #BrMenu,
	#superclass : #BrPane,
	#category : 'Brick-Experimental-Menu'
}

{ #category : #'as yet unclassified' }
BrMenu >> defaultController [
	^ BrMenuController new 
]

{ #category : #'as yet unclassified' }
BrMenu >> defaultSkin [
	^ BrMenuSkin new
]

{ #category : #'as yet unclassified' }
BrMenu >> open [
	
	BlSpace new
		borderless: true;
		extent: 150@300;
		position: 200@200;
		root: self;
		addEventHandler: (BlEventHandler on:BlWindowFocusOutEvent do:[:evt| self space close]);
		show.
	self requestFocus.
]

{ #category : #'as yet unclassified' }
BrMenu >> openAt: aPosition [
	
	BlSpace new
		borderless: true;
		extent: 150@300;
		position: aPosition - (150@0);
		root: self;
		addEventHandler: (BlEventHandler on:BlWindowFocusOutEvent do:[:evt| self space close]);
		show.
	self requestFocus.
]
