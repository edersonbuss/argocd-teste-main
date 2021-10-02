FROM golang:1.17 as build

WORKDIR /app
COPY . . 
RUN CGO_ENABLED=0 go build -o server main.go

FROM alpine:3.12
WORKDIR /app
#copiando oq foi gerado no build e jogando pra dentro desta pasta desta imagem menor
COPY --from=build /app/server .
#quando o container subir ele executa este comando
CMD ["./server"] 
