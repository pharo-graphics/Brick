I handle keystroke-based deletions and must be added to the editor element.

Note: Ideally deletion (#delete and #backspace) should be added as a shortcut to the text editor, however since Morphic does not differenciate between delete and backspace keydown events we have to use this "hacky" way of handling keystroke events instead