#include <ESP8266WiFi.h>
#include <WebSocketsServer.h>

const char* ssid = "HackaTruckIoT";
const char* password = "iothacka";

WebSocketsServer webSocket(81);

void setup() {
  Serial.begin(115200);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
  }

  Serial.print("IP: ");
  Serial.println(WiFi.localIP());

  webSocket.begin();
}

void loop() {
  webSocket.loop();

  int umidade = analogRead(A0);

  String json = "{\"umidade\":" + String(umidade) + "}";

  webSocket.broadcastTXT(json);

  Serial.println(json);

  delay(2000);
}