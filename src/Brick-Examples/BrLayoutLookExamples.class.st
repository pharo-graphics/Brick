Class {
	#name : #BrLayoutLookExamples,
	#superclass : #Object,
	#category : #'Brick-Examples'
}

{ #category : #'examples - alignment' }
BrLayoutLookExamples >> ribbonContainerElement [
	<gtExample>

	^ BlElement new
		background: Color veryVeryLightGray;
		padding: (BlInsets all: 10);
		geometry: (BlRectangle cornerRadius: 5);
		size: 100@50
]

{ #category : #'examples - alignment' }
BrLayoutLookExamples >> ribbonTextElement [
	<gtExample>

	^ BlTextElement new text: 'Hello' asRopedText
]

{ #category : #'examples - alignment' }
BrLayoutLookExamples >> ribbonWithCenterAlignmentInFrameLayout [
	<gtExample>
	| aContainerElement aTextElement |

	aContainerElement := self ribbonContainerElement.
	aTextElement := self ribbonTextElement.

	aContainerElement look: BrLayoutLook frame fitContent.

	"layout look supports layout independent alignment.
	Elements will only be aligned only if parent's layout supports it"
	aTextElement look: (BrLayoutLook fitContent alignCenter).

	aContainerElement addChild: aTextElement.

	self
		assert: aContainerElement layout class
		equals: BlFrameLayout.
		
	self
		assert: aContainerElement constraints horizontal resizer
		equals: BlLayoutResizer fitContent.
		
	self
		assert: aContainerElement constraints vertical resizer
		equals: BlLayoutResizer fitContent.

	self
		assert: aTextElement constraints frame horizontal alignment
		equals: BlElementAlignment horizontal center.

	self
		assert: aTextElement constraints frame vertical alignment
		equals: BlElementAlignment vertical center.
		
	self
		assert: aTextElement constraints horizontal resizer
		equals: BlLayoutResizer fitContent.
		
	self
		assert: aTextElement constraints vertical resizer
		equals: BlLayoutResizer fitContent.

	^ aContainerElement
]

{ #category : #'examples - alignment' }
BrLayoutLookExamples >> ribbonWithCenterAlignmentInFrameLayoutThenLinearVertical [
	<gtExample>
	| aRibbonElement aTextElement |

	aRibbonElement := self ribbonWithCenterAlignmentInFrameLayout.

	"change layout from frame to linear"
	aRibbonElement look linearVertical.

	aTextElement := aRibbonElement children first.

	self
		assert: aRibbonElement layout class
		equals: BlLinearLayout.
		
	self assert: aRibbonElement layout isVertical.
		
	self
		assert: aRibbonElement constraints horizontal resizer
		equals: BlLayoutResizer fitContent.
		
	self
		assert: aRibbonElement constraints vertical resizer
		equals: BlLayoutResizer fitContent.

	self
		assert: aTextElement constraints linear horizontal alignment
		equals: BlElementAlignment horizontal center.
		
	self
		assert: aTextElement constraints linear vertical alignment
		equals: BlElementAlignment vertical center.
		
	self
		assert: aTextElement constraints horizontal resizer
		equals: BlLayoutResizer fitContent.
		
	self
		assert: aTextElement constraints vertical resizer
		equals: BlLayoutResizer fitContent.

	^ aRibbonElement
]

{ #category : #'examples - alignment' }
BrLayoutLookExamples >> ribbonWithCenterAlignmentInLinearHorizontalLayout [
	<gtExample>
	| aContainerElement aTextElement |

	aContainerElement := self ribbonContainerElement.
	aTextElement := self ribbonTextElement.

	aContainerElement look: BrLayoutLook linearHorizontal fitContent.

	"layout look supports layout independent alignment.
	Elements will only be aligned only if parent's layout supports it"
	aTextElement look: (BrLayoutLook fitContent alignCenter).

	aContainerElement addChild: aTextElement.

	self
		assert: aContainerElement layout class
		equals: BlLinearLayout.
		
	self assert: aContainerElement layout isHorizontal.
		
	self
		assert: aContainerElement constraints horizontal resizer
		equals: BlLayoutResizer fitContent.
		
	self
		assert: aContainerElement constraints vertical resizer
		equals: BlLayoutResizer fitContent.

	self
		assert: aTextElement constraints linear horizontal alignment
		equals: BlElementAlignment horizontal center.
		
	self
		assert: aTextElement constraints linear vertical alignment
		equals: BlElementAlignment vertical center.
		
	self
		assert: aTextElement constraints horizontal resizer
		equals: BlLayoutResizer fitContent.
		
	self
		assert: aTextElement constraints vertical resizer
		equals: BlLayoutResizer fitContent.

	^ aContainerElement
]

{ #category : #'examples - alignment' }
BrLayoutLookExamples >> ribbonWithCenterAlignmentInLinearVerticalLayout [
	<gtExample>
	| aContainerElement aTextElement |

	aContainerElement := self ribbonContainerElement.
	aTextElement := self ribbonTextElement.

	aContainerElement look: BrLayoutLook linearVertical fitContent.

	"layout look supports layout independent alignment.
	Elements will only be aligned only if parent's layout supports it"
	aTextElement look: (BrLayoutLook fitContent alignCenter).

	aContainerElement addChild: aTextElement.

	self
		assert: aContainerElement layout class
		equals: BlLinearLayout.
		
	self assert: aContainerElement layout isVertical.
		
	self
		assert: aContainerElement constraints horizontal resizer
		equals: BlLayoutResizer fitContent.
		
	self
		assert: aContainerElement constraints vertical resizer
		equals: BlLayoutResizer fitContent.

	self
		assert: aTextElement constraints linear horizontal alignment
		equals: BlElementAlignment horizontal center.
		
	self
		assert: aTextElement constraints linear vertical alignment
		equals: BlElementAlignment vertical center.
		
	self
		assert: aTextElement constraints horizontal resizer
		equals: BlLayoutResizer fitContent.
		
	self
		assert: aTextElement constraints vertical resizer
		equals: BlLayoutResizer fitContent.

	^ aContainerElement
]
