#!/bin/sh

#  install.sh
#  DebugVoiceCommand
#
#  Created by Sachin on 15/10/15.
#  Copyright © 2015 Sachin. All rights reserved.


#!/bin/sh

DOWNLOAD_URI=https://github.com/sachin26thakur/XcodePlugin_ScreenShotPresentation/releases/download/1.0/XCodePaintOverview.tar.gz

PLUGINS_DIR="${HOME}/Library/Application Support/Developer/Shared/Xcode/Plug-ins"

mkdir -p "${PLUGINS_DIR}"
curl -L $DOWNLOAD_URI | tar xvz -C "${PLUGINS_DIR}"

echo "Regards, Sachin Thakur.  Thanks for installing successfully!!!   Please restart your Xcode."
echo "Usage: After restart xcode, Use Command+shift+8 to activate demo preview"
echo "To stop this use Command+shift+9"
echo "Enjoy :)"







