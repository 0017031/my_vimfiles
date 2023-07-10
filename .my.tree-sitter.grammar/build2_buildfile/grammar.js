// This is a tree-sitter grammar for a language called `buildfile`. The grammar specifies the rules for parsing a `buildfile` source file. The source file consists of a sequence of statements, which can be either a dependency declaration or a using directive. A dependency declaration consists of a target, followed by a colon, and then a prerequisite. A target and a prerequisite both consist of a target type and an identifier enclosed in curly braces. A target type is one of the predefined keywords such as 'exe' or 'cxx'. An identifier is a sequence of alphanumeric characters, underscores, and dots. A using directive imports a module without arguments and consists of the keyword 'using' followed by the module name. The module name is an identifier. The grammar also specifies that whitespace, single-line comments, and multi-line comments are ignored when parsing the source file.
module.exports = grammar({
	name: 'buildfile',

	extras: $ => [
		/\s/,
		$.multi_line_comment,
		$.single_line_comment 
	],

	rules: {
		source_file: $ => repeat($.statement),

		statement: $ =>choice(
			$._dependency,
			$.using_directive
		),
		// A dependency declaration consists of a target, a colon, and a prerequisite
		_dependency: $ => seq(
			$.target,
			':',
			$.prerequisite,
			'\n'
		),

		// A target consists of a target type and an identifier in curly braces
		target: $ => seq(
			$.target_type,
			'{',
			$.identifier,
			'}'
		),

		// A prerequisite consists of a target type and an identifier in curly braces
		prerequisite: $ => seq(
			$.target_type,
			'{',
			$.identifier,
			'}'
		),

		// A target type is one of the predefined keywords
		target_type: $ => choice(
			'exe',
			'cxx',
			// add more target types here as needed
		),

		// An identifier is a sequence of alphanumeric characters, underscores, and dots
		identifier: $ => /[a-zA-Z0-9_.]+/,

		// A using directive imports a module without arguments
		using_directive: $ => seq(
			'using',
			$.module_name,
			'\n'
		),

		// A module name is an identifier
		module_name: $ => $.identifier,

		single_line_comment: $ => /#[^\\][^\n]*\n/,
		multi_line_comment: $ => seq(
			$._m_start_end,
			repeat($.comment_line),
			$._m_start_end,
		),
		_m_start_end: $ => '#\\',
		comment_line: $ => /[^#\n]*\n/,

	}
});


