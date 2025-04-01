// user.controller.js
const db = require('../config/db');

// Obtener todos los usuarios
exports.getAllUsers = (req, res) => {
  const query = 'SELECT * FROM `user`';
  db.query(query, (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(200).json(results);
  });
};

// Obtener un usuario por ID
exports.getUserById = (req, res) => {
  const userId = req.params.id;
  const query = 'SELECT * FROM `user` WHERE User_id = ?';
  db.query(query, [userId], (err, results) => {
    if (err) return res.status(500).json({ error: err.message });
    if (results.length === 0) return res.status(404).json({ message: 'Usuario no encontrado' });
    res.status(200).json(results[0]);
  });
};

// Crear un nuevo usuario
exports.createUser = (req, res) => {
  const { User_user, User_password, User_status_fk, Role_fk } = req.body;
  // Si trabajas con contraseñas, aquí podrías integrar bcrypt para encriptarlas antes de guardarlas.
  const query = 'INSERT INTO `user` (User_user, User_password, User_status_fk, Role_fk) VALUES (?, ?, ?, ?)';
  db.query(query, [User_user, User_password, User_status_fk, Role_fk], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ message: 'Usuario creado', id: result.insertId });
  });
};

// Actualizar un usuario
exports.updateUser = (req, res) => {
  const userId = req.params.id;
  const { User_user, User_password, User_status_fk, Role_fk } = req.body;
  const query = 'UPDATE `user` SET User_user = ?, User_password = ?, User_status_fk = ?, Role_fk = ? WHERE User_id = ?';
  db.query(query, [User_user, User_password, User_status_fk, Role_fk, userId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.affectedRows === 0)
      return res.status(404).json({ message: 'Usuario no encontrado' });
    res.status(200).json({ message: 'Usuario actualizado' });
  });
};

// Eliminar un usuario
exports.deleteUser = (req, res) => {
  const userId = req.params.id;
  const query = 'DELETE FROM `user` WHERE User_id = ?';
  db.query(query, [userId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    if (result.affectedRows === 0)
      return res.status(404).json({ message: 'Usuario no encontrado' });
    res.status(200).json({ message: 'Usuario eliminado' });
  });
};
