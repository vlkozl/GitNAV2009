# GitNAV2009
Git integration for Microsoft Dynamics NAV 2009

## Description
Introduction to Source Control Management for Navision world has been made in the past many times. For example please take a look on this video: https://youtu.be/HJOsjLXbskc Even for legacy NAV 2009 versions there are some benefits:
 - clear history of changes linked with external tracking systems of Jira/TFS/GitHub
 - ability to make code reviews and get advantages of dev team expertise
 - quick rollbacks
 - no need to work with exported/imported text files/FOBs manually
 - ability to combine changes of multiple requests/tickets into single deployment

Developments for NAV usually include limited number of objects which can be tracked by SCM system like Git as a separate text files. Git use branches to separate changes between epics/tasks/tickets/workitems/developers... Git branch is, in simple words, a "container for changed objects" related to the specific change request. The problem is that NAV development environment does not naturally have any similar data structure. Hence, it should be introduced. 

### C/AL structure
Each development represents a new *Project* record in `Table 50034 Project Header`. Project lines must be populated manually with changed objects. Both header and line records will help maintain changes related only to particular task/ticket/project. So the changed objects can be exported, imported, delivered and deployed within a certain branch only.

File contents:
 - 2 tables: header and lines for storing Project data
 - 3 forms (Document, Subform, List) exposing Project data, allowing to run actions related to the project/Git
 - 2 codeunits: 
   - 50196 export all objects from database to a folder selected considering current license permissions
   - 50198 contains functions required to import/export objects with automatic encoding conversion from national to UTF-8 and vice versa
 - 1 xmlport may be required to transfer project data between computers/developers - optional

### BAT files
 - `.\Install\MakeRepoFolders.bat ` Create folders structure for NAV 2009 repository for all object types
 - `.\Install\MoveObjectsToRepository.bat` Move text objects from NAV database to respective repository subfolders
 - `.\Tools\CMD\CreateTempDirs.bat` Create temporary folders for files encoding conversion, used in `Codeunit 50198`
 
## Usage
Please see Install.md for more info.

- Use `Form 50081 "Project Card"` to create a new Project.
- Have a new git branch and fill it in project `"Git Branch"` field.
- Using Project Card, export changed objects to local repo.
- Review, stage, commit and then push your changes to remote (standard Git workflow).
- Optional: create pull request to start code review and verify changes together with others.
- Optional: when Pull Request is approved, you branch can be processed further.
- Deploy changes to `Prod` - use Import objects functions in Project Card.
- Merge project branch with parent git branch.

## Contact
Please feel free to ask questions, suggest changes or fixes, comment or say hello/thanks.
Telegram: https://t.me/Skyeman
