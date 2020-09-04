# Example

## Assumptions
- you have `Dev` and `Prod` NAV databases
- you have Git repository with root branch containing all objects as txt files
- you have developments made in Codeunit 90 in `Dev` and you want to deploy your changes to `Prod`
- you have Git installed and configured, cloned repo on your local machine, UserSetup table have "Local Repo Path" populated

## Prepare changes 
1. Have a new workitem/ticket in tracking system represensing your change ID. For example: *Change-01*.
2. Make a new git branch for your changes created from the master branch. For example: *bugfix/Change-01-mysuperfix*.
3. Run `Form 50081 "Project Card"` and create a new Project *"Change-01"*, populate line with Codeunit 90, populate Git branch name.
4. Checkout to your branch with Git with powershell console or Visual Studio Code. 
5. Export objects from `Dev` using "Project Card" `Export Objects to Local Repo` button. 
6. Review, commit and push changes to remote.
> You are ready now to create pull request or deploy to `Prod`.

## Deployment
1. Make sure your git is switched to project branch.
2. Export project data using `Export Project to XML`. This will create XML file at .\Tools\ProjectData folder.
3. On `Prod` open "Project Card" and run `Import Project from XML`. This will restore the project on `Prod`, XML is removed.
4. Import objects to `Prod` using `Import Objects from Local Repo` button on "Project Card".
5. Compile objects.
6. Merge your changes with parent branch using source control system (Azure DevOps/BitBucket etc.) or git command line.
> Your project is deployed.