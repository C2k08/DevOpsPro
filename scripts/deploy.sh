#!/bin/bash

# Script de despliegue para DevOpsPro
# Uso: ./deploy.sh [dev|prod]

# Verificar argumentos
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 [dev|prod]"
    exit 1
fi

ENV=$1

# Verificar entorno
if [ "$ENV" != "dev" ] && [ "$ENV" != "prod" ]; then
    echo "Entorno inválido. Debe ser 'dev' o 'prod'"
    exit 1
fi

echo "Iniciando despliegue en entorno: $ENV"

# Variables según entorno
if [ "$ENV" == "dev" ]; then
    NAMESPACE="devopspro-dev"
    REPLICAS=1
else
    NAMESPACE="devopspro-prod"
    REPLICAS=3
fi

# Crear namespace si no existe
kubectl get namespace $NAMESPACE || kubectl create namespace $NAMESPACE

# Aplicar configuraciones
echo "Aplicando configuraciones de Kubernetes..."
sed -e "s/{{NAMESPACE}}/$NAMESPACE/g" \
    -e "s/{{REPLICAS}}/$REPLICAS/g" \
    -e "s/{{ENV}}/$ENV/g" \
    ./kubernetes/deployment.yaml | kubectl apply -f -

sed -e "s/{{NAMESPACE}}/$NAMESPACE/g" \
    -e "s/{{ENV}}/$ENV/g" \
    ./kubernetes/service.yaml | kubectl apply -f -

# Verificar despliegue
echo "Verificando despliegue..."
kubectl rollout status deployment/devopspro-app -n $NAMESPACE

echo "Despliegue completado en entorno $ENV"