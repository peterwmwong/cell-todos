#===================================================================
#--------------------------- Variables -----------------------------
#===================================================================
npmbin = node_modules/.bin
coffee = $(npmbin)/coffee
stylus = $(npmbin)/stylus
closure = vendor/closure-compiler/compiler.jar

#-------------------------------------------------------------------
# BUILD
#-------------------------------------------------------------------
requirejsBuild = vendor/cell/r.js


#===================================================================
#­--------------------------- TARGETS ------------------------------
#===================================================================
.PHONY : clean deps

#-------------------------------------------------------------------
# BUILD
#-------------------------------------------------------------------
src/bootstrap.js: deps
	$(coffee) -c -b src/
	node $(requirejsBuild) -o build_config.js
	java -jar $(closure) --compilation_level SIMPLE_OPTIMIZATIONS --js src/bootstrap-tmp.js --js_output_file src/bootstrap.js
	node_modules/.bin/cleancss -o src/bootstrap.css src/base.css
	rm src/bootstrap-tmp.*

#-------------------------------------------------------------------
# Dependencies
#-------------------------------------------------------------------
remove-closure:
	rm -rf vendor/closure-compiler

update-closure: remove-closure $(closure)

$(closure):
	mkdir -p vendor/closure-compiler
	curl -o vendor/closure-compiler/closure-compiler.zip "http://closure-compiler.googlecode.com/files/compiler-latest.zip"
	unzip -d vendor/closure-compiler vendor/closure-compiler/closure-compiler.zip
	rm vendor/closure-compiler/closure-compiler.zip

deps:
	npm install


#-------------------------------------------------------------------
# TEST
#-------------------------------------------------------------------
specs: deps
	find specs -name '*.spec.coffee' | xargs $(coffee) -e 'console.log """define([],#{JSON.stringify process.argv[4..].map (e)->"spec!"+/^specs\/(.*?)\.spec\.coffee/.exec(e)[1]});"""' > spec-runner/GENERATED_all-specs.js

clean:
	@@rm src/bootstrap.*
