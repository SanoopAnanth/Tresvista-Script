# This repository is to store all the script that possibly used by my employeer company (which I don't want to disclose).
### This script is suitable to run when screen size is set to 100%

Follwoing are the steps involved to run this script:

`git clone https://github.com/SanoopAnanth/Tresvista-Script.git `

* The above command is used to clone the git repo, after that open the particular file in powershell or vs code in administrator privilages.

* It is preferred to use powershell

* make sure your display size is set to 100%, to change this go to settings and search display size -> change it to 100% from recommended size.
* This script minimizes the application in background, so chances are that huge file containing application might crash. Make sure to save those kind of applicaions.
* First run the [Reset_permission](Reset_permission.ps1) and make sure the permissions to run the script is changed from Restricted to Remote.
* Now run [Resize_Script](Resize_Script.ps1).
* The applications will be minimized and arranged in the layout such that it can be viwed in single screen.


## Note:
The following changes to be made yet:
* Arrangement of "Internet Options/Internet controller" file.
* Arrangement of "netwrix" application.
* Script to take a screen shot (script is ready but above goals to be achieved first).
