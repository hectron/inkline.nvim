MINI_VERSION := v0.18.0
DEPS := .tests/deps
# Resolve the real binary: mise shims cannot run with the isolated XDG paths below
NVIM ?= $(shell mise which nvim 2>/dev/null || command -v nvim)
VIMRUNTIME := $(shell $(NVIM) --clean --headless -c 'lua io.stdout:write(vim.env.VIMRUNTIME)' -c q)

TEST_ENV := XDG_CONFIG_HOME=$(CURDIR)/.tests/xdg/config XDG_DATA_HOME=$(CURDIR)/.tests/xdg/data \
	XDG_STATE_HOME=$(CURDIR)/.tests/xdg/state XDG_CACHE_HOME=$(CURDIR)/.tests/xdg/cache
RUN_TESTS := $(NVIM) --headless --noplugin -u tests/minimal_init.lua -c "lua MiniTest.run()"

.PHONY: test snapshots lint screenshots demo deps clean

test: deps
	$(TEST_ENV) $(RUN_TESTS)

snapshots: deps
	$(TEST_ENV) UPDATE_SNAPSHOTS=1 $(RUN_TESTS)

lint: deps
	stylua --check lua tests colors scripts
	VIMRUNTIME="$(VIMRUNTIME)" lua-language-server --check . --checklevel=Information --configpath=$(CURDIR)/.luarc.json

screenshots:
	scripts/screenshots.sh assets

demo:
	vhs scripts/demo.tape

deps: $(DEPS)/mini.nvim

$(DEPS)/mini.nvim:
	git clone --filter=blob:none --depth 1 --branch $(MINI_VERSION) https://github.com/nvim-mini/mini.nvim $@

clean:
	rm -rf .tests
