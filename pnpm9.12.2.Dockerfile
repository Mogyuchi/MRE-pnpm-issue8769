FROM buildpack-deps:bookworm-curl@sha256:41a24bb5f87a336e821481c8495904b7ccab850ddb7d3c7819c2c4e2c7fb7cb9

SHELL ["/bin/sh", "-c"]

RUN <<EOT
	set -x

	wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.shrc" SHELL="$(which sh)" PNPM_VERSION=9.12.2 sh -
	. /root/.shrc

	mkdir -p /root/test
	cd $_

	cat <<-EOF > .npmrc
		use-node-version=22.11.0
	EOF
	cat <<-EOF > package.json
		{}
	EOF

	pnpm install # success
EOT
