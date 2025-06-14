# Heart_Rate_Monitoring
# Türkçe
Bu proje, Arduino ile kalp atış hızı ölçümü yaparak, elde edilen verilerin MATLAB GUI arayüzü üzerinden kullanıcıya görsel olarak sunulmasını sağlar. Kullanıcı dostu bir arayüz ile anlık kalp atım verileri görüntülenebilir ve yorumlanabilir.
🧩 Temel Bileşenler:
    💓 Arduino (Heart_rate.ino):
    Kalp atış sinyallerini (örneğin IR sensör üzerinden) okur ve seri port üzerinden MATLAB’e gönderir.
    📊 MATLAB App Designer GUI (Heart_Rate_Monitoring_App.mlapp):
        Kalp atım sinyallerini anlık olarak grafik üzerinde gösterir
        BPM (Beats Per Minute) hesaplar ve sayısal olarak gösterir
        Verileri analiz etme ve kaydetme yetenekleri (eklenebilir)
🛠️ Kullanım:
    Arduino’ya Heart_rate.ino yüklenir.
    MATLAB'de app2.mlapp GUI açılır ve COM port ayarı yapılır.
    Başlat tuşuna basıldığında, veri akışı başlar ve kalp atımı görselleştirilir.
    
# English
This project enables real-time heart rate monitoring using Arduino, with data visualization and interaction via a MATLAB GUI (App Designer).
🧩 Main Components:
    💓 Arduino Sketch (Heart_rate.ino):
    Captures heartbeat signals (e.g., via IR sensor) and transmits them over serial.
    📊 MATLAB GUI (Heart_Rate_Monitoring_App.mlapp):
        Displays real-time heart rate waveform
        Calculates and displays BPM (Beats Per Minute)
        Can be extended with data logging or analytics
🛠️ Usage:
    Upload the Arduino sketch to your microcontroller.
    Open the MATLAB GUI, set the correct COM port.
    Start the session to visualize and monitor heartbeat data in real time.
