#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

# Privacy: don’t send search queries to Apple
#defaults write com.apple.Safari UniversalSearchEnabled -bool false
#defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Press Tab to highlight each item on a web page
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

# Show Safari’s bookmarks bar by default
defaults write com.apple.Safari ShowFavoritesBar -bool true

# Hide Safari’s sidebar in Top Sites
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# Disable Safari’s thumbnail cache for History and Top Sites
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

# Enable Safari’s debug menu
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Make Safari’s search banners default to Contains instead of Starts With
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

# Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Disable AutoFill
# defaults write com.apple.Safari AutoFillFromAddressBook -bool false
# defaults write com.apple.Safari AutoFillPasswords -bool false
# defaults write com.apple.Safari AutoFillCreditCardData -bool false
# defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Disable plug-ins
defaults write com.apple.Safari WebKitPluginsEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2PluginsEnabled -bool false

# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

# Disable auto-playing video
#defaults write com.apple.Safari WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.SafariTechnologyPreview WebKitMediaPlaybackAllowsInline -bool false
#defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false
#defaults write com.apple.SafariTechnologyPreview com.apple.Safari.ContentPageGroupIdentifier.WebKit2AllowsInlineMediaPlayback -bool false

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Update extensions automatically
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

###############################################################################
# Mail                                                                        #
###############################################################################

# Disable send and reply animations in Mail.app
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true

# Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"

# Display emails in threaded mode, sorted by date (oldest at the top)
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"

# Disable inline attachments (just show the icons)
# defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
# defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Use a modified version of the Solarized Dark theme by default in Terminal.app
# osascript <<EOD
# tell application "Terminal"
# 	local allOpenedWindows
# 	local initialOpenedWindows
# 	local windowID
# 	set themeName to "Solarized Dark xterm-256color"
# 	(* Store the IDs of all the open terminal windows. *)
# 	set initialOpenedWindows to id of every window
# 	(* Open the custom theme so that it gets added to the list
# 	   of available terminal themes (note: this will open two
# 	   additional terminal windows). *)
# 	do shell script "open '$HOME/init/" & themeName & ".terminal'"
# 	(* Wait a little bit to ensure that the custom theme is added. *)
# 	delay 1
# 	(* Set the custom theme as the default terminal theme. *)
# 	set default settings to settings set themeName
# 	(* Get the IDs of all the currently opened terminal windows. *)
# 	set allOpenedWindows to id of every window
# 	repeat with windowID in allOpenedWindows
# 		(* Close the additional windows that were opened in order
# 		   to add the custom theme to the list of terminal themes. *)
# 		if initialOpenedWindows does not contain windowID then
# 			close (every window whose id is windowID)
# 		(* Change the theme for the initial opened terminal windows
# 		   to remove the need to close them in order for the custom
# 		   theme to be applied. *)
# 		else
# 			set current settings of tabs of (every window whose id is windowID) to settings set themeName
# 		end if
# 	end repeat
# end tell
# EOD

# Enable “focus follows mouse” for Terminal.app and all X11 apps
# i.e. hover over a window and start typing in it without clicking first
#defaults write com.apple.terminal FocusFollowsMouse -bool true
#defaults write org.x.X11 wm_ffm -bool true

# Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Install the Solarized Dark theme for iTerm
# open "${HOME}/init/Solarized Dark.itermcolors"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Time Machine                                                                #
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups (Does not work on High Sierra due to APFS)
# hash tmutil &> /dev/null && sudo tmutil disablelocal

###############################################################################
# Activity Monitor                                                            #
###############################################################################

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Address Book, Dashboard, iCal, TextEdit, and Disk Utility                   #
###############################################################################

# Enable the debug menu in Address Book
defaults write com.apple.addressbook ABShowDebugMenu -bool true

# Enable Dashboard dev mode (allows keeping widgets on the desktop)
defaults write com.apple.dashboard devmode -bool true

