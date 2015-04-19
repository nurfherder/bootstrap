
###############################################################################
# TextEdit.app
###############################################################################
# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Turn off 'smart' editing
defaults write com.apple.TextEdit SmartDashes -int 0
defaults write com.apple.TextEdit SmartQuotes -int 0
defaults write com.apple.TextEdit TextReplacement -int 0

# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

