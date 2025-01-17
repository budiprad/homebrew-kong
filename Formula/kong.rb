class Kong < Formula
  desc "Open source Microservices and API Gateway"
  homepage "https://docs.konghq.com"

  stable do
    url "https://bintray.com/kong/kong-community-edition-src/download_file?file_path=dists%2Fkong-community-edition-0.14.1.tar.gz"
    sha256 "945a90568838ffb7ee89e6816576a26aae0e860b5ff0a4c396f4299062eb0001"
  end

  depends_on "openssl"
  depends_on "kong/kong/openresty@1.13.6.2"

  patch :DATA

  def install
    openresty_prefix = Formula["kong/kong/openresty@1.13.6.2"].prefix

    luarocks_prefix = openresty_prefix + "luarocks"

    system "#{luarocks_prefix}/bin/luarocks",
           "--tree=#{prefix}",
           "make",
           "CRYPTO_DIR=#{Formula['openssl'].opt_prefix}",
           "OPENSSL_DIR=#{Formula['openssl'].opt_prefix}"

    bin.install "bin/kong"
  end
end

# patch Kong default `prefix` to `/usr/local/opt/kong` as `/usr/local/`
# not writable by non root user on OSX
__END__
diff --git a/kong/templates/kong_defaults.lua b/kong/templates/kong_defaults.lua
index e38b475..7a74a2f 100644
--- a/kong/templates/kong_defaults.lua
+++ b/kong/templates/kong_defaults.lua
@@ -1,5 +1,5 @@
 return [[
-prefix = /usr/local/kong/
+prefix = /usr/local/opt/kong/
 log_level = notice
 proxy_access_log = logs/access.log
 proxy_error_log = logs/error.log
