ifeq ($(THEMES),ALL)
	SRC := $(wildcard sass/themes/*.scss)
	override THEMES := $(SRC:sass/themes/_%.scss=%)
endif

THEMES	:= monokai-light monokai-dark
FILES	:= $(addprefix build/theme-, $(addsuffix .css, default $(THEMES)))

SASSC	:= sassc
FLAGS	:= -t compressed


all: main themes

main: build/shellinabox.css

themes: $(FILES)

build/theme-default.css: build/
	@sed "/%THEME%/d" sass/theme-template.scss | $(SASSC) -s -I"sass/" $(FLAGS) $@
	@echo "Generated default theme: $@"

build/theme-%.css: build/
	@sed "s/%THEME%/$*/" sass/theme-template.scss | $(SASSC) -s -I"sass/" $(FLAGS) $@
	@echo "Generated theme: $@"

build/%.css: sass/%.scss | build/
	@$(SASSC) $(FLAGS) $< $@
	@echo "Generated: $@"

build/:
	@mkdir -p $@

clean:
	-$(RM) -r build/

.PHONY: all main themes clean
