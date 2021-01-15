Class {
	#name : #BrSimpleListByScripterExamples,
	#superclass : #Object,
	#traits : 'TBlDevScripterExamples',
	#classTraits : 'TBlDevScripterExamples classTrait',
	#category : #'Brick-Examples-List'
}

{ #category : #'examples - horizontal list' }
BrSimpleListByScripterExamples >> horizontalList [
	<gtExample>
	| aScripter |
	aScripter := self scripterWithElement: [ 
		BrSimpleListExamples new horizontalNumbers ].
		
	aScripter check 
		label: 'Check the first item is number one';
		value: [ :aLabel | aLabel text asString ]
		equals: '1';
		onBreadthFirstChildOfClass: BrHorizontalInfiniteListElement;
		onChildAt: 1.
		
	^ aScripter syncContinue 
]

{ #category : #'examples - horizontal list' }
BrSimpleListByScripterExamples >> scrollHorizontallyHorizontalList_LeftBy [
	<gtExample>
	| aScripter |
	aScripter := self scrollHorizontallyHorizontalList_RightBy.
	
	aScripter substep: 'Scroll horizontally to the left' do: [ :aStep |

		aStep mouseWheel
			leftBy: 5;
			onBreadthFirstChildOfClass: BrHorizontalInfiniteListElement.
			
		aStep wait forEmptySpaceTaskQueueTimeout: 1 second.
		
		aStep check 
			label: 'Check the first item is number one';
			value: [ :aLabel | aLabel text asString ]
			equals: '1';
			onBreadthFirstChildOfClass: BrHorizontalInfiniteListElement;
			onChildAt: 1.
	
	].
		
	^ aScripter syncContinue
]

{ #category : #'examples - horizontal list' }
BrSimpleListByScripterExamples >> scrollHorizontallyHorizontalList_RightBy [
	<gtExample>
	| aScripter |
	aScripter := self horizontalList.
	
	aScripter substep: 'Scroll horizontally to the right' do: [ :aStep |

		aStep mouseWheel
			rightBy: 5;
			onBreadthFirstChildOfClass: BrHorizontalInfiniteListElement.
			
		aStep wait forEmptySpaceTaskQueueTimeout: 1 second.
		
		aStep check 
			label: 'Check the first item is number two';
			value: [ :aLabel | aLabel text asString ]
			equals: '2';
			onBreadthFirstChildOfClass: BrHorizontalInfiniteListElement;
			onChildAt: 1.
		
	].
		
	^ aScripter syncContinue
]

{ #category : #'examples - vertical list' }
BrSimpleListByScripterExamples >> scrollVerticallyVerticalList_DownBy [
	<gtExample>
	| aScripter |
	aScripter := self verticalList.
	
	aScripter substep: 'Scroll vertically down' do: [ :aStep |

		aStep mouseWheel
			downBy: 5;
			onBreadthFirstChildOfClass: BrInfiniteListElement.
			
		aStep wait forEmptySpaceTaskQueueTimeout: 1 second.
		
		aStep check 
			label: 'Check the first item is number two';
			value: [ :aLabel | aLabel text asString ]
			equals: '2';
			onBreadthFirstChildOfClass: BrInfiniteListElement;
			onChildAt: 1.
		
	].
		
	^ aScripter syncContinue
]

{ #category : #'examples - vertical list' }
BrSimpleListByScripterExamples >> scrollVerticallyVerticalList_UpBy [
	<gtExample>
	| aScripter |
	aScripter := self scrollVerticallyVerticalList_DownBy.
	
	aScripter substep: 'Scroll vertically up' do: [ :aStep |

		aStep mouseWheel
			upBy: 5;
			onBreadthFirstChildOfClass: BrInfiniteListElement.
			
		aStep wait forEmptySpaceTaskQueueTimeout: 1 second.
		
		aStep check 
			label: 'Check the first item is number one';
			value: [ :aLabel | aLabel text asString ]
			equals: '1';
			onBreadthFirstChildOfClass: BrInfiniteListElement;
			onChildAt: 1.
		
	].
		
	^ aScripter syncContinue
]

{ #category : #'examples - vertical list' }
BrSimpleListByScripterExamples >> verticalList [
	<gtExample>
	| aScripter |
	aScripter := self scripterWithElement: [ 
		BrSimpleListExamples new verticalNumbers ].
		
	aScripter check 
		label: 'Check the first item is number one';
		value: [ :aLabel | aLabel text asString ]
		equals: '1';
		onBreadthFirstChildOfClass: BrInfiniteListElement;
		onChildAt: 1.
		
	^ aScripter syncContinue
]
