module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          "js/haas.js": "coffee/haas.coffee"
    uglify:
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
