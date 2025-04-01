// role.controller.js
const db = require('../config/db'); // Asegúrate de tener configurado tu pool o conexión a la DB

// Obtener todos los roles
exports.getAllRoles = (req, res) => {
  const query = 'SELECT * FROM role';
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(200).json(results);
  });
};

// Obtener un role por ID
exports.getRoleById = (req, res) => {
  const roleId = req.params.id;
  const query = 'SELECT * FROM role WHERE Role_id = ?';
  db.query(query, [roleId], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    if (results.length === 0) {
      return res.status(404).json({ message: 'Role no encontrado' });
    }
    res.status(200).json(results[0]);
  });
};

// Crear un nuevo role
exports.createRole = (req, res) => {
  const { Role_name, Role_description } = req.body;
  const query = 'INSERT INTO role (Role_name, Role_description) VALUES (?, ?)';
  db.query(query, [Role_name, Role_description], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: 'Role creado', id: result.insertId });
  });
};

// Actualizar un role
exports.updateRole = (req, res) => {
  const roleId = req.params.id;
  const { Role_name, Role_description } = req.body;
  const query = 'UPDATE role SET Role_name = ?, Role_description = ? WHERE Role_id = ?';
  db.query(query, [Role_name, Role_description, roleId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Role no encontrado' });
    }
    res.status(200).json({ message: 'Role actualizado' });
  });
};

// Eliminar un role
exports.deleteRole = (req, res) => {
  const roleId = req.params.id;
  const query = 'DELETE FROM role WHERE Role_id = ?';
  db.query(query, [roleId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: 'Role no encontrado' });
    }
    res.status(200).json({ message: 'Role eliminado' });
  });
};
