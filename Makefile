md-build:
	go build -o generator .

md-test:
	go test -v ./...

md-clean:
	rm -f ./generator

md-clone-all:
	git clone git@github.com:aquasecurity/avd.git avd-repo/
	git clone git@github.com:aquasecurity/vuln-list.git avd-repo/vuln-list
	git clone git@github.com:aquasecurity/appshield.git avd-repo/appshield-repo
	git clone git@github.com:aquasecurity/kube-hunter.git avd-repo/kube-hunter-repo
	git clone git@github.com:aquasecurity/cloud-security-remediation-guides.git avd-repo/remediations-repo
	git clone git@github.com:aquasecurity/tracee.git avd-repo/tracee-repo

update-all-repos:
	cd avd-repo/vuln-list && git pull
	cd avd-repo/appshield-repo && git pull
	cd avd-repo/kube-hunter-repo && git pull
	cd avd-repo/remediations-repo && git pull
	cd avd-repo/tracee-repo && git pull

sync-all:
	rsync -av ./ avd-repo/ --exclude=.idea --exclude=go.mod --exclude=go.sum --exclude=nginx.conf --exclude=main.go --exclude=main_test.go --exclude=README.md --exclude=avd-repo --exclude=.git --exclude=.gitignore --exclude=.github --exclude=content --exclude=docs --exclude=Makefile --exclude=goldens

md-generate:
	cd avd-repo && ./generator

nginx-start:
	-cd avd-repo/docs && nginx -p . -c ../../nginx.conf

nginx-stop:
	-nginx -p . -s stop

nginx-restart:
	make nginx-stop nginx-start

hugo-devel:
	hugo server -D --debug

hugo-clean:
	cd avd-repo && rm -rf docs

hugo-generate: hugo-clean
	cd avd-repo && hugo --minify --destination=docs
	echo "avd.aquasec.com" > avd-repo/docs/CNAME

copy-assets:
	cp -R avd-repo/remediations-repo/resources avd-repo/docs/resources

build-all-no-clone: md-clean md-build sync-all md-generate hugo-generate copy-assets nginx-restart
	echo "Build Done, navigate to http://localhost:9011/ to browse"

build-all: md-clean md-build md-clone-all sync-all md-generate hugo-generate copy-assets nginx-restart
	echo "Build Done, navigate to http://localhost:9011/ to browse"
