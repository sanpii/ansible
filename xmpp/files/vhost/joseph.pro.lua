VirtualHost "joseph.pro"
    enabled = true

    ssl = {
        key = "/etc/ssl/private/homecomputing.key"
        certificate = "/etc/ssl/certs/homecomputing.pem"
    }

c2s_require_encryption = true
s2s_require_encryption = true
------ Components ------
-- You can specify components to add hosts that provide special services,
-- like multi-user conferences, and transports.
-- For more information on components, see http://prosody.im/doc/components

-- Set up a MUC (multi-user chat) room server on conference.example.com:
Component "conference.joseph.pro" "muc"

-- Set up a SOCKS5 bytestream proxy for server-proxied file transfers:
--Component "proxy.example.com" "proxy65"

---Set up an external component (default component port is 5347)
--Component "gateway.example.com"
--    component_secret = "password"
