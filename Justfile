set positional-arguments

default:
  just --list

build: 
  dune build

dev: 
  dune build --watch

setup:
  opam repository add tan git+https://github.com/topagentnetwork/opam-packages

install: 
  opam install . --deps-only -y --with-test --with-dev-setup
 
test +args="": 
  pnpm jest ./_build/default/__tests__/tests/__tests__/*_test.js {{args}}

publish:
  opam upgrade opam-publish
  opam publish -b master --repo=topagentnetwork/opam-packages
