examples - instance creation
emptyToggleGroupModel
	<gtExample>
	| aToggleGroupModel |
	
	aToggleGroupModel := BrToggleGroupModel new.
	
	self assert: aToggleGroupModel isEmpty.
	self assert: aToggleGroupModel isNotEmpty not.
	self assert: aToggleGroupModel toggles asArray equals: #().
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel isAttachedToWidget not.
	
	^ aToggleGroupModel
	
	