module.exports = (grunt) ->
  config =
    clean:
      tmp:
        "dist/temp/tests/results"
    doctor:
      "test/basic":
        files: [{
          src: ["tests/fixtures/basic.js"]
          dest: "dist/temp/tests/results/basic.json"
        }]
    nodeunit:
      tests: ["tests/run.coffee"]
        

  grunt.initConfig(config)

  grunt.loadTasks("tasks")

  grunt.loadNpmTasks("grunt-contrib-clean")
  grunt.loadNpmTasks("grunt-contrib-nodeunit")

  grunt.registerTask("test", ["clean", "doctor", "nodeunit"])
