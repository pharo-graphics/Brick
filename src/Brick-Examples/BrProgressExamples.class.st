"
I exemplify ${class:BrProgress}$.
See also ${class:BrGlamorousProgressExamples}$ for glamorous examples.

!! Static Progress Bar

${example:BrProgressExamples>>#barOnly|codeExpanded=false|previewExpanded=true|previewHeight=180}$

!! Animated Progress Bar

${example:BrProgressExamples>>#animatedBar|codeExpanded=false|previewExpanded=true|previewHeight=180}$

!! Progress Bar With Text Above

${example:BrProgressExamples>>#barAndTextAbove|codeExpanded=false|previewExpanded=true|previewHeight=180}$

!! Animated Progress Bar With Text Above

${example:BrProgressExamples>>#animatedBarAndTextAbove|codeExpanded=false|previewExpanded=true|previewHeight=180}$

!! Progress Bar With Text Inside

${example:BrProgressExamples>>#barAndTextInside|codeExpanded=false|previewExpanded=true|previewHeight=180}$

!! Progress Bar With Text Below

${example:BrProgressExamples>>#barAndTextBelow|codeExpanded=false|previewExpanded=true|previewHeight=180}$

"
Class {
	#name : #BrProgressExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Progress'
}

{ #category : #'examples - bar and text compositions' }
BrProgressExamples >> animatedBar [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		look: self animatedBarLook.
	self assert: aProgress childrenCount equals: 1.
	self assert: aProgress children first layout class equals: BlFrameLayout.
	self assert: aProgress children first childrenCount equals: 1.
	self assert: aProgress children first children first constraints frame horizontal weight equals: 0.3.
	^ aProgress
]

{ #category : #'examples - bar and text compositions' }
BrProgressExamples >> animatedBarAndTextAbove [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		look: self textLook + self animatedBarLook.
	self assert: aProgress childrenCount equals: 2.
	self assert: aProgress children second layout class equals: BlFrameLayout.
	self assert: aProgress children second childrenCount equals: 1.
	self assert: aProgress children second children first constraints frame horizontal weight equals: 0.3.
	self assert: aProgress children first text asString equals: 'Out of 100%, 30% transfered'.
	^ aProgress
]

{ #category : #'examples - looks' }
BrProgressExamples >> animatedBarLook [
	<gtExample>
	^ BrProgressAnimatedBarLook new
			beGradientAnimationBaseColor: Color white highlightColor: Color blue muchLighter;
			barDo: [ :aBar | 
				aBar background: Color blue.
				aBar geometry: (BlRectangle cornerRadius: 8).
				aBar constraintsDo: [ :c | 
					c vertical exact: 20 ] ];
			containerDo: [ :aBarContainer | 
				aBarContainer geometry: (BlRectangle cornerRadius: 8) ]
]

{ #category : #'examples - text formats' }
BrProgressExamples >> asIsValues [
	<gtExample>
	| aProgress |
	aProgress := self barAndTextInside.
	aProgress amount: 300 * 1024 / 13 total: 8 * 1024 * 1024.
	aProgress patternLabel: '{1} out of {2} bytes downloaded'.
	aProgress asIsValues.
	self assert: aProgress label asString equals: '(307200/13) out of 8388608 bytes downloaded'.
	^ aProgress
]

{ #category : #'examples - bar and text compositions' }
BrProgressExamples >> barAndTextAbove [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		look: self textLook + self barLook.
	self assert: aProgress childrenCount equals: 2.
	self assert: aProgress children second layout class equals: BlFrameLayout.
	self assert: aProgress children second childrenCount equals: 1.
	self assert: aProgress children second children first constraints frame horizontal weight equals: 0.3.
	self assert: aProgress children first text asString equals: 'Out of 100%, 30% transfered'.
	^ aProgress
]

{ #category : #'examples - bar and text compositions' }
BrProgressExamples >> barAndTextBelow [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		look: self barLook + self textLook.
	self assert: aProgress childrenCount equals: 2.
	self assert: aProgress children first layout class equals: BlFrameLayout.
	self assert: aProgress children first childrenCount equals: 1.
	self assert: aProgress children first children first constraints frame horizontal weight equals: 0.3.
	self assert: aProgress children second text asString equals: 'Out of 100%, 30% transfered'.
	^ aProgress
]

{ #category : #'examples - bar and text compositions' }
BrProgressExamples >> barAndTextInside [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress 
		layout: BlLinearLayout new;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		look: self barLook + (self textLook 
			foreground: Color white;
			labelDo: [ :aLabel | 
				aLabel constraintsDo: [ :c | 
					c ignoreByLayout ] ]).
	self assert: aProgress childrenCount equals: 2.
	self assert: aProgress children first layout class equals: BlFrameLayout.
	self assert: aProgress children first childrenCount equals: 1.
	self assert: aProgress children first children first constraints frame horizontal weight equals: 0.3.
	self assert: aProgress children second text asString equals: 'Out of 100%, 30% transfered'.
	self assert: aProgress children second constraints ignoredByLayout.
	^ aProgress
]

{ #category : #'examples - looks' }
BrProgressExamples >> barLook [
	<gtExample>
	^ BrProgressBarLook new
			barDo: [ :aBar | 
				aBar background: Color blue.
				aBar geometry: (BlRectangle cornerRadius: 8).
				aBar constraintsDo: [ :c | 
					c vertical exact: 20 ] ];
			containerDo: [ :aBarContainer | 
				aBarContainer background: Color blue muchLighter.
				aBarContainer geometry: (BlRectangle cornerRadius: 8) ]
]

{ #category : #'examples - bar and text compositions' }
BrProgressExamples >> barOnly [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress 
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		look: self barLook.
	self assert: aProgress childrenCount equals: 1.
	self assert: aProgress children first layout class equals: BlFrameLayout.
	self assert: aProgress children first childrenCount equals: 1.
	self assert: aProgress children first children first constraints frame horizontal weight equals: 0.3.
	^ aProgress
]

{ #category : #'examples - paint stencils' }
BrProgressExamples >> basicGradientPaintStencil [
	<gtExample>
	| aPaint |
	aPaint := BrProgressGradientPaintStencil new.
	self assert: aPaint stop isNumber.
	self assert: aPaint step isNumber.
	self assert: aPaint startColor isNotNil.
	self assert: aPaint stopColor isNotNil.
	^ aPaint
]

{ #category : #'examples - paint stencils' }
BrProgressExamples >> blueGradientPaintStencil [
	<gtExample>
	| aPaint |
	aPaint := self basicGradientPaintStencil.
	aPaint startColor: Color green.
	aPaint stopColor: Color blue.
	self assert: aPaint startColor equals: Color green.
	self assert: aPaint stopColor equals: Color blue.
	^ aPaint
]

{ #category : #'examples - text formats' }
BrProgressExamples >> fileSizeValues [
	<gtExample>
	| aProgress |
	aProgress := self barAndTextInside.
	aProgress amount: 300 total: 8 * 1024 * 1024.
	aProgress patternLabel: '{1} out of {2} has been downloaded'.
	aProgress fileSizeLabelValues.
	self assert: aProgress label asString equals: '300 bytes out of 8192 KB has been downloaded'.
	^ aProgress
]

{ #category : #'examples - text formats' }
BrProgressExamples >> fixedLabel [
	<gtExample>
	| aProgress |
	aProgress := self barAndTextInside.
	aProgress amount: 1024 * 1024 total: 8 * 1024 * 1024.
	aProgress fixedLabel: 'downloading...'.
	self assert: aProgress label asString equals: 'downloading...'.
	^ aProgress
]

{ #category : #'examples - text formats' }
BrProgressExamples >> floatValues [
	<gtExample>
	| aProgress |
	aProgress := self barAndTextInside.
	aProgress amount: 300 total: 8 * 1024.
	aProgress patternLabel: '{1} kbytes out of {2} kbytes'.
	aProgress floatLabelValuesWithDecimals: 1.
	self assert: aProgress label asString equals: '300.0 kbytes out of 8192.0 kbytes'.
	^ aProgress
]

{ #category : #'examples - text formats' }
BrProgressExamples >> integerValues [
	<gtExample>
	| aProgress |
	aProgress := self barAndTextInside.
	aProgress amount: 300 * 1024 / 13 total: 8 * 1024 * 1024.
	aProgress patternLabel: '{1} out of {2} bytes downloaded'.
	aProgress integerLabelValues.
	self assert: aProgress label asString equals: '23630 out of 8388608 bytes downloaded'.
	^ aProgress
]

{ #category : #'examples - basic widget' }
BrProgressExamples >> progress [
	<gtExample>
	| aProgress |
	aProgress := BrProgress new.
	self assert: aProgress viewModel isNotNil.
	self assert: aProgress childrenCount equals: 0.
	self assert: aProgress percentage equals: 0.
	self assert: aProgress amount equals: 0.
	self assert: aProgress total equals: 100.
	self assert: aProgress percentage equals: 0.
	self assert: aProgress fraction equals: 0.
	self assert: aProgress label asString equals: 'Preparing...'.
	^ aProgress
]

{ #category : #'examples - model' }
BrProgressExamples >> progressModel [
	<gtExample>
	| aModel |
	aModel := BrProgressModel new.
	self assert: aModel percentage isZero.
	self assert: aModel amount equals: 0.
	self assert: aModel total equals: 100.
	^ aModel
]

{ #category : #'examples - looks' }
BrProgressExamples >> textLook [
	<gtExample>
	^ BrTextLabelLook new 
			foreground: Color lightGray;
			labelDo: [ :aWidget | 
				aWidget constraintsDo: [ :c | 
					c margin: (BlInsets all: 3).
					c linear horizontal alignCenter.
					c ignored horizontal alignCenter.
					c ignored vertical alignCenter ] ]
]

{ #category : #'examples - basic widget' }
BrProgressExamples >> thirtyPercentProgress [
	<gtExample>
	| aProgress |
	aProgress := self progress.
	aProgress percentage: 30.
	aProgress patternLabel: 'Out of {2}%, {1}% transfered'.
	self assert: aProgress percentage equals: 30.
	self assert: aProgress label asString equals: 'Out of 100%, 30% transfered'.
	^ aProgress
]

{ #category : #'examples - basic widget' }
BrProgressExamples >> thirtyPercentStaticLabelProgress [
	<gtExample>
	| aProgress |
	aProgress := self progress.
	aProgress percentage: 30.
	aProgress fixedLabel: 'Processing...'.
	self assert: aProgress percentage equals: 30.
	self assert: aProgress label asString equals: 'Processing...'.
	^ aProgress
]
