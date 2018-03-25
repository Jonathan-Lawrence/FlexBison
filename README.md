# FlexBison - takes in list of addresses and converts to XML
#
# input.txt - list of postal address seperated by a blank line
# output.txt - postal addresses with its components defined by XML tags 
#
# You can use the Makefile to compile the program
# On the cmdline in the shell, you can use the symbolic links to run the program in two different modes:
#   1) Lexical Analyzer only
#   2) Lexical Analyzer and Grammmar Parser
#
# To run in Lexical Analyzer only mode, use the scanner symbolic link to the program.
#   $ ./scanner < input.txt
# This should display the tokens found in the address file to stdout.
#
# To run in the Lexical Analyzer and Grammar Parser mode, use the parser symbolic link to the program.
#   $ ./parser < input.txt 2> output.txt
# This should write the addresses with XML tags into stderr, which is piped to output.txt
