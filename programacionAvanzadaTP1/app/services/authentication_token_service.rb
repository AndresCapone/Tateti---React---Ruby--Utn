class AuthenticationTokenService
    # HMAC_SECRET = ENV['hmac_secret']
    HMAC_SECRET = 'hola1234'
    # ALGORITH = ENV['algorith']
    ALGORITH = 'HS256'
    def self.call(player_id)

        payload = {player_id: player_id}
        JWT.encode payload, HMAC_SECRET, ALGORITH
    end

    def self.decode(token)
        p 'aca entramos en el decode'
        p 'este es el token'
        p token
        decoded_token = JWT.decode token, HMAC_SECRET, true, {algorith: ALGORITH}
        decoded_token[0]['player_id']
    end
end