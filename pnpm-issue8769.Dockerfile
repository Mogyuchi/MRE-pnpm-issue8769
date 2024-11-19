FROM buildpack-deps:bookworm-curl@sha256:41a24bb5f87a336e821481c8495904b7ccab850ddb7d3c7819c2c4e2c7fb7cb9

WORKDIR /root/test

COPY <<-EOF .npmrc
	use-node-version=22.11.0
EOF

SHELL ["/bin/bash", "-c"]
RUN curl -fsSL https://get.pnpm.io/install.sh | PNPM_VERSION=9.13.2 bash - # ENOENT not found: node
