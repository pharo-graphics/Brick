examples - ui header
materialGroupHeaderWithBoundTabs
	<gtExample>	
	| aHeaderElement tabElement1 tabElement2 tabElement3 |

	aHeaderElement := self materialGroupHeaderWithoutBoundTabs.

	"binding order does not matter"
	tabElement2 := BlElement new
		look: BrMaterialTabLabelledLook;
		viewModel: aHeaderElement viewModel tabs second.

	self assert: aHeaderElement children asArray equals: { aHeaderElement look header }.
	self assert: aHeaderElement children first children asArray equals: { tabElement2 }.

	tabElement1 := BlElement new
		look: BrMaterialTabLabelledLook;
		viewModel: aHeaderElement viewModel tabs first.
		
	self assert: aHeaderElement children asArray equals: { aHeaderElement look header }.
	self assert: aHeaderElement children first children asArray equals: { tabElement1 . tabElement2 }.

	tabElement3 := BlElement new
		look: BrMaterialTabLabelledLook;
		viewModel: aHeaderElement viewModel tabs third.

	self assert: aHeaderElement children asArray equals: { aHeaderElement look header }.
	self assert: aHeaderElement children first children asArray equals: { tabElement1 . tabElement2 . tabElement3 }.

	^ aHeaderElement