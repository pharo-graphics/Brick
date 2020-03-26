Class {
	#name : #BrGlamorousTaggerEditableLook,
	#superclass : #BrTaggerLook,
	#instVars : [
		'tags',
		'shouldGiveFocusToNewTag'
	],
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
	tags
		addChild: self newTagCreatorElement
		at: (self request: BrTaggerTagsRequest new oneWay) tags size + 1
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> assignTag: aTaggerTag toElement: aTagElement [
	aTagElement userData at: #brickTaggerTag put: aTaggerTag
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> giveFocusToNewTagDuring: aBlock [
	| previousValue |
	
	previousValue := shouldGiveFocusToNewTag.
	shouldGiveFocusToNewTag := true.
	aBlock ensure: [ shouldGiveFocusToNewTag := previousValue ]
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
	
	shouldGiveFocusToNewTag := false.

	tags := BlElement new layout: BlFlowLayout horizontal.
	tags addChild: self newAddTagButton.

	self addChangeAddChildAs: #(tags) with: [ tags ].	
	
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout horizontal ].
	
	self add: BrHorizontalPaneLook new.
	self add: (BrLayoutResizerLook new
		inherit;
		inherit: tags)
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
		icon: BrGlamorousIcons add;
		label: 'Add';
		beSmall;
		hExact: 20;
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

	aNewTagCreator := BrEditableLabel new
		look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
		text: '';
		requestFocus;
		switchToEditor;
		padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10);
		constraintsDo: [ :c | c flow vertical alignCenter ];
		when: BrEditorAcceptWish do: [ :aWish |
			self
				requestAddTag: (BrTaggerTag named: aWish text asString)
				from: aWish currentTarget ];
		when: BrEditorCancelWish do: [ :anEvent |
			anEvent currentTarget focusPrevious.
			anEvent currentTarget removeFromParent ].

	aNewTagCreator navigator
		moveTo: 0;
		apply.

	^ aNewTagCreator
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerEditableLook >> newTagElementFor: aTaggerTag [
	<return: #BlElement>

	^ BrEditableLabel new
		look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
		text: aTaggerTag name;
		margin: (BlInsets top: 2 left: 0 bottom: 2 right: 2);
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

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagAdded: aTaggerTag at: anIndex [
	| aTagElement |

	aTagElement := self newTagElementFor: aTaggerTag.
	self assignTag: aTaggerTag toElement: aTagElement.		
	tags addChild: aTagElement at: anIndex.
	
	shouldGiveFocusToNewTag
		ifTrue: [ aTagElement requestFocus ]
]

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagRemoved: aTaggerTag at: anIndex [
	self
		tagElementFor: aTaggerTag
		ifFound: [ :anElement |
			anElement hasFocus
				ifTrue: [
					anIndex = 1
						ifFalse: [ anElement focusPrevious ]
						ifTrue: [ anElement focusNext ] ].
			anElement removeFromParent ]
]

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagRenamed: aTaggerTag to: aNewName [
	self
		tagElementFor: aTaggerTag
		ifFound: [ :aTagElement | aTagElement text: aNewName ]
]

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagsChanged: theTags [
	tags removeChildren: self tagElements.
	theTags withIndexDo: [ :eachTag :eachIndex | self onTagAdded: eachTag at: eachIndex ]
]

{ #category : #'api - requests' }
BrGlamorousTaggerEditableLook >> requestAddTag: aTaggerTag from: aTagCreatorElement [
	"I request the tagger to add a new tag while handling possible errors"
	
	[
		self giveFocusToNewTagDuring: [ self dispatchEvent: (BrTaggerAddTagRequest new tag: aTaggerTag) ].
		aTagCreatorElement removeFromParent.
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

{ #category : #private }
BrGlamorousTaggerEditableLook >> tagElementFor: aTaggerTag ifFound: aFoundBlock [
	tags children
		detect: [ :eachTagElement |
			eachTagElement userData
				at: #brickTaggerTag
				ifPresent: [ :eachTag | eachTag == aTaggerTag ]
				ifAbsent: [ false ] ]
		ifFound: aFoundBlock
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> tagElements [
	^ tags children
		select: [ :eachTagElement |
			eachTagElement userData
				at: #brickTaggerTag
				ifPresent: [ true ]
				ifAbsent: [ false ] ]
]
