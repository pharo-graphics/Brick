Class {
	#name : #BrTextEditorLineSplitterExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples'
}

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> beReplaceTextAttribute [
	<gtExample>
	^ BrTextAdornmentDynamicAttribute new
		beReplace;
		stencil: [ BlElement new 
			size: 10@10; 
			background: Color lightGray ]
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> beReplaceTextAttributeReturningEmptyCollection [
	<gtExample>
	^ BrTextAdornmentDynamicAttribute new
		beReplace;
		stencil: [ #() ]
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> beReplaceTextAttributeReturningTwoElements [
	<gtExample>
	^ BrTextAdornmentDynamicAttribute new
		beReplace;
		stencil: [ 
			{ BlElement new 
				size: 10@10; 
				background: Color lightGray.
			 BlElement new 
				size: 10@10; 
				background: Color gray } ]
]

{ #category : #'examples - split subtext' }
BrTextEditorLineSplitterExamples >> splitSub_Hello_from_HabaHelloFoo [
	<gtExample>
	| aText aSubText aSplitter aStream |

	aText := 'HabaHelloFoo' asRopedText.
	aSubText := aText from: 5 to: 9.

	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aSubText in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 5.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_BeReplacedTextAtributeReturningEmptyCollection_FollowedByLf [
	<gtExample>
	| aText aSplitter aStream aTextAttribute theAttributes |

	aTextAttribute := self beReplaceTextAttributeReturningEmptyCollection.
	aText := 'Hello' asRopedText attribute: aTextAttribute.
	
	self assert: aText size equals: 5.
	theAttributes := (aText from: aText size to: aText size) iterator attributes.
	self assert: theAttributes size equals: 1.
	self assert: theAttributes first equals: aTextAttribute.

	aText insertString: String lf at: aText size.
	self assert: aText size equals: 6.
	theAttributes := (aText from: aText size to: aText size) iterator attributes.
	self assert: theAttributes size equals: 1.
	self assert: theAttributes first equals: aTextAttribute.
	
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 2.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 5.
	
	self assert: aStream segments second textStart equals: 6.
	self assert: aStream segments second textEnd equals: 6.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_BeReplacedTextAtributeReturningTwoElements_FollowedByLf [
	<gtExample>
	| aText aSplitter aStream aTextAttribute theAttributes |

	aTextAttribute := self beReplaceTextAttributeReturningTwoElements.
	aText := 'Hello' asRopedText attribute: aTextAttribute.
	
	self assert: aText size equals: 5.
	theAttributes := (aText from: aText size to: aText size) iterator attributes.
	self assert: theAttributes size equals: 1.
	self assert: theAttributes first equals: aTextAttribute.

	aText insertString: String lf at: aText size.
	self assert: aText size equals: 6.
	theAttributes := (aText from: aText size to: aText size) iterator attributes.
	self assert: theAttributes size equals: 1.
	self assert: theAttributes first equals: aTextAttribute.
	
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 2.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 5.
	
	self assert: aStream segments second textStart equals: 6.
	self assert: aStream segments second textEnd equals: 6.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_BeReplacedTextAtribute_FollowedByLf [
	<gtExample>
	| aText aSplitter aStream aTextAttribute theAttributes |

	aTextAttribute := self beReplaceTextAttribute.
	aText := 'Hello' asRopedText attribute: aTextAttribute.
	
	self assert: aText size equals: 5.
	theAttributes := (aText from: aText size to: aText size) iterator attributes.
	self assert: theAttributes size equals: 1.
	self assert: theAttributes first equals: aTextAttribute.

	aText insertString: String lf at: aText size.
	self assert: aText size equals: 6.
	theAttributes := (aText from: aText size to: aText size) iterator attributes.
	self assert: theAttributes size equals: 1.
	self assert: theAttributes first equals: aTextAttribute.
	
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 2.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 5.
	
	self assert: aStream segments second textStart equals: 6.
	self assert: aStream segments second textEnd equals: 6.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_Cr [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := String cr asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 2.

	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment textEndDelimited equals: 1.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 1.
	self assert: aSegment textEndDelimited equals: 1.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_CrCr [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := (String cr, String cr) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 3.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment textEndDelimited equals: 1.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 1.
	self assert: aSegment textEndDelimited equals: 2.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments third.
	self assert: aSegment textStart equals: 2.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment textEndDelimited equals: 2.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_CrLf [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := (String cr, String lf) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 2.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment textEndDelimited equals: 2.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 2.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment textEndDelimited equals: 2.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_CrLfCrLf [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := (String cr, String lf, String cr, String lf) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 3.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment textEndDelimited equals: 2.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 2.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment textEndDelimited equals: 4.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments third.
	self assert: aSegment textStart equals: 4.
	self assert: aSegment textEnd equals: 4.
	self assert: aSegment textEndDelimited equals: 4.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_Cra [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := (String cr, 'a') asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 2.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment text asString equals: 'a'.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_CraCr [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := (String cr, 'a', String cr) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 3.

	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment text asString equals: 'a'.
	
	aSegment := aStream segments third.
	self assert: aSegment textStart equals: 3.
	self assert: aSegment textEnd equals: 3.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_CraCrLf [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := (String cr, 'a', String cr, String lf) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 3.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment text asString equals: 'a'.
	
	aSegment := aStream segments third.
	self assert: aSegment textStart equals: 4.
	self assert: aSegment textEnd equals: 4.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_CraCrLfb [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := (String cr, 'a', String cr, String lf, 'b') asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 3.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment text asString equals: 'a'.
	
	aSegment := aStream segments third.
	self assert: aSegment textStart equals: 4.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment text asString equals: 'b'.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_CraCrLfbLf [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := (String cr, 'a', String cr, String lf, 'b', String lf) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 4.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment textEndDelimited equals: 1.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment textEndDelimited equals: 4.
	self assert: aSegment text asString equals: 'a'.
	
	aSegment := aStream segments third.
	self assert: aSegment textStart equals: 4.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textEndDelimited equals: 6.
	self assert: aSegment text asString equals: 'b'.
	
	aSegment := aStream segments fourth.
	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 6.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_Hello [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := 'Hello' asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 1.

	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment text asString equals: 'Hello'.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_HelloCrBeautifulCrWorldWithReplacement [
	<gtExample>
	| aText aSplitter aStream |

	aText := ('Hello', String cr, 'World') asRopedText.
	(aText from: 4 to: 8) replacingAdornment: [ BlElement new size: 6@6; background: Color red ].

	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 11.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_HelloCrBeautifulCrWorldWithReplacementAndAppending [
	<gtExample>
	| aText aSplitter aStream |

	aText := ('Hello', String cr, 'World') asRopedText.
	(aText from: 4 to: 8)
		replacingAdornment: [ BlElement new size: 6@6; background: Color red ];
		appendingAdornment: [ BlElement new size: 6@6; background: Color blue ].

	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 11.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_HelloCrWorldWithReplacement [
	<gtExample>
	| aText aSplitter aStream |

	aText := ('Hello', String cr, 'World') asRopedText.
	(aText from: 4 to: 8) replacingAdornment: [ BlElement new size: 6@6; background: Color red ].

	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 11.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_HelloSpaceWorldWithReplacementOfSpace [
	<gtExample>
	| aText aSplitter aStream |

	aText := ('Hello World') asRopedText.
	(aText from: 5 to: 7) replacingAdornment: [ BlElement new size: 6@6; background: Color red ].

	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 11.

	^ aStream
]

{ #category : #'examples - split subtext' }
BrTextEditorLineSplitterExamples >> split_Hello_from_HabaHelloFoo [
	<gtExample>
	| aText aSplitter aStream |

	aText := 'HabaHelloFoo' asRopedText.

	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: (aText from: 5 to: 9) in: aStream.

	self assert: aStream segments size equals: 1.
	self assert: aStream segments first textStart equals: 0.
	self assert: aStream segments first textEnd equals: 5.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_a [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := ('a') asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 1.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 1.
	self assert: aSegment text asString equals: 'a'.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_empty [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := '' asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.
	
	aSplitter split: aText in: aStream.
	
	self assert: aStream segments size equals: 1.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - split' }
BrTextEditorLineSplitterExamples >> split_haCrCrbaCr [
	<gtExample>
	| aText aSplitter aStream aSegment |

	aText := ('ha', String cr, String cr, 'ba', String cr) asRopedText.
	aSplitter := self textLineSplitter.
	aStream := self textSegmentStream.

	aSplitter split: aText in: aStream.

	self assert: aStream segments size equals: 4.
	
	aSegment := aStream segments first.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 2.
	self assert: aSegment text asString equals: 'ha'.
	
	aSegment := aStream segments second.
	self assert: aSegment textStart equals: 3.
	self assert: aSegment textEnd equals: 3.
	self assert: aSegment text asString equals: ''.
	
	aSegment := aStream segments third.
	self assert: aSegment textStart equals: 4.
	self assert: aSegment textEnd equals: 6.
	self assert: aSegment text asString equals: 'ba'.
	
	aSegment := aStream segments fourth.
	self assert: aSegment textStart equals: 7.
	self assert: aSegment textEnd equals: 7.
	self assert: aSegment text asString equals: ''.

	^ aStream
]

{ #category : #'examples - instance creation' }
BrTextEditorLineSplitterExamples >> textLineSplitter [
	<gtExample>

	^ BrTextEditorLineSplitter new
]

{ #category : #'examples - instance creation' }
BrTextEditorLineSplitterExamples >> textSegmentStream [
	<gtExample>

	^ BrEditorSegmentStream new
]
