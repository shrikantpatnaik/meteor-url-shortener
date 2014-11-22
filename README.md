# Meteor Boiler Plate

This is a simple starting point for writing [Meteor](http://www.meteor.com) applications with coffeescript. This is
based on the [Discover Meteor](http://www.discovermeteor.com) book, based on Meteor 1.0.

There is already a great [boiler plate](https://github.com/matteodem/meteor-boilerplate) using the [Orion CLI](https://github.com/matteodem/orion-cli) by the developer. However I personally prefer having full control over all created files and so I'm not a fan of scaffolding. It's also slightly different from the book. But if thats fine for you, I would recommend using that.

## Packages Installed
Actual package names are in the parentheses.

* CoffeeScript (coffeescript)
    * For CoffeeScript compilation
* Iron Router (iron:router)
    * For all our routing needs
* Spin (sacha:spin)
    * For a nice loading spinner
* Bootstrap 3 (mizzao:bootstrap-3)
    * For all our styling needs
* Accounts Password (accounts-password)
    * For a simple user management system
* Accounts Bootstrap (ian:accounts-ui-bootstrap-3)
    * To pretty out the login buttons
* Underscore.js (underscore)
    * For some nice helpers
* Percolate Studio's Migrations (percolatestudio:percolatestudio-migrations)
    * For DB migrations

## Basic Usage

This repository is ready to use as-is, just clone and start adding code in server/ and client/ directories. You can just run it using `meteor` and see the demo.

## File and Folder Structure
```
client/                       # Client Folder
   helpers/                   # Helpers Folder
      config.coffee           # Configuration File
      errors.coffee           # Simple client-side errors controller
   stylesheets/               # Style Sheets folder
   templates/                 # Templates Folder
      application/            # Application Wide Templates
         layout.html          # Master Layout ( Set in router )
         not_found.html       # The 404 Layout ( Set in router )
      includes/               # The includes folder for common templates
         access_denied.html   # The 401 template (Will have to be set manually in your program)
         errors.coffee        # Errors template helpers
         errors.html          # Errors templates
         header.coffee        # Header template helpers
         header.html          # Header template
         loading.html         # Loading template
      page1/                  # Dummy Page 1 
         page1.html           # Dummy Page 1 template
         page1.coffee         # Dummy Page 1 template helpers
      page2/                  # Dummy Page 2
         page1.html           # Dummy Page 2 template
         page1.coffee         # Dummy Page 2 template helpers   
   main.coffee                # Main coffee file that runs on everything
   main.html                  # Head file for layout
lib/                          # Folder for files shared between server and client
   collections                # Collections folder
   permissions.coffee         # Permissions file for adding in permissions
   router.coffee              # Router File
packages/                     # Local Packages Folder
public/                       # Static Assets Folder
server/                       # Server Folder
   migrations/                # Migrations Folder
      1.coffee                # Dummy Migration file(Feel free to follow your own naming convention)
      migrations.coffee       # Placeholder file to run all migrations 
   fixtures.coffee            # Fixtures file (Can be put in a 'fixtures' folder if multiple files are required)
   publications.coffee        # Server Publications File (Can be put in a 'Publications' folder if multiple files are required)
   settings.json              # Settings file(Usually private and not kept in version control)
```


## Disclaimer
This repository was originally intended only for use by me and my collaborators, and I am by no means an expert on Meteor nor am I part of the Meteor team. Feel free to suggest any changes or improvements.

## License
This is licensed under the WTFPL license. Refer to the [license](LICENSE.md) file for details :laughing:
