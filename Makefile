all: download build

download:
	if [ ! -e "./node-webkit-v0.5.1-osx-ia32.zip" ]; then \
		curl -O https://s3.amazonaws.com/node-webkit/v0.5.1/node-webkit-v0.5.1-osx-ia32.zip; \
	fi
	unzip -o node-webkit-v0.5.1-osx-ia32.zip -d node-webkit/

build:
	mkdir -p out
	cp -R node-webkit/node-webkit.app out/Devine.app
	cp dist/mac/Info.plist out/Devine.app/Contents
	cp -R dist/mac/SharedSupport out/Devine.app/Contents
	git archive --format=tar --prefix=app.nw/ HEAD | (cd out/Devine.app/Contents/Resources && tar xf -)

.PHONY: clean
clean:
	-rm -rf out
