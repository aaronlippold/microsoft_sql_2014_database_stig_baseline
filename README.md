# microsoft_sql_2014_database_stig_baseline  

InSpec profile testing secure configuration of Microsoft SQL Server Database 2014.

## Description  

This InSpec compliance profile is a collection of automated tests for secure configuration of MSSQL 2014 DB.

InSpec is an open-source run-time framework and rule language used to specify compliance, security, and policy requirements for testing any node in your infrastructure.

## Versioning and State of Development
This project uses the [Semantic Versioning Policy](https://semver.org/). 

### Branches
The master branch contains the latest version of the software leading up to a new release. 

Other branches contain feature-specific updates. 

### Tags
Tags indicate official releases of the project.

Please note 0.x releases are works in progress (WIP) and may change at any time.   

## Requirements  

- [ruby](https://www.ruby-lang.org/en/) version 2.4  or greater
- [InSpec](http://inspec.io/) version 2.1  or greater
    - Install via ruby gem: `gem install inspec`

## Usage
InSpec makes it easy to run tests wherever you need. More options listed here: [InSpec cli](http://inspec.io/docs/reference/cli/)

### Run with remote profile:  

You may choose to run the profile via a remote url, this has the advantage of always being up to date.
The disadvantage is you may wish to modify controls, which is only possible when downloaded.
Also, the remote profile is unintuitive for passing in attributes, which modify the default values of the profile.
``` bash
inspec exec https://github.com/aaronlippold/microsoft_sql_2014_database_stig_baseline/archive/master.tar.gz
```
Another option is to download the profile then run it, this allows you to edit specific instructions and view the profile code.
``` bash
# Clone Inspec Profile
$ git clone https://github.com/aaronlippold/microsoft_sql_2014_database_stig_baseline.git

# Run profile locally (assuming you have not changed directories since cloning)
# This will display compliance level at the prompt, and generate a JSON file 
# for export called output.json
$ inspec exec microsoft_sql_2014_database_stig_baseline --reporter cli json:output.json

# Run profile with custom settings defined in attributes.yml against the target 
# server example.com. 
$ inspec exec microsoft_sql_2014_database_stig_baseline-t ssh://user@password:example.com --attrs attributes.yml --reporter cli json:output.json

# Run profile with: custom attributes, ssh keyed into a custom target, and sudo.
$ inspec exec microsoft_sql_2014_database_stig_baseline -t ssh://user@hostname -i /path/to/key --sudo --attrs attributes.yml --reporter cli json:output.json
```


## Contributors + Kudos  

- Aaron Lippold
- The MITRE InSpec Team

## License and Author  

### Authors  

- Author:: Aaron Lippold (lippold@gmail.com)

### Progress report  

|Control|Auto/Manual|Describe|in-progress|Review-RDY|Reviewed|Tested|Automated Unit Tests|
|--------|----------|----------|----------|----------|----------|----------|------------|
|V-67399|   auto   |yes|   |yes| | | |
|V-67441|   auto   |yes|   |yes| | | |
|V-67389|  manual  |yes|   |yes| | | |
|V-67415|   auto   |yes|   |yes| | | |
|V-67421|   auto   |yes|   |yes| | | |
|V-67431|   auto   |yes|   |yes| | | |
|V-67405|  manual  |yes|   |yes| | | |
|V-67425|   auto   |yes|   |yes| | | |
|V-67411|  manual  |yes|   |yes| | | |
|V-67401|  manual  |yes|   |yes| | | |
|V-67435|   auto   |yes|   |yes| | | |
|V-67393|  manual  |yes|   |yes| | | |
|V-67383|   auto   |yes|   |yes| | | |
|V-67397|   auto   |yes|   |yes| | | |
|V-67365|   auto   |yes|   |yes| | | |
|V-67375|   auto   |yes|   |yes| | | |
|V-67361|   auto   |yes|   |yes| | | |
|V-67371|   auto   |yes|   |yes| | | |
|V-67395|  manual  |yes|   |yes| | | |
|V-67385|   auto   |yes|   |yes| | | |
|V-67391|  manual  |yes|   |yes| | | |
|V-67381|  manual  |yes|   |yes| | | |
|V-67419|   auto   |yes|   |yes| | | |
|V-67357|  manual  |yes|   |yes| | | |
|V-67373|   auto   |yes|   |yes| | | |
|V-67409|   auto   |yes|   |yes| | | |
|V-67429|   auto   |yes|   |yes| | | |
|V-67367|   auto   |yes|   |yes| | | |
|V-67377|  manual  |yes|   |yes| | | |
|V-67439|   auto   |yes|   |yes| | | |
|V-67877|   auto   |yes|   |yes| | | |
|V-67443|   auto   |yes|   |yes| | | |
|V-67369|   auto   |yes|   |yes| | | |
|V-67427|   auto   |yes|   |yes| | | |
|V-67413|   auto   |yes|   |yes| | | |
|V-67403|  manual  |yes|   |yes| | | |
|V-67437|   auto   |yes|   |yes| | | |
|V-67359|   auto   |yes|   |yes| | | |
|V-67417|   auto   |yes|   |yes| | | |
|V-67423|   auto   |yes|   |yes| | | |
|V-67433|   auto   |yes|   |yes| | | |
|V-67407|  manual  |yes|   |yes| | | |

 
Legend
- Describe: Control has been evaluated and categorized as candidate for automated tests. Describe block has been written.
- Auto/Manual: Control has been evaluated and categorized as candidate for type that needs a manual review. Describe block has been written.
- Awaiting Review: Control is ready for peer review.
- in-progress: Initial evaluation has been completed, describe statements are being worked on.
- Reviewed: Control has been peer reviewed.
- Tested: Control has been peer reviewed and improved ( if needed ) and the improvements have been peer-tested.
- Automated Unit Tested: Automation of unit testing has been developed to the final point where creation, destruction and configuration of the resources has been automated fully.

### NOTICE

© 2018 The MITRE Corporation.

Approved for Public Release; Distribution Unlimited. Case Number 18-3678.  

### NOTICE  

This software was produced for the U. S. Government under Contract Number HHSM-500-2012-00008I, and is subject to Federal Acquisition Regulation Clause 52.227-14, Rights in Data-General.  

No other use other than that granted to the U. S. Government, or to those acting on behalf of the U. S. Government under that Clause is authorized without the express written permission of The MITRE Corporation. 

For further information, please contact The MITRE Corporation, Contracts Management Office, 7515 Colshire Drive, McLean, VA  22102-7539, (703) 983-6000.  

### NOTICE  

DISA STIGs are published by DISA IASE, see: https://iase.disa.mil/Pages/privacy_policy.aspx   
