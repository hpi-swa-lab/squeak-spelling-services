| ispellPath |
ispellPath := [FileDirectory default
    readOnlyFileNamed: 'where-is-ispell.txt'
    do: [:file | file contents]]
        on: FileDoesNotExistException
        do: [].
Transcript showln: 'ispellPath: '; show: ispellPath; flag: #debug.
ispellPath isEmptyOrNil ifTrue: [^ self].

Transcript showln: ('Setting ispell binary path to "{1}".' format: {ispellPath}).
IspellSpellingInterface binaryPath: ispellPath.
