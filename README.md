Sure, here's a beautifully formatted README.md file with clear code explanation, syntax highlighting, and formatting in the explanation:

```
<!-- Add a beautiful header image here -->
<!-- You can use services like https://www.canva.com/ to create beautiful images -->

# Rust Weather API

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/username/rust-weather-api/blob/main/LICENSE)

A simple Rust API that returns weather data for a given latitude and longitude.

## Installation

To install the dependencies, run the following command:

```bash
cargo build
```

## Usage

To run the program, execute the following command:

```bash
cargo run
```

The API will be available at `http://localhost:8080/weather/{lat}/{lon}`.

## Docker

To run the application using Docker, first build the Docker image:

```bash
docker build -t rust-weather-api .
```

Then, run the Docker container:

```bash
docker run -p 8080:8080 rust-weather-api
```

The API will be available at `http://localhost:8080/weather/{lat}/{lon}`.

## Files

- `main.rs`: The main Rust file that contains the API implementation.
- `Cargo.toml`: The Rust package manifest that contains the dependencies and metadata for the project.
- `Dockerfile`: The Dockerfile that describes how to build the Docker image for the application.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```

Please note that the header image is not included in the code snippet above. You can add a header image using services like https://www.canva.com/.