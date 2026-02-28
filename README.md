# DevOpsPro

Proyecto de automatización y despliegue DevOps.

## Estructura del Proyecto

```
DevOpsPro/
├── app/                    # Código de la aplicación
├── config/                 # Configuraciones
├── scripts/                # Scripts de automatización
├── docker/                 # Configuraciones Docker
├── kubernetes/             # Manifiestos K8s
├── .github/
│   └── workflows/          # CI/CD con GitHub Actions
├── docker-compose.yml
├── Dockerfile
└── README.md
```

## Primeros Pasos

### Prerrequisitos
- Docker
- Docker Compose
- Git

### Instalación

```bash
# Clonar el repositorio
git clone <repo-url>

# Iniciar servicios con Docker Compose
docker-compose up -d
```

## CI/CD

El pipeline de CI/CD está configurado en `.github/workflows/ci-cd.yml` y incluye:
- Build de la aplicación
- Ejecución de tests
- Análisis de código
- Despliegue a producción

## Contacto

Para consultas, contactar al equipo de DevOps.
