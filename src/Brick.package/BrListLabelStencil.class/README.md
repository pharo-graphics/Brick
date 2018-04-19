I create a label only element to be used within a list widget, both in a simple and columned lists.

[[[
| aStencil anElement |

aStencil := BrListLabelStencil new.
aStencil text: 'List row'.
anElement := aStencil create

]]]