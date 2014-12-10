dest = "./build"
src  = './src'

module.exports =
  serverport: 3000
  browserSync:
    server:
      # src is included for use with sass source maps
      baseDir: [dest, src]
    files: [
      # Watch everything in build
      "#{dest}/**",
      # Exclude sourcemap files
      "!#{dest}/**.map"
    ]

  sass:
    src : "#{src}/sass/*.{sass, scss}"
    dest: dest
    settings:
      sourceComments: 'map'
      imagePath: '/images'

  scripts:
    src : "#{src}/javascript/**/*.js"
    dest: dest

  images:
    src : "#{src}/images/**"
    dest: "#{dest}/images"

  dist:
    root: dest

  htdocs:
    src: "#{src}/htdocs/**"
    dest: dest

  markup:
    src: "#{src}/htdocs/**"
    dest:"#{dest}"

  browserify:
    debug: true
    extensions: ['.coffee', '.hbs']
    dest: dest
    bundleConfigs: [{
      entries: "#{src}/javascript/app.coffee"
      dest: dest
      outputName: 'app.js'
    }, {
      entries: "#{src}/javascript/head.coffee"
      dest: dest
      outputName: 'head.js'
    }]
