Class {
	#name : #BrLayoutResizerExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Layout resizer'
}

{ #category : #'examples - layout resizer' }
BrLayoutResizerExamples >> layoutResizerWithPropagation [
	<gtExample>
	| items widget |

	items := 10 timesCollect: [
	BlElement new
		background: (Color gray alpha: 0.2);
		border: (BlBorder builder dashed paint: Color lightGray; width: 1; build);
		look: (BrLayoutResizerLook new
			hFitContent: [ :anElement | anElement width: 200 atRandom + 50 ]; 
			vFitContent: [ :anElement | anElement height: 30 atRandom + 5 ];
			hMatchParent; "inherit match parent"
			vMatchParent; "inherit match parent"
			hExactToMatchParent; "when inside of the exact parent, the item should match parent"
			vExactToMatchParent) "when inside of the exact parent, the item should match parent" ].

	widget := BlElement new.
	widget look: (BrLayoutResizerLook new inherit).
	widget background: (Color gray alpha: 0.1).
	widget padding: (BlInsets left: 10 right: 10).
	widget layout: (BlLinearLayout vertical cellSpacing: 10).
	widget addChildren: items.

	^ widget.
]
