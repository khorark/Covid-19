# Make a self-contained executable out of the application.
FROM google/dart AS dart-runtime
COPY . /app
WORKDIR /app
RUN pub get
RUN dart2native bin/server.dart -o server

# Build the bare minimum image.
FROM scratch
COPY --from=dart-runtime /app/server /app/bin/server
COPY --from=dart-runtime /lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libc.so.6 /lib/x86_64-linux-gnu/libc.so.6
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libm.so.6 /lib/x86_64-linux-gnu/libm.so.6
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libpthread.so.0 /lib/x86_64-linux-gnu/libpthread.so.0
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libdl.so.2 /lib/x86_64-linux-gnu/libdl.so.2

# For name-service order configuration, predefined hostnames like "localhost", dns server IPs
COPY --from=dart-runtime /etc/nsswitch.conf /etc/nsswitch.conf
COPY --from=dart-runtime /etc/hosts /etc/hosts
COPY --from=dart-runtime /etc/resolv.conf /etc/resolv.conf

# For performing the actual DNS queries to DNS servers
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libnss_dns.so.2 /lib/x86_64-linux-gnu/libnss_dns.so.2
COPY --from=dart-runtime /lib/x86_64-linux-gnu/libresolv.so.2 /lib/x86_64-linux-gnu/libresolv.so.2

# Open port
EXPOSE 3000

CMD ["/app/bin/server"]