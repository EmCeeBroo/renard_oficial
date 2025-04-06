//src/controllers/authController.js
import 'dotenv/config';
import jwt from 'jsonwebtoken';
import modeloUsuario from '../models/modeloUsuario.js';
import { encryptContraseña, compareContraseña } from '../library/appBcrypt.js';
import { connect } from '../config/db/connect.js';

export const registerUsuario = async (req, res) => {
  const { usuario, contraseña, id_rol } = req.body;

  if (!usuario || !contraseña || !id_rol) {
    return res.status(400).json({ message: 'Todos los campos son obligatorios' });
  }

  try {
    // Encriptamos la contraseña usando la función importada
    const hash = await encryptContraseña(contraseña);

    // Consulta SQL para insertar el usuario
    const sql = 'INSERT INTO User (usuario, contraseña, rol_fk, id_estado_usuario) VALUES (?, ?, ?, ?)';
    db.query(sql, [usuario, hash, id_rol, 1], (err, result) => {
      if (err) return res.status(500).json({ error: err });
      res.status(201).json({ message: 'Usuario registrado con éxito' });
    });
  } catch (error) {
    return res.status(500).json({ error: error.message });
  }
};

export const loginUsuario = async (req, res) => {
  const { usuario, contraseña } = req.body;
  
  try {
    // Buscamos el usuario en la base de datos
    const userFound = await modeloUsuario.findByUsuario(usuario);
    if (!userFound) {
      return res.status(401).json({ message: 'Usuario no existe.' });
    }
    
    // Comparamos la contraseña enviada con la almacenada (hasheada)
    const contraseñaIsValid = await compareContraseña(contraseña, userFound.contraseña);
    if (!contraseñaIsValid) {
      return res.status(401).json({ message: 'Contraseña incorrecta.' });
    }
    
    // Generamos el token JWT con la información del usuario
    const token = jwt.sign(
      { id: userFound.id, usuario: userFound.usuario },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    return res.json({ token });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
