Class {
	#name : #BrGlamorousTaggerSelectableAptitude,
	#superclass : #BrGlamorousTaggerAptitude,
	#instVars : [
		'allowedTags',
		'addButton'
	],
	#category : #'Brick-Glamorous-Tagger'
}

{ #category : #private }
BrGlamorousTaggerSelectableAptitude >> addErrorOverlayTo: aTagElement [
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
BrGlamorousTaggerSelectableAptitude >> addTagCreatorElement: aTagPrototype [
	self
		addTagElement: (self newTagCreatorElement: aTagPrototype)
		withSeparatorAt: tagElements size + 1
]

{ #category : #initialization }
BrGlamorousTaggerSelectableAptitude >> defaultTagLabelStencil [
	^ [ :aTag |
		BrEditableLabel new
			aptitude: BrGlamorousEditableLabelAptitude new glamorousRegularFontAndSize;
			text: aTag name ] asStencilBuilder: BrTaggerTagStencilBuilder
]

{ #category : #'hooks - errors' }
BrGlamorousTaggerSelectableAptitude >> handleAcceptError: anError from: aTagCreatorElement [
	anError description traceCr.

	aTagCreatorElement switchToEditor.

	self addErrorOverlayTo: aTagCreatorElement
]

{ #category : #'hooks - errors' }
BrGlamorousTaggerSelectableAptitude >> handleRemoveError: anError from: aTagElement [
	anError description traceCr.

	self addErrorOverlayTo: aTagElement
]

{ #category : #'hooks - errors' }
BrGlamorousTaggerSelectableAptitude >> handleRenameError: anError to: aNewName from: aTagElement [
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
BrGlamorousTaggerSelectableAptitude >> initialize [
	super initialize.
	
	allowedTags := BrTaggerAllowedAnyTags new.
	tags addChild: (addButton := self newAddTagButton).
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerSelectableAptitude >> newAddAllowedTagsChooser: aCollectionOfTags [
	^ self
		newAllowedTagsChooser: aCollectionOfTags
		whenChosen:  [ :aTagPrototype | self addTagCreatorElement: aTagPrototype ]
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerSelectableAptitude >> newAddAnyTagButton [
	"Create an add button that instantiates tags of any type"
	<return: #BrButton>

	^ self newBasicAddTagButton
		action: [ :aButton | self addTagCreatorElement: (BrTaggerTag new) ];
		addShortcut: (BlShortcutWithAction new
			combination: BlKeyCombination return;
			action: [ :anEvent | self addTagCreatorElement: (BrTaggerTag new) ])
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerSelectableAptitude >> newAddExplicitTagButton [
	| aDropdownLook |
	
	aDropdownLook := BrGlamorousWithDropdownAptitude
		handle: [
			BrButton new
				aptitude: (BrGlamorousButtonRectangularAptitude new + BrGlamorousButtonIconAptitude new);
				icon: BrGlamorousVectorIcons add;
				beSmallSize;
				hExact: 20 ]
		content: [ self newAddAllowedTagsChooser: allowedTags tags ].
	
	^ self newBasicAddTagButton
		addAptitude: aDropdownLook
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerSelectableAptitude >> newAddTagButton [
	^ allowedTags isAnyAllowed
		ifTrue: [ self newAddAnyTagButton ]
		ifFalse: [ self newAddExplicitTagButton ]
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerSelectableAptitude >> newAllowedTagsChooser: aCollectionOfTags whenChosen: aChosenBlock [
	^ BrSimpleList new
		itemStencil: [
			BrButton new
				hMatchParent;
				aptitude: BrGlamorousLabelAptitude new glamorousRegularFont + (BrInteractiveCommonAptitude new
					default: [ :f | f background: Color transparent ];
					hovered: [ :f | f background: BrGlamorousColors defaultButtonBorderColor ]);
				yourself ];
		itemDataBinder: [ :aButton :eachTag |
			aButton
				label: eachTag asString;
				action: [ :aButtonElement |
					aChosenBlock value: eachTag.
					aButtonElement fireEvent: (BrDropdownHideWish new) ] ];
		items: aCollectionOfTags;
		hFitContent;
		vFitContent
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerSelectableAptitude >> newBasicAddTagButton [
	^ BrButton new
		aptitude:
			(BrGlamorousButtonRectangularAptitude new +
			BrGlamorousButtonIconAptitude new +
			BrGlamorousButtonWithLabelTooltipAptitude new + (BrInteractiveCommonAptitude new
				default: [ :aWidget |
					aWidget
						border: BlBorder empty;
						background: BrGlamorousColors neutralBackgroundColor ];
				hovered: [ :aWidget | aWidget background: BrGlamorousColors neutralBackgroundColor darker ];
				pressed: [ :aWidget | aWidget background: BrGlamorousColors neutralBackgroundColor darker darker ];
				focused: [ :aWidget | aWidget border: (BlBorder paint: BrGlamorousColors focusedEditorBorderColor width: 1) ]));
		icon: BrGlamorousVectorIcons add;
		label: 'Add';
		beSmallSize;
		hExact: 20;
		margin: margin;
		constraintsDo: [ :c | c flow vertical alignCenter ];
		addShortcut: (BlShortcutWithAction new
			combination: BlKeyCombination arrowLeft;
			action: [ :anEvent | anEvent currentTarget previousSiblingDo: [ :anElement | anElement requestFocus ] ])
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerSelectableAptitude >> newTagCreatorElement: aTagPrototype [
	| aNewTagCreator aNewTagEditor |

	aNewTagCreator := BrHorizontalPane new
		addChild: (BrLabel new
			aptitude: BrGlamorousLabelAptitude new;
			text: aTagPrototype).

	aNewTagEditor := (tagLabelStencil tag: aTagPrototype) asElement
		requestFocus;
		switchToEditor;
		padding: (BlInsets top: 5 left: 6 bottom: 5 right: 6);
		margin: margin;
		constraintsDo: [ :c | c flow vertical alignCenter ];
		when: BrEditorAcceptWish do: [ :aWish |
			self
				requestAddTag: (BrTaggerTag named: aWish text asString)
				from: aNewTagCreator ];
		when: BrEditorCancelWish do: [ :anEvent |
			anEvent currentTarget focusPrevious.
			self
				removeTagElement: aNewTagCreator
				withSeparatorAt: tagElements size + 1 ].

	aNewTagEditor navigator
		moveTo: 0;
		apply.

	aNewTagCreator
		addChild: aNewTagEditor;
		fitContent.
		
	^ aNewTagCreator
]

{ #category : #'private - instance creation' }
BrGlamorousTaggerSelectableAptitude >> newTagElementFor: aTaggerTag [
	<return: #BlElement>
	| aNewTagContainer aTagEditorElement aTagPrototypeChangerButton |
	
	aTagPrototypeChangerButton := BrButton new
		beSmallSize;
		aptitude: BrGlamorousButtonWithLabelAndIconAptitude - BrGlamorousButtonExteriorAptitude + (BrInteractiveCommonAptitude new default: [ :w | w background: Color gray ]) + (BrGlamorousWithDropdownAptitude
			handle: [
				BrButton new
					aptitude: (BrGlamorousButtonRectangularAptitude new + BrGlamorousButtonLabelAptitude new + BrGlamorousButtonIconAptitude);
					label: aTaggerTag;
					beSmallSize ]
				content: [ self newAddAllowedTagsChooser: allowedTags tags ]);
		label: aTaggerTag;
		icon: BrGlamorousVectorIcons downwards.

	aNewTagContainer := BrHorizontalPane new
		alignCenter;
		addChild: aTagPrototypeChangerButton.

	aTagEditorElement := (tagLabelStencil tag: aTaggerTag) asElement
		margin: margin;
		when: BrEditorAcceptWish do: [ :aWish |
			self
				requestRenameTag: aTaggerTag
				to: aWish text asString
				from: aWish currentTarget ];
		whenKey: BlKeyCombination backspace
			labelDo: [ :aShortcutEvent :aShortcut |
				self
					requestRemoveTag: aTaggerTag
					from: aShortcutEvent currentTarget ].
			
	aNewTagContainer
		addChild: aTagEditorElement;
		fitContent.
		
	^ aNewTagContainer
]

{ #category : #hooks }
BrGlamorousTaggerSelectableAptitude >> onAllowedTagsChanged: theAllowedTags [
	allowedTags := theAllowedTags.
	tags replaceChild: addButton with: (addButton := self newAddTagButton)
]

{ #category : #private }
BrGlamorousTaggerSelectableAptitude >> removeTagCreatorElement: aTagCreatorElement withSeparatorAt: aTagIndex [
	| aSeparatorIndex |

	aTagCreatorElement removeFromParent.
	
	aSeparatorIndex := self separatorChildIndexFor: aTagIndex.
	aSeparatorIndex > 2
		ifTrue: [ tags removeChildAt: aSeparatorIndex ]
]

{ #category : #'api - requests' }
BrGlamorousTaggerSelectableAptitude >> requestAddTag: aTaggerTag from: aTagCreatorElement [
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
BrGlamorousTaggerSelectableAptitude >> requestRemoveTag: aTaggerTag from: aTagCreatorElement [
	
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
BrGlamorousTaggerSelectableAptitude >> requestRenameTag: aTaggerTag to: aNewName from: aTagElement [
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
