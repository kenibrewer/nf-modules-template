.PHONY: $(MAKECMDGOALS)

current_commit := $(shell git rev-parse --short HEAD)

demo:
	@copier copy --data-file tests/demo-answers.yml --defaults . demo

commit-demo: demo
	@cd demo && bash .project_init.sh
	@cd demo && git add . && git commit -m "🧹 chore: update demo from kenibrewer/nf-modules-template@${current_commit}"

docs:
	@.venv/bin/mkdocs serve

docs-deploy:
	@.venv/bin/mkdocs gh-deploy

setup:
	@uv venv --seed
	@uv pip install -r requirements.txt
