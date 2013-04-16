Cell Todos
==========

TodoMVC implementation in [cell](https://github.com/peterwmwong/cell)

Developing
==========

In 3 steps, you'll have cell-todos up and running in your browser from scratch.

## 1 - [Installing node.js and NPM](http://nodejs.org/#download)

## 2 - Run Stylus/CoffeeScript compilers

    # In a new terminal
    > script/stylus-compiler

    # In a another terminal
    > script/coffee-compiler

This will compile `.styl` *to* `.css` and `.coffee` *to* `.js`.  
File changes will **automatically** be recompiled.

If you encounter SSL problems installing npm modules then tell npm to default to http by setting up a .npmrc:
    > echo "registry = http://registry.npmjs.org/" >> ~/.npmrc

## 3 - Run development server

    # In a another terminal
    > script/server

In a browser, visit `http://localhost:5000/index-dev.html`.
