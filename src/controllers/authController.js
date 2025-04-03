require('dotenv').config();
const jwt = require('jsonwebtoken');
const userModel = require('../app/models/userModel.js'); // Asegúrate de tener o crear este modelo
const bcrypt = require('../library/appBcrypt.js'); // Tu librería para encriptación

exports.login = async (req, res) => {
  const { username, password } = req.body;

  try {
    // Buscar el usuario por su nombre
    const user = await userModel.findByUsername(username);
    
    if (!user) {
      return res.status(401).json({ message: 'Usuario no existe.' });
    }
    
    // Comparar la contraseña proporcionada con la almacenada en base de datos
    const passwordIsValid = await bcrypt.comparePassword(password, user.password);

    if (!passwordIsValid) {
      return res.status(401).json({ message: 'Contraseña incorrecta.' });
    }
    
    // Generar el token usando JWT
    const token = jwt.sign(
      { id: user.id, username: user.username },
      process.env.JWT_SECRET,
      { expiresIn: '1h' }
    );

    // Puedes guardar el token en una cookie o devolverlo en la respuesta
    return res.json({ token });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};
