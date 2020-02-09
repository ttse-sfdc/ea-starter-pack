# Einstein Analytics Starter Pack

This repo contains the source for the Einstein Analytics Start Pack template of the dashboards developed by Yuji Yamamoto. 

The structure of this repo and scripts can also be used as a template for Einstein Analytics Template development.

## Development Model

Development and testing of the Einstein Analytics Assets should be done using scratch orgs with the repo acting as the source of truth. Once the code is finalized, it should be then either deployed into a Dev org for packaging or else where to be included as a greater deployment.

### Development Flow
[Image]

## Prerequisite
Before trying the steps detailed here, you need the following:
1. A working Salesforce Dev Hub org.
2. Prior experience with Salesforce DX and Salesforce CLI.
3. Basic understanding of Salesforce Einstein Analytics.

## Initial Steps
1. Install Salesforce CLI from https://developer.salesforce.com/tools/sfdxcli. Follow the instructions on that page to download.
2. Open a terminal and install the Analytics plugin by running the command `sfdx plugins:install @salesforce/analytics`

## Usage
1. Clone this repo https://github.com/ttse-sfdc/ea-starter-pack.git
2. Use the command `SFDX: Create Project` (VS Code) or `sfdx force:project:create` (Salesforce CLI)  to create your project.
3. Do your development in the scratch org or VS Code.
4. - Use the commands `SFDX: Push Source to Org` (VS Code) or `sfdx force:source:push` (Salesforce CLI) to push changes from local into the Scratch Org. For example changes to template metadata (i.e. template-info.json)
- Use the commands `SFDX: Pull Source from Org` (VS Code) or `sfdx force:source:pull` (Salesforce CLI) to pull changes down from Scratch Org to local. For example, dashboard edits.
5. Sync code with git

### Package Deployment Model
Use the commands `SFDX: Deploy Source to Org` (VS Code) or `sfdx force:source:deploy` (Salesforce CLI) and `SFDX: Retrieve Source from Org` (VS Code) or `sfdx force:source:retrieve` (Salesforce CLI). The `Push` and `Pull` commands work only on orgs with source tracking (scratch orgs).
