#!/bin/bash

curl -XPOST -H "Content-Type: application/json" -d '{"name":"User","email":"user@graf.com","login":"user","password":"pass"}' http://$GF_SECURITY_ADMIN_USER:$GF_SECURITY_ADMIN_PASSWORD@localhost:3000/api/admin/users