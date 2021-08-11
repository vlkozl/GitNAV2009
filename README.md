# GitNAV2009
Git integration for Microsoft Dynamics NAV 2009

## Description
Introduction to Source Control Management for Navision world has been made in the past. For example have a look on this video: https://youtu.be/HJOsjLXbskc Even for legacy NAV 2009 versions there are many benefits:
 - transparent history of changes integrated with tracking systems like Jira/TFS/GitHub
 - code reviews and advantages of team collaboration and expertise
 - quick rollbacks
 - no need to work with exported/imported files manually, all transfers directed and automated
 - ability to combine changes of multiple requests/tickets into a single deployment

Developments made for NAV usually include limited number of object files that can be tracked by source code management system like Git. Git use branches to distinct changes between epics/tasks/tickets/workitems/developers... Git branch is, in simple words, a "container for changed objects" related to the specific change request. The problem is that NAV development environment does not naturally have any similar data structure like Branch. Hence, it need to be introduced.

### C/AL structure
Each development represents a new *Project* record in `Table 50034 Project Header`. Project lines are populated manually with changed objects. Both header and line records help maintain changes related to particular task/ticket/project. So the changed objects can be exported or imported, delivered and deployed within a certain branch or change request only.

Source files contents:
 - 2 tables: header and lines for storing Project data
 - 3 forms (Document, Subform, List) exposing Project data, allowing to run actions related to the project/Git
 - 2 codeunits: 
   - 50196 export all objects from database to a folder selected considering license permissions
   - 50198 contains functions required to import/export objects with automatic encoding conversion from national to UTF-8 and vice versa
 - 1 xmlport (optional) to transfer project data between servers/developers

### BAT files
 - `.\Install\MakeRepoFolders.bat ` - Create folders structure for NAV 2009 repository for all object types
 - `.\Install\MoveObjectsToRepository.bat` - Move extracted text objects from NAV database to respective repository subfolders
 - `.\Tools\CMD\CreateTempDirs.bat` - Create temporary folders for files encoding conversion, used in `Codeunit 50198`
 
## Usage
Please see Install.md for more info.

- Use `Form 50081 "Project Card"` to create a new Project.
- Have a new git branch and fill it in project `"Git Branch"` field of Project Card.
- Using Project Card, export changed objects to local repo.
- Review, stage, commit and then push your changes to remote (standard Git workflow).
- Optional: create pull request to start code review and verify changes together with others.
- Optional: when Pull Request is approved, you branch can be processed further.
- Deploy changes to `Prod` - use Import objects functions in Project Card.
- Merge project branch with parent git branch.

## Contact
Please feel free to ask questions, suggest changes or fixes, comment or say hello/thanks.
Telegram: https://t.me/Skyeman
