use v6.c;
unit class Grammar::Semver:ver<0.0.1>;

grammar Semver is export {
	token TOP {[
		  <version-core>
		| <version-core> '-' <pre-release>
		| <version-core> '+' <build>
		| <version-core> '-' <pre-release> '+' <build>
	]}

	token version-core { <major> '.' <minor> '.' <patch> }

	token major { <numeric-identifier> }
	token minor { <numeric-identifier> }
	token patch { <numeric-identifier> }
	token pre-release { <dot-separated-pre-release-identifiers> }

	token dot-separated-pre-release-identifiers {[
		  <pre-release-identifier>
		| <pre-release-identifier> '.' <dot-separated-pre-release-identifiers>
	]}

	token build { <dot-separated-build-identifiers> }

	token dot-separated-build-identifiers {[
		  <build-identifier>
		| <build-identifier> '.' <dot-separated-build-identifiers>
	]}

	token pre-release-identifier {[
		  <alphanumeric-identifier>
		| <numeric-identifier>
	]}

	token build-identifier {[
		  <alphanumeric-identifier>
		| <digits>
	]}

	token alphanumeric-identifier {[
		  <non-digit>
		| <non-digit> <identifier-characters>
		| <identifier-characters> <non-digit>
		| <identifier-characters> <non-digit> <identifier-characters>
	]}

	token numeric-identifier {[
		  "0"
		| <positive-digit>
		| <positive-digit> <digits>
	]}

	token identifier-characters {[
		  <identifier-character>
		| <identifier-character> <identifier-characters>
	]}

	token identifier-character {[
		  <digit>
		| <non-digit>
	]}

	token non-digit {[
		  <letter>
		| "-"
	]}

	token digits {[
		  <digit>
		| <digit> <digits>
	]}

	token digit {[
		  "0"
		| <positive-digit>
	]}

	token positive-digit {[
		"1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"
	]}

	token letter {[
		  "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J"
		| "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T"
		| "U" | "V" | "W" | "X" | "Y" | "Z" | "a" | "b" | "c" | "d"
		| "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n"
		| "o" | "p" | "q" | "r" | "s" | "t" | "u" | "v" | "w" | "x"
		| "y" | "z"
	]}
}
