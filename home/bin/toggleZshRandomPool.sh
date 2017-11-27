#!/bin/bash

# inFile: ~/.zshrc
# this script toggles 
# ZSH_THEME="random" off/on
# ZSH_RANDOM_CANDIDATES={} on/off
#

#pseudocode
# if ZSH_THEME == OFF # (i.e. the line is commented)
#   # assume ZSH_RANDOM_CANDIDATES_OFF?
#	turnOn(ZSH_THEME)
#   turnOFF(ZSH_RANDOM_CANDIDATES)
# else # ZSH_THEME is ON (i.e. the line is uncommented)
#	# assume ZSH_RANDOM_CANDIDATES is ON?
#   turnOff(ZSH_RANDOM_CANDIDATES)
# 	turnON(ZSH_THEME)

# plan:
# if ZSH THEME == OFF
#  def turnOn(ZSH_THEME):
# 		use sed with replace option (s///) to search for  '# ZSH_THEME=' pattern at start of line
#   		replace it with 'ZSH_THEME='
#  def turnOFF(ZSH_RANDOM_CANDIDATES):
#		use sed with replace option (s///) to search for 'ZSH_RANDOM_CANDIDATES=' at start of line
#			replace it with '# ZSH_RANDOM_CANDIDATES='
# else ZSH THEME == ON
#   def turnOFF(ZSH_THEME):
#		use sed with replace option (s///) to search for  'ZSH_THEME=' pattern at start of line
#   		replace it with '# ZSH_THEME=' 
#  def turnON(ZSH_RANDOM_CANDIDATES):
#		use sed with replace option (s///) to search for '# ZSH_RANDOM_CANDIDATES=' at start of line
#			replace it with 'ZSH_RANDOM_CANDIDATES='

IN_FILE=$HOME/.zshrc
ZSH_THEME_EQUALS=${grep -E '^ZSH_THEME=' $IN_FILE | wc -l }

if [ $ZSH_THEME_EQUALS -eq 0 ]; then 
# ZSH_THEME is off, assuming ZSH_RANDOM_CANDIDATES is ON
	#turnON(ZSH_THEME)
	sed -e 's/^# ZSH_THEME=/ZSH_THEME/' <$IN_FILE >$IN_FILE &
	#turnOFF(ZSH_RANDOM_CANDIDATES)
	sed -e 's/^ZSH_RANDOM_CANDIDATES/ZSH_RANDOM_CANDIDATES/' <$IN_FILE >$IN_FILE
