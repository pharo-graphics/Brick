Extension { #name : #Exception }

{ #category : #'*Brick' }
Exception >> asDebuggableElement [
	| aRootContainer container textElement text debugButton anAction |
	self freeze.
	anAction := [ 
		[
			UIManager default
				gtDebugProcess: Processor activeProcess   
				context: self signalerContext 
				label: self description  
				fullView: true
				notification: nil
		] fork ].
	text := self printString asRopedText foreground: Color red.
	textElement := BrButton new 
		label: text;
		look: BrGlamorousLabelLook;
		action: anAction;
		constraintsDo: [ :c | 
			c linear vertical alignCenter. ].
	container := BlElement new.
	container constraintsDo: [ :c | 
		c vertical fitContent.
		c horizontal fitContent ].
	container layout: BlLinearLayout horizontal.
	container addChild: textElement.
	debugButton := BrButton new.
	debugButton look: BrGlamorousButtonWithIconLook.
	debugButton icon: BrGlamorousIcons debug.
	debugButton label: 'Debug'.
	debugButton beSmall.
	debugButton action: anAction.
	debugButton
		constraintsDo: [ :c | 
			c linear vertical alignCenter. ].
	container 
		addChild: debugButton;
		constraintsDo: [ :c | 
			c frame vertical alignCenter.
			c frame horizontal alignCenter ].
	aRootContainer := BrFrame new matchParent
		addChild: container.
	^ aRootContainer
]
