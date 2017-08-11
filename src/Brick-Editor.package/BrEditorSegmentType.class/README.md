I represent a segment type and is responsible for creating a segment holder of desired type.

We don't want to restrict text editor to work only with one  type of segments. In order to support multiple segment types override ===BrTextEditor>>#itemTypeAt:=== and return a custom type for a segment at an index.