examples - alignment
ribbonWithCenterAlignmentInFrameLayoutThenLinearVertical
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