Class {
	#name : #BrTextEditorCachingAdornmentsExamples,
	#superclass : #BrTextEditorAdornmentsExamples,
	#category : #'Brick-Editor-Examples-! Documentation'
}

{ #category : #example }
BrTextEditorCachingAdornmentsExamples >> cacheDictionaryExample [
	<gtExample>
	| cache attribute text |

	cache := Dictionary new.
	
	attribute := BrTextAdornmentDynamicAttribute new
		beAppend;
		withCache: cache key: #key;
		stencil: [
			BlElement new
				background: (Color gray alpha: 0.4);
				size: 200@100 ].

	text := 'Hello' asRopedText attribute: attribute.
			
	^ text
]

{ #category : #example }
BrTextEditorCachingAdornmentsExamples >> cacheValueHolderExample [
	<gtExample>
	| cache attribute text |

	cache := ValueHolder new.
	
	attribute := BrTextAdornmentDynamicAttribute new
		beAppend;
		withCache: cache selector: #contents;
		stencil: [
			BlElement new
				background: (Color gray alpha: 0.4);
				size: 200@100 ].

	text := 'Hello' asRopedText attribute: attribute.

	^ text
]
