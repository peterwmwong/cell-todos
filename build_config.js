({
  mainConfigFile: 'modules_config.js',
  name: '../vendor/cell/almond',
  optimize: 'none',
  out: 'src/bootstrap-tmp.js',
  wrap: {
    end: "require('views/App');"
  }
})