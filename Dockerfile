Here's the Dockerfile code:

```
# Base image
FROM rust:1.55.0 as builder

# Create a new empty shell project
RUN USER=root cargo new --bin weather-api
WORKDIR /weather-api

# Copy over your manifests
COPY ./Cargo.lock ./Cargo.lock
COPY ./Cargo.toml ./Cargo.toml

# Build the dependencies
RUN cargo build --release
RUN rm src/*.rs

# Copy your source tree
COPY ./src ./src

# Build your application
RUN rm ./target/release/deps/weather_api*
RUN cargo build --release

# Create a new image from scratch
FROM debian:buster-slim
ARG APP=/usr/src/app

# Install OpenSSL
RUN apt-get update \
    && apt-get install -y openssl \
    && rm -rf /var/lib/apt/lists/*

# Copy the binary to the new image
COPY --from=builder /weather-api/target/release/weather-api ${APP}/weather-api

# Set the environment variable
ENV RUST_LOG=actix_web=info

# Expose port 8080
EXPOSE 8080

# Start the binary
CMD ["./weather-api"]
``` 

Please note that the Dockerfile assumes that the binary name is `weather-api`. If your binary has a different name, please replace `weather-api` with the correct name in the Dockerfile.