
use actix_web::{web, App, HttpResponse, HttpServer, Responder};
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize)]
struct WeatherResponse {
    temperature: f32,
    feels_like: f32,
    humidity: f32,
    wind_speed: f32,
}

async fn weather_handler(info: web::Path<(f32, f32)>) -> impl Responder {
    let (lat, lon) = info.into_inner();
    let response = WeatherResponse {
        temperature: 20.0,
        feels_like: 18.0,
        humidity: 65.0,
        wind_speed: 10.0,
    };
    HttpResponse::Ok().json(response)
}

#[actix_rt::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/weather/{lat}/{lon}", web::get().to(weather_handler))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
