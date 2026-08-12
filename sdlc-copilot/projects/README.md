<!-- v0.2.0 · created 2026-08-05 · updated 2026-08-12 · owner TBD -->

# Projects

Each intake gets one durable project folder. Store the intake questionnaire, business
documents, requirements, and framework outputs together so every handoff can trace back
to the same request.

## Folder naming

Start with the intake ticket and a short name:

`JIRA-1234-short-project-name/`

When a funded project code is assigned, keep the folder name stable and record the code
in the project's README. This preserves links and history while supporting time tracking
and portfolio reporting.

Use the organization's actual ticket prefix when it differs from `JIRA`.

## Minimum project README

Record these fields at the top of each project folder:

| Field | Example |
|---|---|
| Intake ticket | `JIRA-1234` |
| Project code | `TBD`, then the assigned code |
| Project name | Short descriptive name |
| Business owner | Named role or person |
| Delivery owner | Named role or person |
| Current SDLC step | `01` through `11` |
| System of record links | Intake, backlog, architecture, test, and release records |
| Data classification | Organization-approved classification |

## Repository boundary

The included `JIRA-0000-loan-exception-example/` is synthetic teaching material. Before
teams store real project artifacts here, the framework owner must define which artifacts
may be committed and which must remain links to the approved system of record. Never add
customer data, credentials, production exports, or regulated content to this repository.
