Cell Todos
==========

Demo app using [Cell](https://github.com/peterwmwong/cell).

In 3 steps, you'll have a Todo app up and running in your browser from scratch.

Developing
==========

## 1 - [Installing node.js and NPM](http://nodejs.org/#download)

## 2 - Run Stylus/CoffeeScript compilers

    > script/stylus-compiler
    > script/coffee-compiler

This will compile `.styl` *to* `.css` and `.coffee` *to* `.js`.  
File changes will **automatically** be recompiled.

If you encounter SSL problems installing npm modules then tell npm to default to http by setting up a .npmrc:
    > echo "registry = http://registry.npmjs.org/" >> ~/.npmrc

## 3- Run development server

    > script/server

In a browser, visit `http://localhost:3000/index-dev.html?live`.

### Why a server?

**The development server is JUST for live.js/livereload and Chrome**. live.js/livereload uses XHR to automatically reload JavaScript and CSS, Chrome does not allow XHR over the `file://` protocol ([issue 41024](http://code.google.com/p/chromium/issues/detail?id=41024)).


Specs
=====

## Generate specs

    > make specs

## Run specs (in the browser)

If the server isn't running...

    > make server

Visit [http://localhost:3000/spec-runner/index.html]


Deploying Checklist
===================

## 1 - Compile Stylus/CoffeeScript

    > script/stylus-compiler
    > script/coffee-compiler

## 2 - Rebuild bootstrap.js and bootstrap.css

    > make clean; make

## 3 - Automated Browser Test

    > make specs

In a browser, go to [http://localhost:3000/spec-runner/index.html].


## 4 - Manual Browser Test

    > script/server

In a browser, go to [http://localhost:3000] and spotcheck functionality hasn't regressed.

SublimeText Setup
=================

## 1 - Install this TextMate bundle to get CoffeeScript syntax highlighting:

[https://github.com/jashkenas/coffee-script-tmbundle]

Extract it in "~/Library/Application\ Support/Sublime\ Text\ 2/Packages"

## 2 Install the SublimeLinter from package control

This will show CoffeeeScript syntax errors in the editor.  More information is
available at [https://github.com/Kronuz/SublimeLinter].

Note: the coffee command needs to be in your path for the the SublimeLinter to
work with CoffeeScript.

## 3 Install the Stylus TextMate bundle

    > cp -R node_modules/stylus/editors/Stylus.tmbundle "~/Library/Application\ Support/Sublime\ Text\ 2/Packages"

About and Credits
=================
This project is based [https://github.com/gerryster/js_training] by Ryan Gerry.
