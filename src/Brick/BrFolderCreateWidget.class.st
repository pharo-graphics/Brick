Class {
	#name : #BrFolderCreateWidget,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'folder',
		'container',
		'label',
		'button',
		'onFolderCreated'
	],
	#category : #Brick
}

{ #category : #accessing }
BrFolderCreateWidget >> createButton [
	^ BrButton new
				icon: BrGlamorousIcons accept;
				look: (BrGlamorousButtonRectangularLook new + BrGlamorousButtonIconLook new+BrGlamorousButtonExteriorLook new);
				disable
]

{ #category : #accessing }
BrFolderCreateWidget >> createLabel [
	^ BrEditableLabel new
		look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
		switchToEditor;
	text: 'Double click me'.
]

{ #category : #accessing }
BrFolderCreateWidget >> defaultFolderName: anObject [ 
	label text: anObject.
	(folder / anObject) exists ifFalse: [button enable]; ifTrue:[button disable].
]

{ #category : #accessing }
BrFolderCreateWidget >> folder: aFolderReference [
	folder := aFolderReference
]

{ #category : #accessing }
BrFolderCreateWidget >> initialize [
	super initialize.
	self hMatchParent.
	self vFitContent.
	self alignCenter.
	label := self createLabel. 
	button := self createButton.
	self addChild: label.
	self addChild: button.
	label editor
		when: BrTextEditorModifiedEvent
		do: [ :anEvent | 
				(folder / anEvent text asString) exists
						ifTrue: [ button disable ];
						ifFalse: [  button enable ] ].
	button action: [(folder / label text asString) ensureCreateDirectory. button disable.
	onFolderCreated ifNotNil: [onFolderCreated value]].
]

{ #category : #accessing }
BrFolderCreateWidget >> onFolderCreated: aBlock [
	onFolderCreated := aBlock.
]

{ #category : #accessing }
BrFolderCreateWidget >> requestLabelFocus [
	label requestFocus.
]
