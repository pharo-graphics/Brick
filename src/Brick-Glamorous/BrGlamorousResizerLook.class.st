Class {
	#name : #BrGlamorousResizerLook,
	#superclass : #BrResizerLook,
	#instVars : [
		'thickness'
	],
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #initialization }
BrGlamorousResizerLook >> initialize [
	super initialize.
	
	thickness := 1.
	
	self
		add:
			(BrResizerInteractiveLook new
				top: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c ignored horizontal alignCenter.
							c ignored vertical alignTop ] ];
				bottom: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c ignored horizontal alignCenter.
							c ignored vertical alignBottom ] ];
				left: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c ignored horizontal alignLeft.
							c ignored vertical alignCenter ] ];
				right: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c ignored horizontal alignRight.
							c ignored vertical alignCenter ] ];
				vertical: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical exact: self thickness.
							c ignored horizontal weight: 0.4 ] ];
				horizontal: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c horizontal exact: self thickness.
							c vertical matchParent.
							c ignored vertical weight: 0.4 ] ]).
	self
		addChangeProperty: #(widget background)
		with: [ Color gray alpha: 0.4 ].
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRectangle cornerRadius: 2 ]
]

{ #category : #accessing }
BrGlamorousResizerLook >> thickness [
	^ thickness
]

{ #category : #accessing }
BrGlamorousResizerLook >> thickness: anObject [
	thickness := anObject
]
