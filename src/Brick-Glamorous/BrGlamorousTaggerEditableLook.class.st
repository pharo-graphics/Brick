Class {
	#name : #BrGlamorousTaggerEditableLook,
	#superclass : #BrGlamorousTaggerLook,
	#category : #'Brick-Glamorous-Tagger'
}

{ #category : #private }
BrGlamorousTaggerEditableLook >> addErrorOverlayTo: aTagElement [
	| anOverlay anAnimation |

	anOverlay := (BlOverlayElement on: aTagElement)
		geometry: aTagElement geometry copy.
	
	anAnimation := BlColorTransition new
		from: (BrGlamorousColors errorBackgroundColor alpha: 0.5);
		to: Color transparent;
		onStepDo: [ :eachColor | anOverlay background: eachColor ];
		onFinishedDo: [ anOverlay removeFromParent ].
	anOverlay addAnimation:  anAnimation.
	tags addChild: anOverlay
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> addTagCreatorElement [
	self
		addTagElement: self newTagCreatorElement
		withSeparatorAt: tagElements size + 1
]

{ #category : #initialization }
BrGlamorousTaggerEditableLook >> defaultTagLabelStencil [
	^ [ :aTag |
		BrEditableLabel new
			look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
			text: aTag name ] asStencilBuilder: BrTaggerTagStencilBuilder
]

{ #category : #'hooks - errors' }
BrGlamorousTaggerEditableLook >> handleAcceptError: anError from: aTagCreatorElement [
	anError description traceCr.

	aTagCreatorElement switchToEditor.

	self addErrorOverlayTo: aTagCreatorElement
]

{ #category : #'hooks - errors' }
BrGlamorousTaggerEditableLook >> handleRemoveError: anError from: aTagElement [
	anError description traceCr.

	self addErrorOverlayTo: aTagElement
]

{ #category : #'hooks - errors' }
BrGlamorousTaggerEditableLook >> handleRenameError: anError to: aNewName from: aTagElement [
	anError description traceCr.

	aTagElement switchToEditor.	

	"revert text back to the new name"
	aTagElement text: aNewName.
	aTagElement selecter
		all;
		select.
	
	self addErrorOverlayTo: aTagElement
]

{ #category : #initialization }
BrGlamorousTaggerEditableLook >> initialize [
	super initialize.
	
	tags addChild: self newAddTagButton
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerEditableLook >> newAddTagButton [
	^ BrButton new
		look:
			(BrGlamorousButtonRectangularLook new +
			BrGlamorousButtonIconLook new +
			BrGlamorousWithLabelTooltipLook new + (BrInteractiveCommonLook new
				default: [ :aWidget |
					aWidget
						border: BlBorder empty;
						background: BrGlamorousColors neutralBackgroundColor ];
				hovered: [ :aWidget | aWidget background: BrGlamorousColors neutralBackgroundColor darker ];
				pressed: [ :aWidget | aWidget background: BrGlamorousColors neutralBackgroundColor darker darker ];
				focused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1) ]));
		icon: BrGlamorousVectorIcons add;
		label: 'Add';
		beSmall;
		hExact: 20;
		margin: margin;
		constraintsDo: [ :c | c flow vertical alignCenter ];
		action: [ :aButton | self addTagCreatorElement ];
		addShortcut: (BlShortcut new
			combination: BlKeyCombination arrowLeft;
			action: [ :anEvent | anEvent currentTarget previousSiblingDo: [ :anElement | anElement requestFocus ] ]);
		addShortcut: (BlShortcut new
			combination: BlKeyCombination return;
			action: [ :anEvent | self addTagCreatorElement ])
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerEditableLook >> newTagCreatorElement [
	| aNewTagCreator |

	aNewTagCreator := (tagLabelStencil tag: (BrTaggerTag named: ''))asElement
		requestFocus;
		switchToEditor;
		padding: (BlInsets top: 5 left: 6 bottom: 5 right: 6);
		margin: margin;
		constraintsDo: [ :c | c flow vertical alignCenter ];
		when: BrEditorAcceptWish do: [ :aWish |
			self
				requestAddTag: (BrTaggerTag named: aWish text asString)
				from: aWish currentTarget ];
		when: BrEditorCancelWish do: [ :anEvent |
			anEvent currentTarget focusPrevious.
			self
				removeTagElement: anEvent currentTarget
				withSeparatorAt: tagElements size + 1 ].

	aNewTagCreator navigator
		moveTo: 0;
		apply.

	^ aNewTagCreator
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerEditableLook >> newTagElementFor: aTaggerTag [
	<return: #BlElement>

	^ (super newTagElementFor: aTaggerTag)
		when: BrEditorAcceptWish do: [ :aWish |
			self
				requestRenameTag: aTaggerTag
				to: aWish text asString
				from: aWish currentTarget ];
		whenKey: BlKeyCombination backspace labelDo: [ :anEditor :anEvent |
			self
				requestRemoveTag: aTaggerTag
				from: anEvent currentTarget ]
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> removeTagCreatorElement: aTagCreatorElement withSeparatorAt: aTagIndex [
	| aSeparatorIndex |

	aTagCreatorElement removeFromParent.
	
	aSeparatorIndex := self separatorChildIndexFor: aTagIndex.
	aSeparatorIndex > 2
		ifTrue: [ tags removeChildAt: aSeparatorIndex ]
]

{ #category : #'api - requests' }
BrGlamorousTaggerEditableLook >> requestAddTag: aTaggerTag from: aTagCreatorElement [
	"I request the tagger to add a new tag while handling possible errors"
	
	[
		self giveFocusToNewTagDuring: [ self dispatchEvent: (BrTaggerAddTagRequest new tag: aTaggerTag) ].
		self
			removeTagCreatorElement: aTagCreatorElement
			withSeparatorAt: tagElements size + 1
	]
		on: Error
		do: [ :anError | self handleAcceptError: anError from: aTagCreatorElement ]
]

{ #category : #'api - requests' }
BrGlamorousTaggerEditableLook >> requestRemoveTag: aTaggerTag from: aTagCreatorElement [
	
	[
		self dispatchEvent: (BrTaggerRemoveTagRequest new tag: aTaggerTag).
	]
		on: Error
		do: [ :anError |
			self
				handleRemoveError: anError
				from: aTagCreatorElement ]
]

{ #category : #'api - requests' }
BrGlamorousTaggerEditableLook >> requestRenameTag: aTaggerTag to: aNewName from: aTagElement [	
	[
		aTagElement text: aTaggerTag name.
		self dispatchEvent: (BrTaggerRenameTagRequest new tag: aTaggerTag; newName: aNewName).
	]
		on: Error
		do: [ :anError |
			self
				handleRenameError: anError
				to: aNewName
				from: aTagElement ]
]
