// userStatus.controller.js
const db = require('../config/db');

// Obtener todos los estados de usuario
exports.getAllUserStatus = (req, res) => {
  const query = 'SELECT * FROM user_status';
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(200).json(results);
  });
};

// Obtener un estado de usuario por ID
exports.getUserStatusById = (req, res) => {
  const statusId = req.params.id;
  const query = 'SELECT * FROM user_status WHERE User_status_id = ?';
  db.query(query, [statusId], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    if (results.length === 0)
      return res.status(404).json({ message: 'Estado de usuario no encontrado' });
    res.status(200).json(results[0]);
  });
};

// Crear un nuevo estado de usuario
exports.createUserStatus = (req, res) => {
  const { User_status_name, User_status_description } = req.body;
  const query = 'INSERT INTO user_status (User_status_name, User_status_description) VALUES (?, ?)';
  db.query(query, [User_status_name, User_status_description], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: 'Estado de usuario creado', id: result.insertId });
  });
};

// Actualizar un estado de usuario
exports.updateUserStatus = (req, res) => {
  const statusId = req.params.id;
  const { User_status_name, User_status_description } = req.body;
  const query = 'UPDATE user_status SET User_status_name = ?, User_status_description = ? WHERE User_status_id = ?';
  db.query(query, [User_status_name, User_status_description, statusId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.affectedRows === 0)
      return res.status(404).json({ message: 'Estado de usuario no encontrado' });
    res.status(200).json({ message: 'Estado de usuario actualizado' });
  });
};

// Eliminar un estado de usuario
exports.deleteUserStatus = (req, res) => {
  const statusId = req.params.id;
  const query = 'DELETE FROM user_status WHERE User_status_id = ?';
  db.query(query, [statusId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.affectedRows === 0)
      return res.status(404).json({ message: 'Estado de usuario no encontrado' });
    res.status(200).json({ message: 'Estado de usuario eliminado' });
  });
};
