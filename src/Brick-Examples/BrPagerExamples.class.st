Class {
	#name : #BrPagerExamples,
	#superclass : #Object,
	#category : 'Brick-Examples-Pager'
}

{ #category : #example }
BrPagerExamples >> example [
	<gtExample>
	| pager |

	pager := BrPager new.
	pager constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	pager addPage: (BlElement new
		viewModel: BrPagerPageModel new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		background: Color gray).
		
	pager addPage: (BlElement new
		viewModel: BrPagerPageModel new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		background: Color lightGray).
		
	pager addPage: (BlElement new
		viewModel: BrPagerPageModel new;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ];
		background: Color veryLightGray).

	^ pager
]
