DoctorJS = require("doctor.js")

DESCRIPTION = "Generates an interface definition JSON file out of the documentation notation in code"
MSG_FILE_PARSED = "Finished parsing #{"%s".cyan}."
MSG_DEFINITIONS_SAVED = "Saved to #{"%s".cyan}."

module.exports = (grunt) ->
  grunt.registerMultiTask "doctor", DESCRIPTION, ->
    @files.forEach (file) ->
      parser = new DoctorJS.Parser()
      sources = file.src.filter (file) -> not grunt.file.isDir(file)
      for source in sources
        parser.parse(grunt.file.read(source))
        grunt.log.verbose.writeln(MSG_FILE_PARSED, source)
      builder = new DoctorJS.Builder()
      definitions = builder.build(parser.data)
      grunt.file.write(file.dest, JSON.stringify(definitions))
      grunt.log.ok(MSG_DEFINITIONS_SAVED, file.dest)
