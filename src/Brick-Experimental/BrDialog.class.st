Class {
	#name : #BrDialog,
	#superclass : #BrWidget,
	#category : 'Brick-Experimental-Dialog'
}

{ #category : #'as yet unclassified' }
BrDialog >> defaultController [
	^ BrDialogController new 
]

{ #category : #'as yet unclassified' }
BrDialog >> defaultSkin [
	^ BrDialogSkin new
]

{ #category : #'as yet unclassified' }
BrDialog >> openAsInnerSpacePopup [
	
	
	| sp isp|
	sp := BlSpace new.
		
	isp	 := BrInnerSpace new
		extent: 300 @ 250;
		position: 100 @ 100;
		root: self.

	sp root addChild:isp.
	sp show
]

{ #category : #'as yet unclassified' }
BrDialog >> openAsSpacePopup [
	| sp |
	sp := BlSpace new
		borderless: true;
		resizable: false;
		extent: 300 @ 250;
		position: 100 @ 100.	
		
	sp root addChild: self.
	sp show.
]
