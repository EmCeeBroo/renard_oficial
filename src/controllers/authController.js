require('dotenv').config();
const jwt = require('jsonwebtoken');
const userModel = require('../models/userModel.js'); // Asegúrate de tener o crear este modelo
const bcrypt = require('../library/appBcrypt.js'); // Tu librería para encriptación
const db = require('../config/db/connect'); // Conexión a la base de datos

exports.register = async (req, res) => {
  const { usuario, contraseña, rol_id } = req.body;

  // Validar datos
  if (!usuario|| !contraseña || !rol_id) {
    return res.status(400).json({ message: 'Todos los campos son obligatorios' });
  }

  // Encriptar la contraseña
  bcrypt.hash(contraseña, 10, (err, hash) => {
    if (err) return res.status(500).json({ error: err });

    // Guardar usuario en la base de datos
    const sql = 'INSERT INTO User (usuario, contraseña, rol_fk, estado_usuario_id) VALUES (?, ?, ?, ?)';
    db.query(sql, [usuario, hash, rol_id, 1], (err, result) => {
      if (err) return res.status(500).json({ error: err });
      res.status(201).json({ message: 'Usuario registrado con éxito' });
    });
  });
};

exports.login = async (req, res) => {
  const { usuario, contraseña } = req.body;

  try {
    // Buscar el usuario por su nombre
    const usuario = await userModel.findByUsuario(usuario);
    
    if (!usuario) {
      return res.status(401).json({ message: 'Usuario no existe.' });
    }
    
    // Comparar la contraseña proporcionada con la almacenada en base de datos
    const contraseñaIsValid = await bcrypt.compareContraseña(contraseña, usuario.contraseña);

    if (!contraseñaIsValid) {
      return res.status(401).json({ message: 'Contraseña incorrecta.' });
    }
    
    // Generar el token usando JWT
    const token = jwt.sign(
      { id: usuario.id, usuario: usuario.usuario },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    // Puedes guardar el token en una cookie o devolverlo en la respuesta
    return res.json({ token });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
