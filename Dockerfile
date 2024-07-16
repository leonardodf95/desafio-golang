FROM golang:alpine as builder

# Set the Current Working Directory inside the container
WORKDIR /app

# Copy the source from the current directory to the Working Directory inside the container
COPY . .

# Compilando o binário removendo informações de debug
RUN go build main.go

# Command to run the executable

# Iniciando com scratch
FROM scratch

# diretório de trabalho
WORKDIR /

# copiando o binário
COPY --from=builder /app / 

# executando 
CMD ["./main"]
