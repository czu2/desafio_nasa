require 'uri'
require 'net/http'
require 'openssl'
require 'json'

def request(url)

    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)        # http -> Contiene la configuración de la petición 
    request = Net::HTTP::Get.new(uri)               # request -> Contiene la petición
    http.use_ssl = true                             # Habilita el uso de SSL
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER    # Verifica la "ida y vuelta" de la petición
    response = http.request(request)                # Realiza la petición

    if response.code.to_i >= 200 && response.code.to_i < 300
        return JSON.parse(response.read_body)       # Transforma el string de respuesta a formato JSON
    else
        return nil
    end
end
