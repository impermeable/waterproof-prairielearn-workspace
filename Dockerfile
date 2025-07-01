FROM coqorg/coq:8.20.1-ocaml-4.14.2-flambda

RUN opam update; \
    opam install coq-lsp.0.2.0+8.20 -y; \
    opam install ocaml-lsp-server -y; \
    opam install coq-waterproof.2.2.0+8.20 -y
