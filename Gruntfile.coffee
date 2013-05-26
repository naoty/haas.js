module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    meta:
      banner:
        """
        /*
         * haas.js <%= pkg.version %> (<%= grunt.template.today('yyyy-mm-dd, HH:MM') %>)
         * <%= pkg.homepage %>
         * MIT licensed
         *
         * Copyright (C) 2013 Naoto Kaneko, http://naoty.info
         */
        """
    coffee:
      compile:
        files:
          "js/haas.js": "coffee/haas.coffee"
    uglify:
      options:
        banner: "<%= meta.banner %>"
      my_target:
        files:
          "js/haas.min.js": "js/haas.js"
    regarde:
      js:
        files: "coffee/haas.coffee"
        tasks: ["coffee", "uglify"]

  grunt.loadNpmTasks "grunt-regarde"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-uglify"

  grunt.registerTask "default", ["coffee", "uglify", "regarde"]
