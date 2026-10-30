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

lint:
	stylua --check lua tests colors
	lua-language-server --check . --checklevel=Warning --configpath=.luarc.json

deps: $(DEPS)/mini.nvim

$(DEPS)/mini.nvim:
	git clone --filter=blob:none --depth 1 --branch $(MINI_VERSION) https://github.com/nvim-mini/mini.nvim $@

clean:
	rm -rf .tests
