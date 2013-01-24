# documentation


git.rb

determines if you have git installed or not (path dependent).

	has_git = { TRUE, FALSE }
	git = { *path_to_git* }
	git_version = { *git_version_number* }

perl.rb

determines if you have perl installed or not (path dependent).  if you have perl installed it will check to see if you have perlbrew installed (path dependent).

	has_perl = { TRUE, FALSE }
	has_perlbrew = { TRUE, FALSE }
	perl = { *path_to_perl* }
	perlbrew = { *path_to_perlbrew* }


python.rb

determines if you have python installed or not (path dependent).

	has_python = { TRUE, FALSE }
	python = { *path_to_python* }


ruby.rb

determines if you have ruby installed or not (path dependent).  if you have ruby installed it will check to see if you have rvm installed (path dependent).

	has_ruby = { TRUE, FALSE }
	has_rvm = { TRUE, FALSE }
	ruby = { *path_to_ruby* }
	rvm = { *path_to_rvm* }
	ruby_version = { *ruby_version_number* }
	rvm_version = { *rvm_version_number* }

sqlite3.rb

determines if you have sqlite3 installed or not (path dependent).

	has_sqlite3 = { TRUE, FALSE }
	sqlite3 = { *path_to_sqlite3* }
	sqlite3_version = { *sqlite3_version_number* }
	
node.rb

determines if you have nodeJS installed or not (path dependent).  if you have nodeJS installed it will check to see if you have npm installed (path dependent).

	has_nodejs = { TRUE, FALSE }
	has_npm = { TRUE, FALSE }
	nodejs = { *path_to_nodejs* }
	npm = { *path_to_npm* }
	nodejs_version = { *nodejs_version_number* }
	npm_version = { *npm_version_number* }