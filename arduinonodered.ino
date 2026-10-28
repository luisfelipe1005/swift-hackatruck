#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <Wire.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP280.h> 

WiFiClient client;
HTTPClient httpClient;

// --- Configurações de Rede e Servidor ---
const char *WIFI_SSID = "HackaTruckIoT";
const char *WIFI_PASSWORD = "iothacka";

// Lembre-se de verificar se essa rota está correta no seu Node-RED
const char *URL = "http://192.168.128.252:1880/adicionar"; 

// --- Objeto do Sensor ---
Adafruit_BMP280 bmp; // Usa I2C (SDA no D2, SCL no D1)

void setup() {
    Serial.begin(115200); 
    
    // Pequeno delay para o lixo de boot do ESP passar
    delay(100);
    Serial.println("\n\nIniciando sistema...");

    // 1. Inicia o Sensor BMP280
    if (!bmp.begin(0x76) && !bmp.begin(0x77)) {
        Serial.println("Erro! Sensor BMP280 não encontrado.");
        while (1) delay(10); // Trava o código se o sensor falhar
    }
    
    // Configurações do BMP280
    bmp.setSampling(Adafruit_BMP280::MODE_NORMAL,
                    Adafruit_BMP280::SAMPLING_X2,
                    Adafruit_BMP280::SAMPLING_X16,
                    Adafruit_BMP280::FILTER_X16,
                    Adafruit_BMP280::STANDBY_MS_500);

    // 2. Conecta ao WiFi
    Serial.print("Conectando ao WiFi: ");
    Serial.println(WIFI_SSID);
    
    WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
    while (WiFi.status() != WL_CONNECTED) {
        delay(500);
        Serial.print(".");
    }
    Serial.println("\nConectado com sucesso!");
    delay(2000);
}

void loop() {
    // Verifica se a conexão WiFi ainda está ativa antes de tentar enviar
    if (WiFi.status() == WL_CONNECTED) {
        
        // 1. Lê a temperatura do sensor
        float temperatura = bmp.readTemperature();
        
        Serial.print("[Temperatura Lida] ");
        Serial.print(temperatura);
        Serial.println(" *C");
        
        // 2. Monta o texto que será enviado no POST
        // Exemplo de como ficará: "temperatura=25.67"
        String data = "temperatura=" + String(temperatura);

        // 3. Envia o POST para o servidor
        httpClient.begin(client, URL);
        httpClient.addHeader("Content-Type", "application/x-www-form-urlencoded");
        
        int httpCode = httpClient.POST(data); 
        String content = httpClient.getString();
        
        httpClient.end(); // Encerra a requisição

        // 4. Mostra a resposta do servidor no Monitor Serial
        Serial.print("-> POST Enviado! Codigo HTTP: ");
        Serial.println(httpCode);
        
        // Código 200 significa que deu tudo certo na API
        if (httpCode > 0) {
            Serial.print("-> Resposta da API: ");   
            Serial.println(content);
        } else {
            Serial.println("-> Erro na requisição POST.");
        }
        
    } else {
        Serial.println("Atenção: WiFi desconectado!");
    }
    
    Serial.println("-------------------------");
    
    // Aguarda 5 segundos antes de fazer a próxima leitura
    delay(5000);
}