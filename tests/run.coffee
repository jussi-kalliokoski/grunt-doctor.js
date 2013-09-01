grunt = require("grunt")
path = require("path")

grunt.file.glob.sync(path.join(__dirname, "expected", "*")).forEach (expectedFilename) ->
  testName = path.basename(expectedFilename)
  testName = testName.substr(0, testName.length - path.extname(testName).length)
  actualFilename = path.resolve(__dirname, "..", "dist", "temp", "tests", "results", "#{testName}.json")
  console.log(actualFilename)
  module.exports[testName] = (test) ->
    actual = grunt.file.read(actualFilename)
    expected = grunt.file.read(expectedFilename)
    test.equal(actual, expected, "#{actualFilename} matches #{expectedFilename}")
    test.done()
