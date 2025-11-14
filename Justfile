root := justfile_directory()

export TYPST_ROOT := root

[private]
default:
  @just --list --unsorted

# run test suite
test *args:
  tt run {{ args }} --font-path fonts

# build documentation
doc:
  typst compile docs/docs.typ --root .    

# update test cases
update *args:
  tt update {{ args }} --font-path fonts

# package the library into the specified destination folder
package target:
  ./scripts/package "{{target}}"

# install the library with the "@local" prefix
install: (package "@local")

# install the library with the "@preview" prefix (for pre-release testing)
install-preview: (package "@preview")

[private]
remove target:
  ./scripts/uninstall "{{target}}"

# uninstalls the library from the "@local" prefix
uninstall: (remove "@local")

# uninstalls the library from the "@preview" prefix (for pre-release testing)
uninstall-preview: (remove "@preview")

# install fonts to ~/.local/share/fonts
install-fonts:
  ./scripts/install-fonts

# run ci suite
ci: test doc