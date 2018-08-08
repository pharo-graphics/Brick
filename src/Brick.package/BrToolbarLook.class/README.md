! ToolbarLook

!! Toolbar Order-Independent Item Binding 

You may noticed that ${method:ToolbarLook>>#initialize|preview}$ initialize ==item== instance variable as an ${class:OrderedDictionary}$. The reason for the ordered dictionary is to allow order-independent binding of toolbar view (${class:BrToolbarItem}$) to the tab model ${class:BrToolbarItemModel}$. To understand it easily, let's check the following excercise: 

First, we create and inspect a ${class:BrToolbar}$ instance:

[[[
toolbar := BrToolbar new.
toolbar look: BrToolbarLook + BrLayoutLook linearHorizontal matchParent.
]]]

Please, inspect the result in order to observe changes while executing the following code snippets.

Second, we create three toolbar items (${class:BrToolbarItemModel}$):

[[[
item1 := BrToolbarItemModel new.
toolbar viewModel addItem: item1.

item2 := BrToolbarItemModel new.
toolbar viewModel addItem: item2.

item3 := BrToolbarItemModel new.
toolbar viewModel addItem: item3.
]]]


Third, we attach a view ${class:BlElement}$ to the second view model:

[[[
BlElement new
	size: 70@40;
	background: Color blue;
	viewModel: item2.
]]]

Fourth, we attach a view ${class:BlElement}$ to the third view model. Notice, that it will be added after the second (blue color) element:

[[[	
BlElement new
	size: 70@40;
	background: Color red;
	viewModel: item3.
]]]

Finaly, we attach a view ${class:BlElement}$ to the first view model. Notice, that it will be added before the second (blue color) element:

[[[
BlElement new
	size: 70@40;
	background: Color green;
	viewModel: item1.
]]]

So, you should end up with three toolbar item views with the the following order: green, blue, red. 
NOTE: It would be nice to explain, why this order-independed feature is important.
