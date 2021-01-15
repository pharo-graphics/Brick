Class {
	#name : #BrSimpleListByScripterExamples,
	#superclass : #Object,
	#traits : 'TBlDevScripterExamples',
	#classTraits : 'TBlDevScripterExamples classTrait',
	#category : #'Brick-Examples-List'
}

{ #category : #'examples - vertical list' }
BrSimpleListByScripterExamples >> scrollVerticallyVerticalList [
	<gtExample>
	| aScripter |
	aScripter := self verticalList.
	
	aScripter substep: 'Scroll vertically' do: [ :aStep |

		aStep mouseWheel
			downBy: 5;
			onBreadthFirstChildOfClass: BrInfiniteListElement.
			
		aStep wait forEmptySpaceTaskQueueTimeout: 1 second
		
	].
		
	^ aScripter syncContinue
]

{ #category : #accessing }
BrSimpleListByScripterExamples >> verticalList [
	<gtExample>
	| aScripter |
	aScripter := self scripterWithElement: [ 
		BrSimpleListExamples new verticalNumbers ].
		
	^ aScripter
]
