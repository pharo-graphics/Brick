I represent a single segment of a subject within editor.
(https://raw.githubusercontent.com/syrel/Editor/master/images/Editor-Segments.png)

I consist of multimple === items===.
I know the original ===BrEditorBuilder=== that was responsible for my creation.
Note, that not necessarily all items belong to the same builder, that is why we store items as a dictionary (builder -> items).

All segments are collected by and stored in ===BrEditorSegmentCollector===