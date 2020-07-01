HUGO_BIN=hugo

.PHONY: serve

serve: 
	$(HUGO_BIN) serve -D

#slug=two-sum-problem  make new
new:
	$(HUGO_BIN) new articles/$(slug)/index.md
