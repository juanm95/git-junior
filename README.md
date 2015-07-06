# git-junior
My attempt at some sort of revision control. This creates a folder that is dated and numbered which contains a push and pull folder. Files are copied from a master into the push and pull folders by the user and the user should only change the pull folders.

## Context
I do some work on the side for a web development company. For my first project there wasn't any sort of revision control in place, so I had to receive website files via ftp, make changes, and reupload the files, being careful to make note of changes just in case. Me being still pretty new to git and the extent of things I can do with it, I created a system in which I would create push and pull folders for each change I implemented. Files I wanted to change would be placed into both the pull and push folders, then I would only change the copies in the push folders, keeping the pull folder as a backup. I would then place these folders into a folder dated and numbered (formatted DD-MM--# where the number resets to 1 every day). 

I eventually decided I wanted to automate this process and also learn how to write a batch file, though I soon decided against a batch file and went with powershell scripting because some guy on the internet told me that powershell is where it's at. So I wrote up this little thing which I mostly intended to work in my specific environment but I hope to make into something somewhat generalizable so that anyone can use this if they want to.

## How to use
1. Download the Script.
2. Place the script somewhere.
3. Open up powershell.
4. Type the path of the script followed by the name of the folder within your current working directory where you want to create the folders.
5. Follow prompts for further instructions.

## Future Plans
1. Allow user to type "c" to copy the pull contents to push folder
	* If I want the user to be able to use this multiple times on the same folder I need to be able to keep track of copied contents.
	* I can potentially only prompt the user when a new file in the pull folder has been detected.
2. Open up sublime text to the push folder
	* I can either do this by just assuming the sublime directory is in the PATH variable or give the option to supply the sublime directory.