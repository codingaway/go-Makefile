PROG=testpkg
REPO_PATH=github.com/codingaway
PACKAGE=$(REPO_PATH)/$(PROG)
GOPATH=$(CURDIR)/.gopath
GOBIN=$(CURDIR)/bin
BASE=$(GOPATH)/src/$(PACKAGE)


.PHONY:all
all: build

$(BASE):
	@mkdir -p $(dir $@)
	ln -sf $(CURDIR) $@

$(GOBIN):
	mkdir -p $@

build: $(BASE) $(GOBIN)
	cd $(BASE)/cmd && go build -o $(GOBIN)/$(PROG)
