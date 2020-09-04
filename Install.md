# Installation and configuration

## Requirements
- Windows 7/10 or Windows Server 2012 and above
- if you a new to Git, first read Git basic concepts https://git-scm.com/book/en/v2 available in many languages, or watch explaining videos
- download and install Git for Windows from https://git-scm.com
- when installing Git:
  - set it up to work from any shell (including cmd/powershell)
  - end files with CRLF
  - the most of the settings should remain default for windows installer
- what is recommended (optional):
  - to have tracking system like Jira, TFS, Azure DevOps etc: this will allow to have separate ID per each change request
  - to install additional software for work with changed files with Git: good candidate is Visual Studio Code https://aka.ms/vscode
  - to have file comparison tool like Araxis/Beyond Compare

## Initial setup

### Import
- unzip/clone files
- review the objects ID for conflicts with your `Dev` and `Prod` database objects
- in some cases you would need to convert objects to national encoding
- create a new Text field in `Table 91 "User Setup"` named `"Local Repo Path"` at `Dev` and `Prod` databases
- import objects to `Dev` and `Prod` and compile

### Setup Git repository
- make a new folder on your machine for a Git repository where objects from a `Prod` database will be stored, for example: C:\Cronus2009
- create folders structure using `MakeRepoFolders.bat`
  - open cmd.exe, `cd C:` and run: `MakeRepoFolders.bat "C:\Cronus2009"`
- in both `Dev` and `Prod` databases fill `"Local Repo Path"` field at `"User Setup"` table with path to this repository C:\Cronus2009
- export all NAV objects from `Prod` as separate txt files using `Codeunit 50196 "Export Objects To Folder"`; make sure they have UTF-8 encoding
- put exported files to respective subfolders using `MoveObjectsToRepository.bat`
  - open cmd.exe, call `MoveObjectsToRepository.bat "exported objects folder" "repository path"` 
- put BAT files from this project `.\Tools\CMD` to repository `.\Tools\CMD` subfolder
- setup Git user, initialize a new Git repository for your local repo at C:\Cronus2009
- setup remote for your local Git
  - references: https://git-scm.com/docs/git-init, https://www.atlassian.com/git/tutorials/setting-up-a-repository
- stage, commit and push changes to remote as initial commit
- Repository is now ready