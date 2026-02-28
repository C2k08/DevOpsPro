const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// Rutas
app.get('/', (req, res) => {
  res.json({
    mensaje: 'API de ejemplo para DevOpsPro - PROYECTO DEVOPS',
    estado: 'funcionando',
    timestamp: new Date(),
    autor: 'Equipo DevOps',
    entorno: process.env.NODE_ENV || 'development'
  });
});

app.get('/health', (req, res) => {
  res.json({
    estado: 'ok',
    servicio: 'DevOpsProApp',
    version: '1.0.0',
    mensaje: 'Aplicación funcionando correctamente - CI/CD DEMOSTRADO'
  });
});

// API de Tareas (CRUD)
let tareas = [
  { id: 1, titulo: 'Aprender DevOps', completada: false },
  { id: 2, titulo: 'Configurar Docker', completada: true },
  { id: 3, titulo: 'Crear pipeline CI/CD', completada: false }
];

// GET - Listar tareas
app.get('/api/tareas', (req, res) => {
  res.json(tareas);
});

// POST - Crear tarea
app.post('/api/tareas', (req, res) => {
  const nuevaTarea = {
    id: tareas.length + 1,
    titulo: req.body.titulo,
    completada: false
  };
  tareas.push(nuevaTarea);
  res.status(201).json(nuevaTarea);
});

// PUT - Actualizar tarea
app.put('/api/tareas/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const tarea = tareas.find(t => t.id === id);
  if (tarea) {
    tarea.titulo = req.body.titulo || tarea.titulo;
    tarea.completada = req.body.completada !== undefined ? req.body.completada : tarea.completada;
    res.json(tarea);
  } else {
    res.status(404).json({ error: 'Tarea no encontrada' });
  }
});

// DELETE - Eliminar tarea
app.delete('/api/tareas/:id', (req, res) => {
  const id = parseInt(req.params.id);
  const index = tareas.findIndex(t => t.id === id);
  if (index !== -1) {
    tareas.splice(index, 1);
    res.json({ mensaje: 'Tarea eliminada' });
  } else {
    res.status(404).json({ error: 'Tarea no encontrada' });
  }
});

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`Servidor ejecutándose en http://localhost:${PORT}`);
});