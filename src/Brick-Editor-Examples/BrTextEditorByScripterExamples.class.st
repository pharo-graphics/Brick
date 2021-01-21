Class {
	#name : #BrTextEditorByScripterExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples-By scripter'
}

{ #category : #'click - adornment element' }
BrTextEditorByScripterExamples >> click_adornment_element [
	<gtExample>
	| aScripter |

	aScripter := self scripterWithElement.
	aScripter do
		action: [ :aBrEditor | aBrEditor text: self textWithAdornment ];
		onSelf.
	
	aScripter wait forEmptySpaceTaskQueue.
	
	aScripter click id: #adornment.
	aScripter wait forEmptySpaceTaskQueue.

	aScripter check
		value: [ :aBrTextEditor | aBrTextEditor cursors positions ] equals: #();
		onBrTextEditor.

	aScripter check
		satisfies: [ :aBrEditor | aBrEditor isFocused not ];
		onSelf.

	^ aScripter syncContinue
]

{ #category : #'click - empty' }
BrTextEditorByScripterExamples >> click_empty [
	<gtExample>
	| aScripter |

	aScripter := self scripterWithElement.

	aScripter click onSelf.
	aScripter wait forEmptySpaceTaskQueue.

	aScripter check
		value: [ :aBrTextEditor | aBrTextEditor cursors positions ] equals: #(0);
		onBrTextEditor.

	aScripter check
		satisfies: [ :aBrEditor | aBrEditor isFocused ];
		onSelf.

	^ aScripter syncContinue
]

{ #category : #'instance creation' }
BrTextEditorByScripterExamples >> scripter [
	<gtExample>
	
	^ BlDevScripter new
]

{ #category : #'instance creation' }
BrTextEditorByScripterExamples >> scripterElement [
	<gtExample>

	^ BrEditor new
		look: BrGlamorousRegularEditorLook + BrGlamorousTextAreaSpacingLook;
		matchParent;
		text: '' asRopedText
]

{ #category : #'instance creation' }
BrTextEditorByScripterExamples >> scripterWithElement [
	<gtExample>
	| aScripter |

	aScripter := self scripter.
	aScripter element: self scripterElement.
	aScripter wait forEmptySpaceTaskQueue.
	
	aScripter check
		value: [ :aBrTextEditor | aBrTextEditor cursors positions ] equals: #();
		onBrTextEditor.

	aScripter check
		satisfies: [ :aBrEditor | aBrEditor isFocused not ];
		onSelf.
	
	^ aScripter syncContinue
]

{ #category : #'click - adornment element' }
BrTextEditorByScripterExamples >> textWithAdornment [
	<gtExample>

	^ 'Hello world
Next line with ' asRopedText, ('adornment' asRopedText appendingAdornment: [
	BlElement new
		size: 200@100;
		background: (Color gray alpha: 0.2);
		id: #adornment ]), ' element' asRopedText
]
