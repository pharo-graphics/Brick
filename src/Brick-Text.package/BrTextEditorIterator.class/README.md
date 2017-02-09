I am a lazy subject iterator. My task is to help Editor to create and access segments by index.
We don't know what data structure subject is using, so we have to bulk load pieces of subject and provide by-index access.

In most cases users concentrate on one piece of data during editing and switch context less often than we render or layout it.

I do not expose segments collection to the outer world as part of information hiding protocol (we don't want to let users mess with segments, they are in most casese for internal use only)