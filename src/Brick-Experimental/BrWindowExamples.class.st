Class {
	#name : #BrWindowExamples,
	#superclass : #Object,
	#category : 'Brick-Experimental-Examples'
}

{ #category : #'as yet unclassified' }
BrWindowExamples class >> exampleDialWithInnerSpace [
	BrDialog new openAsInnerSpacePopup
]

{ #category : #'as yet unclassified' }
BrWindowExamples class >> exampleDialWithSpace [
	BrDialog new openAsSpacePopup
]

{ #category : #'as yet unclassified' }
BrWindowExamples class >> exampleMenu [

BrMenu new
	addChild:(BrLabel new text: (BrRopedText string: 'Hello1'));
	addChild:(BrLabel new text: (BrRopedText string: 'Hello1'));
	addChild:(BrLabel new text: (BrRopedText string: 'Hello1'));
	open
]

{ #category : #'as yet unclassified' }
BrWindowExamples class >> exampleWinWithInnerSpace [
|p space isp|
space := BlSpace new .
isp := BrInnerSpace new.
isp space: space.

p := BrWindow in: isp.
p extent: 200@200; windowPosition:100@100.
space show.
p show
]

{ #category : #'as yet unclassified' }
BrWindowExamples class >> exampleWinWithSideMenu [
	| win space label action sidepane|
	space := BlSpace new.
	space extent: 800 @ 600.
	
	win := BrWindow in: space.
	win borderless: true.
	win position: 100 @ 100.
		
	label := BrLabel new
		text: 'My Window';
		fontColor: Color white;
		fontSize: 14;
		constraintsDo: [ :c | c linear vertical alignCenter ].
		
	
	
	sidepane := BrSideNavigation new
		menuDo:[:m| m addChild:(BrToolbar new addChild:(BrLabel new
		text: 'My Menu';
		fontColor: Color white;
		fontSize: 14;
		constraintsDo: [ :c |  c linear vertical alignCenter ]))].
	
	action := BrActionItem new
		icon: (BrMdIcons menuIcon
			background: Color white;
			extent: 25 @ 25);
		action: [ sidepane open ].
	
	win root
		addChildren:
			{sidepane.(BrToolbar new addChildren: {action. label})}.
	win show
]

{ #category : #'as yet unclassified' }
BrWindowExamples class >> exampleWinWithSpace [
	| p space |
	space := BlSpace new.
	space borderless: true.
	p := (BrWindow in: space)
		extent: 200 @ 200;
		position: 100 @ 100.
	p root
		addChild:
			(BrButton new
				text: (BrRopedText string: 'open menu');
				addEventHandler: (BrOnClickHandler do:[:evt|
					BrMenu new 
					openAt:evt screenPosition])).
	p show
]
