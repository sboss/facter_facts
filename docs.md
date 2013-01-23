# documentation


git.rb

determines if you have git installed or not (path dependent).

	has_git = { TRUE, FALSE }
	git = { *path_to_git* }

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
