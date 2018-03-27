examples - alignment
ribbonWithCenterAlignmentInFrameLayout
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