# Makefile for compiling LaTeX papers using Docker

.PHONY: all core federated clean help

# Default: compile both papers
all: core federated

# Compile core paper
core:
	./compile.sh normalization_confluence_2026.tex

# Compile federated paper
federated:
	./compile.sh normalization_confluence_in_federated_registry_networks.tex

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.out *.toc

# Show help
help:
	@echo "Available targets:"
	@echo "  make all       - Compile both papers (default)"
	@echo "  make core      - Compile normalization_confluence_2026.pdf"
	@echo "  make federated - Compile federated version"
	@echo "  make clean     - Remove auxiliary files"
