| ispellPath |
ispellPath := [FileDirectory default
    readOnlyFileNamed: 'where-is-ispell.txt'
    do: [:file | file contents]]
        on: FileDoesNotExistException
        do: [].
ispellPath isEmptyOrNil ifTrue: [^ self].

Transcript showln: ('Setting ispell binary path to "{1}".' format: {ispellPath}).
IspellSpellingInterface binaryPath: ispellPath.
