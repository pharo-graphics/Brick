Class {
	#name : #BrTextEditorCachingAdornmentsExamples,
	#superclass : #BrTextEditorAdornmentsExamples,
	#category : #'Brick-Editor-Examples-! Documentation'
}

{ #category : #example }
BrTextEditorCachingAdornmentsExamples >> cacheExample [
	<gtExample>
	| cache text |
	cache := Dictionary new.

	text := ('Hello' asRopedText attribute: (BrTextAdornmentDynamicAttribute new
		beAppend;
		withCache: cache key: #one;
		stencil: [
			BlElement new
				background: (Color random alpha: 0.5);
				size: 200@100 ])),
		String cr asRopedText,
		(String loremIpsum: 2000) asRopedText,
		String cr asRopedText,
		('Brand' asRopedText attribute: (BrTextAdornmentDynamicAttribute new
		beAppend;
		withCache: cache key: #one;
		stencil: [
			BlElement new
				background: (Color random alpha: 0.5);
				size: 200@100 ])),
		String cr asRopedText,
		(String loremIpsum: 2000) asRopedText,
		String cr asRopedText,
		('World' asRopedText attribute: (BrTextAdornmentDynamicAttribute new
		beAppend;
		withCache: cache key: #two;
		stencil: [
			BlElement new
				background: (Color random alpha: 0.5);
				size: 200@100 ])).
			
	^ text
]
