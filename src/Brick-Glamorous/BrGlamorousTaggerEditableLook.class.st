Class {
	#name : #BrGlamorousTaggerEditableLook,
	#superclass : #BrTaggerLook,
	#instVars : [
		'tags',
		'shouldGiveFocusToNewTag',
		'separatorStencil',
		'tagElements',
		'editableLabelStencil',
		'margin'
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
	self
		addTagElement: self newTagCreatorElement
		withSeparatorAt: tagElements size + 1
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> addTagElement: aTagElement withSeparatorAt: aTagIndex [
	| aSeparatorIndex aTagElementIndex |
	
	aSeparatorIndex := self separatorChildIndexFor: aTagIndex.
	aTagElementIndex := self tagChildIndexFor: aTagIndex.
	
	aSeparatorIndex isZero
		ifFalse: [ tags addChild: self newSeparatorElement at: aSeparatorIndex ].

	tags addChild: aTagElement at: aTagElementIndex
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> assignTag: aTaggerTag toElement: aTagElement [
	aTagElement userData at: #brickTaggerTag put: aTaggerTag
]

{ #category : #'api - style' }
BrGlamorousTaggerEditableLook >> editableLabel: aStencil [
	editableLabelStencil := aStencil asStencil
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

{ #category : #testing }
BrGlamorousTaggerEditableLook >> hasSeparator [
	^ separatorStencil isNotNil
]

{ #category : #initialization }
BrGlamorousTaggerEditableLook >> initialize [
	super initialize.
	
	shouldGiveFocusToNewTag := false.
	separatorStencil := nil.
	margin := BlInsets top: 3 left: 0 bottom: 3 right: 5.
	editableLabelStencil := [
		BrEditableLabel new
			look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize ] asStencil.

	tags := BlElement new layout: BlFlowLayout horizontal.
	tags addChild: self newAddTagButton.

	tagElements := OrderedCollection new.
	
	self addChangeAddChildAs: #(tags) with: [ tags ].	
	
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout horizontal ].
	
	self add: BrHorizontalPaneLook new.
	self add: (BrLayoutResizerLook new
		inherit;
		inherit: tags)
]

{ #category : #'api - style' }
BrGlamorousTaggerEditableLook >> margin: aBlInsets [
	margin := aBlInsets
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
BrGlamorousTaggerEditableLook >> newSeparatorElement [
	^ separatorStencil asElement
		focusability: BlFocusability none;
		margin: (BlInsets right: margin right);
		constraintsDo: [ :c | c flow vertical alignCenter ]
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerEditableLook >> newTagCreatorElement [
	| aNewTagCreator |

	aNewTagCreator := editableLabelStencil asElement
		text: '';
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

	^ editableLabelStencil asElement
		text: aTaggerTag name;
		margin: margin;
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
BrGlamorousTaggerEditableLook >> onTagAdded: aTaggerTag at: aTagIndex [
	| aTagElement |

	aTagElement := self newTagElementFor: aTaggerTag.
	self assignTag: aTaggerTag toElement: aTagElement.

	self addTagElement: aTagElement withSeparatorAt: aTagIndex.
	tagElements add: aTagElement beforeIndex: aTagIndex.
	
	shouldGiveFocusToNewTag
		ifTrue: [ aTagElement requestFocus ]
]

{ #category : #hooks }
BrGlamorousTaggerEditableLook >> onTagRemoved: aTaggerTag at: anIndex [
	self
		tagElementFor: aTaggerTag
		ifFound: [ :aTagElement |
			aTagElement hasFocus
				ifTrue: [
					anIndex = 1
						ifFalse: [ aTagElement focusPrevious ]
						ifTrue: [ aTagElement focusNext ] ].
			
			tagElements remove: aTagElement.
			self removeTagElement: aTagElement withSeparatorAt: anIndex ]
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

{ #category : #private }
BrGlamorousTaggerEditableLook >> removeTagElement: aTagElement withSeparatorAt: aTagIndex [
	| aSeparatorIndex |

	aTagElement removeFromParent.
	
	aSeparatorIndex := self separatorChildIndexFor: aTagIndex.
	aSeparatorIndex isZero
		ifFalse: [ tags removeChildAt: aSeparatorIndex ]
]

{ #category : #'api - requests' }
BrGlamorousTaggerEditableLook >> requestAddTag: aTaggerTag from: aTagCreatorElement [
	"I request the tagger to add a new tag while handling possible errors"
	
	[
		self giveFocusToNewTagDuring: [ self dispatchEvent: (BrTaggerAddTagRequest new tag: aTaggerTag) ].
		self
			removeTagElement: aTagCreatorElement
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

{ #category : #'api - style' }
BrGlamorousTaggerEditableLook >> separator: aStencil [
	separatorStencil := aStencil asStencil
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> separatorChildIndexFor: aTagIndex [
	"I compute an index of a separator when we add a new tag with a given index, assuming that a separator is added before the tag"
	<return: #Number>
	
	self hasSeparator
		ifFalse: [ ^ 0 ].

	aTagIndex = 1
		ifTrue: [
			^ tagElements
				ifEmpty: [ 0 ]
				ifNotEmpty: [ 1 ] ].
	
	^ (aTagIndex - 1) * 2
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> separatorForTagElement: aTagElement ifFound: aFoundBlock [
	aTagElement userData
		at: #brickTaggerSeparator
		ifPresent: aFoundBlock
]

{ #category : #private }
BrGlamorousTaggerEditableLook >> tagChildIndexFor: aTagIndex [
	<return: #Number>
	
	self hasSeparator
		ifFalse: [ ^ aTagIndex ].

	aTagIndex isZero
		ifTrue: [ ^ 0 ].

	aTagIndex = 1
		ifTrue: [ ^ 1 ].
	
	^ (aTagIndex * 2) - 1
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
