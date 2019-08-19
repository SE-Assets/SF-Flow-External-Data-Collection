# Salesforce Flow, external data, and YOU! _(SF-Flow-External-Data-Collection)_

[![build passing](https://img.shields.io/badge/build-passing-green.svg)]()
[![Salesforce API v46.0](https://img.shields.io/badge/Salesforce%20API-v46.0-blue.svg)]()
[![Lightning Experience Required](https://img.shields.io/badge/Lightning%20Experience-Required-informational.svg)]()
[![User License Sales](https://img.shields.io/badge/User%20License-Platform-032e61.svg)]()
[![Apex Test Coverage 0](https://img.shields.io/badge/Apex%20Test%20Coverage-25-red.svg)]()

>A collection of Flows and assoc whatnots that leverage External Objects, HTTP Requests, and Apex Data Types so you know how to do it too!

Longform description. No title here. The quote I stole to define this from the template is - 
* "This should describe your module in broad terms, generally in just a few paragraphs; more detail of the module's routines or methods, lengthy code examples, or other in-depth material should be given in subsequent sections.
Ideally, someone who's slightly familiar with your module should be able to refresh their memory without hitting "page down". As your reader continues through the document, they should receive a progressively greater amount of knowledge." - Kirrily "Skud" Robert, perlmodstyle

We have here what might be a growing set of Flow examples, along with objects and Apex to support em, that show different ways of hitting external sources of data from Flow. First is using __x or External Objects via Salesforce Connect, second doing direct HTTP Requests from Apex. Also playing a bit with Apex Types as well. General idea here isn't to have something crazy robust, but to give you a bit of a baseline as to how you combine all of these amazing flavors into a single soup to get external data if you aren't lucky enough to be working with an OpenAPI/Swagger endpoint, which Flow has way more fun around. 

## Table of Contents
<!-- Optional if doc is less than 100 lines total 
    Link to all sections, start with the next one, don't include anything above. Capture all ## headings, optional to get ### and ####, you do you.
-->
- [Salesforce Flow, external data, and YOU! _(SF-Flow-External-Data-Collection)_](#salesforce-flow-external-data-and-you-sf-flow-external-data-collection)
  - [Table of Contents](#table-of-contents)
  - [Background](#background)
  - [Install](#install)
    - [Dependencies](#dependencies)
  - [Usage](#usage)
    - [External Objects + Apex-defined Data Types: Get Phone Info From Phone Number](#external-objects--apex-defined-data-types-get-phone-info-from-phone-number)
      - [Main Components: force-app/main/default/flows/Get_phone_info_from_number, force-app/main/default/classes/invExtSinglePhoneFromNumber, force-app/main/default/classes/externalPhone](#main-components-force-appmaindefaultflowsgetphoneinfofromnumber-force-appmaindefaultclassesinvextsinglephonefromnumber-force-appmaindefaultclassesexternalphone)
    - [HTTP Request: Get Animal Info?](#http-request-get-animal-info)
      - [Main Components: force-app/main/default/flows/Get_Animals_from_HTTP_Service, force-app/main/default/classes/invHTTPAnimalRequest](#main-components-force-appmaindefaultflowsgetanimalsfromhttpservice-force-appmaindefaultclassesinvhttpanimalrequest)
  - [Extra Sections](#extra-sections)
    - [Security / Limitations (if not in the primary spot)](#security--limitations-if-not-in-the-primary-spot)
    - [Example Usage](#example-usage)
    - [Related Projects](#related-projects)
  - [Maintainers](#maintainers)
  - [Thanks](#thanks)
  - [Contributing](#contributing)
  - [License](#license)

## Background

Alright, so there are a ton of good trails for each of these individually, but these combinations of techniques aren't easily managable as one big chunk. Mixing External Objects + Invocables + Flow + Apex Datatypes sounds easy, and relatively speaking IS easy - but there are things to do right, that's what we're gonna look at.

## Install

Fairly straightforward single-package SFDX Installation!
That means, before ya start, need the following funtimes: * [Git](https://git-scm.com/downloads) [Node.js](https://nodejs.org/en/download/) [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)

Also prepare for Mr Command Line with Copy/Paste action!
`git clone https://github.com/cowie/SF-Flow-External-Data-Collection.git`
`cd SF-Flow-External-Data-Collection`
`sfdx force:org:create -f config/project-scratch-def.json -s -a flowExternalOrg -d 7`
`sfdx force:source:push`
`sfdx force:user:permset:assign -n External_Flow_Examples_Permissions`

### Dependencies
* None!

## Usage

### External Objects + Apex-defined Data Types: Get Phone Info From Phone Number
#### Main Components: force-app/main/default/flows/Get_phone_info_from_number, force-app/main/default/classes/invExtSinglePhoneFromNumber, force-app/main/default/classes/externalPhone
Alright, starting 'simple' first, yeah? So your entry point here is **Setup** -> **Flows** -> *Get Phone Info From Number*. Simple screen flow, with a fun apex action within to ask for a phone number, then send that to the apex to query the phones__x table for. __x, so clearly this is an external object, data hosted elsewhere. We get the response back, form it within our Apex-Defined type, and return to Flow. Flow then breaks that out, displays it in a screen. Comments abound in the code, externalPhone is the datatype, invExtSinglePhoneFromNumber the invoked method. Go wild.

### HTTP Request: Get Animal Info?
#### Main Components: force-app/main/default/flows/Get_Animals_from_HTTP_Service, force-app/main/default/classes/invHTTPAnimalRequest
Numbah two, let's deal with one where you don't even have an external object to deal with, just an API endpoint to yell at for justice. Still pretty straightforward, this HTTP Request is almost literally out of the book, so it's really mostly about how you form the method to leverage it, break it apart, and return it back as a primitive, instead of dealing with the JSON in Flow (no.)



## Extra Sections
### Security / Limitations (if not in the primary spot)
Since these are largely example usecases, no real problems to speak of using this codebase by itself. That said, lots of these elements DO impact other limits. DML statements, callout per txn, cumulative timeout for callouts per txn. The good news is these don't really throw a particular wrench into the mix, but you can't point at a long running API endpoint any more than you could otherwise.
### Example Usage
<!-- Are there other live uses of this project?-->
### Related Projects
<!-- Are there related projects or repos assoc with this?-->
If you liked this, you might also enjoy my collection of sample [IOT Flows](https://github.com/cowie/SF-IOT-Example-Collection). More automatey fun.

## Maintainers
<!--Small list of folk in charge, not everyone involved.-->
[Cowie](https://github.com/cowie)

## Thanks
<!--Don't be a jerk thank those who helped you-->
The entire main thrust/content of this doc came from - [!Richard Litt(https://github.com/RichardLitt/standard-readme/blob/master/spec.md)]'s standard-readme doc. 

## Contributing
<!--Give instructions on how to contribute to this repository. Where do I ask questions? Do you accept PRs? What are the requirements to contribute? Don't be a jerk. Use issues if you can.-->

Always looking for more usecases from anyone. Build ya code and add it in a pull req.
Oh if y'all want to do my test code for me too, it's cool. Just sayin'.

## License
<!-- Actually required. State the owner, -->
[MIT](LICENSE) © CDG