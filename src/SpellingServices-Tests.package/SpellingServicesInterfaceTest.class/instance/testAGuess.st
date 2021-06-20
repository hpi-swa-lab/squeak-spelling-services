running
testAGuess
	| s chk |

	s := spelling getGuesses: Character alphabet.
	self should: [s isEmpty].
	s := spelling getGuesses: 'recieve'.
	chk := s collect: [:e | e asString].
	self should: [chk includes: 'receive'].
	self should: [chk size > 1].

	