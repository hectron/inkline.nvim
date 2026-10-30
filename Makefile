MINI_VERSION := v0.18.0
DEPS := .tests/deps
NVIM ?= nvim

export XDG_CONFIG_HOME := $(CURDIR)/.tests/xdg/config
export XDG_DATA_HOME := $(CURDIR)/.tests/xdg/data
export XDG_STATE_HOME := $(CURDIR)/.tests/xdg/state
export XDG_CACHE_HOME := $(CURDIR)/.tests/xdg/cache

.PHONY: test snapshots lint deps clean

test: deps
	$(NVIM) --headless --noplugin -u tests/minimal_init.lua -c "lua MiniTest.run()"

snapshots: deps
	UPDATE_SNAPSHOTS=1 $(NVIM) --headless --noplugin -u tests/minimal_init.lua -c "lua MiniTest.run()"

VIMRUNTIME := $(shell $(NVIM) --clean --headless -c 'lua io.stdout:write(vim.env.VIMRUNTIME)' -c q)

lint: deps
	stylua --check lua tests colors scripts
	VIMRUNTIME="$(VIMRUNTIME)" lua-language-server --check . --checklevel=Information --configpath=$(CURDIR)/.luarc.json

deps: $(DEPS)/mini.nvim

$(DEPS)/mini.nvim:
	git clone --filter=blob:none --depth 1 --branch $(MINI_VERSION) https://github.com/nvim-mini/mini.nvim $@

clean:
	rm -rf .tests
