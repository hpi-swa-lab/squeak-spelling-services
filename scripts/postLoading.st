| directory ispellPath |
directory := FileDirectory on: (SmalltalkCI getEnv: 'GITHUB_WORKSPACE').
FileStream stdout nextPutAll: 'directory: ' , directory asString; cr; flag: #debug.
FileStream stdout nextPutAll: 'directory entries: ' , directory entries asString; cr; flag: #debug.
ispellPath := [directory
    readOnlyFileNamed: 'where-is-ispell.txt'
    do: [:file | file contents]]
        on: FileDoesNotExistException
        do: [].
FileStream stdout nextPutAll: 'ispellPath: ' , ispellPath asString; cr; flag: #debug.
ispellPath isEmptyOrNil ifTrue: [^ self].

FileStream stdout nextPutAll: ('Setting ispell binary path to "{1}".' format: {ispellPath}); cr.
IspellSpellingInterface binaryPath: ispellPath.
