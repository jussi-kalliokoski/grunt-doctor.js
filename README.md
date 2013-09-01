# Grunt Doctor.js

[![Build Status](https://travis-ci.org/jussi-kalliokoski/grunt-doctor.js.png)](https://travis-ci.org/jussi-kalliokoski/grunt-doctor.js)

This is a Grunt task for running [doctor.js](https://github.com/jussi-kalliokoski/doctor.js] on your source files.

## Installation

Install via npm:

```bash
$ npm install --save-dev grunt-doctor.js
```

## Configuration

Example configuration:

```javascript
grunt.initConfig({
  doctor: {
    default: {
        files: [{
            src: ["js/*.js"],
            dest: "documentation.json"
        }]
    }
  }
});

grunt.loadNpmTasks("grunt-doctor.js");
```
