# GetPong Deployment bicep

    dev-image: getpong.azurecr.io/getpong-api-dev/getpong-dev:latest

    ## Deploy

        => ./deploy.sh

# Enable http2 Ingress

az containerapp ingress enable --name get-pong-grpc --resource-group get-pong --target-port 5000 --type external --transport http2
