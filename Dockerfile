FROM caddy:2.6.3-builder as builder

RUN ["xcaddy", "build", "--with", "github.com/caddy-dns/cloudflare"]

FROM caddy:2.6.3 as final

COPY --from=builder /usr/bin/caddy* /usr/bin/
COPY ./Caddyfiles /etc/caddy/
