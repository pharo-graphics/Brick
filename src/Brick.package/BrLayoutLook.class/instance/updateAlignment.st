private
updateAlignment
	| aTargetElement |

	self isAttachedToWidget
		ifFalse: [ ^ self ].

	aTargetElement := self targetElement.
	
	aTargetElement hasParent
		ifFalse: [ ^ self ].
	
	aTargetElement parent layout align: aTargetElement horizontal: self horizontalAlignment.
	aTargetElement parent layout align: aTargetElement vertical: self verticalAlignment