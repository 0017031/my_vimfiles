// The updated Tree-sitter grammar.js file describes a language for log files that have the following structure:

// - The first line of the log file is a version string that starts with `#Version` followed by any characters until the end of the line.
// - After the version string, the log file can contain any number of comments, metadata, and log entries.
// - Comments start with a `#` character and can contain any characters until the end of the line.
// - Metadata starts with `#include` followed by a space and then a string (without quotes) until the end of the line.
// - Log entries have a timestamp, a source, a type, and zero or more fields separated by `|` characters. The timestamp is a 6.6 integer string that represents seconds and microseconds. The fields can be identifiers (consisting of letters, numbers, and underscores), strings (without quotes), or numbers. Each log line ends with a `|` character.


module.exports = grammar({
  name: 'cel',

  rules: {
    source_file: $ => seq(
      repeat($._definition)
    ),

    _definition: $ => choice(
      $.version,
      $.comment,
      $.metadata,
      $.log_entry
    ),

    version: $ => /#Version\.CLFS [A-Z]\.\d/,

    comment: $ => seq(
      '#',
      /[^ ]/,
      /.*/
    ),

    metadata: $ => seq(
      '#include',
      '"',
      choice($.url, $.uri, $.windows_file_path), 
      '"',
    ),

    url: $ => /https?:\/\/[^\s]+/,

    uri: $ => /[a-zA-Z][a-zA-Z0-9+-.]*:[^\s]+/,

    windows_file_path: $ => /(?:[a-zA-Z]:)?(?:\/[a-zA-Z0-9_-]+)+\/?/,

    log_entry: $ => seq(
      $.timestamp,
      '|',
      $.source,
      '|',
      $.type,
      repeat(seq('|', $._field)),
      '|'
    ),

    timestamp: $ => /\d{6}\.\d{6}/,

    source: $ => /[^\|]+/,

    type: $ => /[^\|]+/,

    _field: $ => choice(
      $.identifier,
      $.string,
      $.number
    ),

    identifier: $ => /[a-zA-Z_][a-zA-Z0-9_]*/,

    string: $ => /[^|\n]+/,

    number: $ => /\d+/
  }
});