# Enable the debug menu in iCal (pre-10.8)
defaults write com.apple.iCal IncludeDebugMenu -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0
# Open and save files as UTF-8 in TextEdit
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Enable the debug menu in Disk Utility
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

# Auto-play videos when opened with QuickTime Player
defaults write com.apple.QuickTimePlayerX MGPlayMovieOnOpen -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

# Enable Debug Menu in the Mac App Store
defaults write com.apple.appstore ShowDebugMenu -bool true

# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# Automatically download apps purchased on other Macs
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1

# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

# Allow the App Store to reboot machine on macOS updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Messages                                                                    #
###############################################################################

# Disable automatic emoji substitution (i.e. use plain text smileys)
# defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Disable smart quotes as it’s annoying for messages that contain code
# defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Disable continuous spell checking
# defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false



###############################################################################
# Transmission.app                                                            #
###############################################################################

# Use `~/Downloads/Downloading` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Downloading"

# Use `~/Downloads` to store completed downloads
defaults write org.m0k.transmission DownloadLocationConstant -bool true

# Don’t prompt for confirmation before downloading
defaults write org.m0k.transmission DownloadAsk -bool false
defaults write org.m0k.transmission MagnetOpenAsk -bool false

# Don’t prompt for confirmation before removing non-downloading active transfers
defaults write org.m0k.transmission CheckRemoveDownloading -bool true

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false

# IP block list.
# Source: https://giuliomac.wordpress.com/2014/02/19/best-blocklist-for-transmission/
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true

# Randomize port on launch
defaults write org.m0k.transmission RandomPort -bool true

#View
# Status bar
defaults write org.m0k.transmission StatusBar -bool true
# Small view
defaults write org.m0k.transmission SmallView -bool true
# Pieces bar
defaults write org.m0k.transmission PiecesBar -bool false
# Pieces bar
defaults write org.m0k.transmission FilterBar -bool true
# Availability
defaults write org.m0k.transmission DisplayProgressBarAvailable -bool false

# Automatic Import
defaults write org.m0k.transmission AutoImport -bool true
defaults write org.m0k.transmission AutoImportDirectory -string "$HOME/Downloads/"

# Disable display window when opening a torrent file
defaults write org.m0k.transmission DownloadAskMulti -bool false
defaults write org.m0k.transmission DownloadAskManual -bool false

###############################################################################
# Twitter.app                                                                 #
###############################################################################

# Disable smart quotes as it’s annoying for code tweets
defaults write com.twitter.twitter-mac AutomaticQuoteSubstitutionEnabled -bool false

# Show the app window when clicking the menu bar icon
defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

# Enable the hidden ‘Develop’ menu
defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

# Open links in the background
defaults write com.twitter.twitter-mac openLinksInBackground -bool true

# Allow closing the ‘new tweet’ window by pressing `Esc`
defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

# Show full names rather than Twitter handles
defaults write com.twitter.twitter-mac ShowFullNames -bool true

# Hide the app in the background if it’s not the front-most window
defaults write com.twitter.twitter-mac HideInBackground -bool true

###############################################################################
# Tweetbot.app                                                                #
###############################################################################

# Bypass the annoyingly slow t.co URL shortener
defaults write com.tapbots.TweetbotMac OpenURLsDirectly -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

# for app in "Activity Monitor" \
# 	"Address Book" \
# 	"Calendar" \
# 	"cfprefsd" \
# 	"Contacts" \
# 	"Dock" \
# 	"Finder" \
# 	"Google Chrome Canary" \
# 	"Google Chrome" \
# 	"Mail" \
# 	"Messages" \
# 	"Opera" \
# 	"Photos" \
# 	"Safari" \
# 	"SizeUp" \
# 	"Spectacle" \
# 	"SystemUIServer" \
# 	"Transmission" \
# 	"Tweetbot" \
# 	"Twitter" \
# 	"iCal";
# 	killall "${app}" &> /dev/null
# done

echo "Done. Note that some of these changes require a logout/restart to take effect."
