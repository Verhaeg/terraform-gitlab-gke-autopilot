# @see https://github.com/pgporada/terraform-makefile

.ONESHELL:
.SHELL := /usr/bin/env bash
.PHONY: apply destroy plan plan-target prep import init check-security lint format

TF_IN_AUTOMATION=1
TF_INPUT=0

ifneq ("$(wildcard .env)", "")
  $(info .env file found!)
  include .env
  export $(shell sed 's/=.*//' .env)
else
  $(info No .env file found!)
endif

ifndef GOOGLE_CREDENTIALS
  ifndef GOOGLE_APPLICATION_CREDENTIALS
    ifneq ("$(wildcard gcp-credentials.json)", "")
      $(info "Will use credentials in gcp-credentials.json file")
      export GOOGLE_APPLICATION_CREDENTIALS=./gcp-credentials.json
    endif
  endif
endif

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

init: ## Re-initialize the project
	@echo "Configuring the terraform backend"
	@terraform init \
		-input=false \
		-force-copy

plan: init ## [init] Show what terraform thinks it will do
	@terraform plan \
		-lock=true \
		-input=false \
		-refresh=true \
		-out="plan.out"

docs:
	docker run --rm -v $(PWD):/src -w /src quay.io/terraform-docs/terraform-docs:0.16.0 markdown . \
		--output-template "<\!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->\n{{ .Content }}\n<\!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->" \
		--output-file README.md

# https://github.com/terraform-linters/tflint
lint: ## Check for possible errors, best practices, etc in current directory!
	docker run --rm -v $(PWD):/data -t ghcr.io/terraform-linters/tflint:v0.34.1

# https://github.com/tfsec/tfsec
check-security: ## Static analysis of your terraform templates to spot potential security issues.
	docker run --rm -v $(PWD):/src -t tfsec/tfsec:v1.1.3-amd64 /src

apply: ## Have terraform do the things. This will cost money.
	@echo "Verifying that the plan was generated"
	@if test ! -f "plan.out" ; then \
		echo "Plan file plan.out was not found, you must run 'make plan' first"; \
		false; \
	 fi

	@echo "Applying"
	@terraform apply \
		-lock=true \
		-input=false \
		-auto-approve \
		-refresh=true \
		plan.out

	@echo "Removing plan file"
	@rm -f plan.out

refresh: ## Have terraform refresh state file with current infrastructure
	@echo "Refreshing"
	@terraform refresh \
		-lock=true \
		-input=false

destroy: init ## [init] Destroys this project
	@terraform destroy \
		-lock=true \
		-auto-approve \
		-refresh=true
