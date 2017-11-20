layout
onMeasure: anExtentMeasurementSpec
	"If I am executed it means that measurement specification changed.
	We have to recreate a text layout with new parameters"
	| aHeightSpec aWidthSpec aMeasuredWidth aMeasuredHeight aMeasuredExtent |
	super onMeasure: anExtentMeasurementSpec.

	self
		assert: [ text isNotNil ]
		description: [ 'Text model must be nil!' ].

	aWidthSpec := anExtentMeasurementSpec widthSpec.
	aHeightSpec := anExtentMeasurementSpec heightSpec.

	(self shouldMeasure: anExtentMeasurementSpec)
		ifTrue: [
			paragraph
				"Create a new text layout"
				ifNil: [ paragraph := self defaultTextParagraph ]
				"or reuse existing"
				ifNotNil: [ paragraph reset ].
						
			paragraph text: self text.
			paragraph measureOn: self defaultOffscreenCanvas.
			paragraph baseline: (paragraph left @ paragraph top) negated ].

	aMeasuredWidth := paragraph width.
	aMeasuredHeight := paragraph height.

	"If measurement spec is exact I must ignore size measured by textLayout"
	aWidthSpec isExact ifTrue: [ 
		aMeasuredWidth := aWidthSpec size ].
	aHeightSpec isExact ifTrue: [ 
		aMeasuredHeight := aHeightSpec size ].

	aMeasuredExtent := aMeasuredWidth @ aMeasuredHeight.

	"Finally set measured extent"
	self measuredExtent: aMeasuredExtent.
	
	self measureCursor: anExtentMeasurementSpec