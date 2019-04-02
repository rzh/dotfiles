#!/usr/bin/env python

import ssl
import OpenSSL

import argparse


parser = argparse.ArgumentParser(description="Input server details")
parser.add_argument('--host', dest='hostname', action='store',
                    help='Server hostname')
parser.add_argument('--sni', dest='server_name', action='store',
                    default=None, help='Server SNI name')
args = parser.parse_args()

hostname = args.hostname
server_name = args.server_name if args.server_name else hostname
port = 443

conn = ssl.create_connection((hostname, port))
context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
sock = context.wrap_socket(conn, server_hostname=server_name)
certificate = ssl.DER_cert_to_PEM_cert(sock.getpeercert(True))

x509 = OpenSSL.crypto.load_certificate(OpenSSL.crypto.FILETYPE_PEM, certificate)
after = x509.get_notAfter()
print(after)

