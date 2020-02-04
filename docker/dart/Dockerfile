FROM google/dart

# Set token
ENV token=c5b3f5ebedc61594604569466bba9d955d4411b3

# Set work dir
WORKDIR /app

# Clone repo
RUN git clone https://${token}:x-oauth-basic@github.com/khorark/corona_virus_server.git server

# Set work dir
WORKDIR /app/server

# Install deps
RUN pub get

#Build
RUN dart2native bin/server.dart -o server

# Open port
EXPOSE 3000

CMD ["./server"]