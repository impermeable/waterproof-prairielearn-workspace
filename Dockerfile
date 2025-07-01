FROM prairielearn/workspace-vscode-base:656fccc8bed9ba6a7f12eb857e95d2024d54a614 
USER root
RUN apt update && apt install -y opam libgmp-dev pkg-config
USER coder
RUN opam init --disable-sandboxing --auto-setup
RUN opam update; \
    opam install coq-lsp.0.2.2+8.20 -y; \
    opam install ocaml-lsp-server -y; \
    opam install coq-waterproof.2.2.0+8.20 -y


RUN code-server --disable-telemetry --force \
    # Waterproof extension
    --install-extension waterproof-tue.waterproof \
    # Ensure extensions are reinstalled when needed
    && rm -rf /home/coder/.local/share/code-server/CachedExtensionVSIXs

