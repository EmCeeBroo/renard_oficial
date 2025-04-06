// src/library/appBcrypt.js
import bcrypt from 'bcrypt';
const saltRounds = 10;

export const encryptContraseña = async (contraseña) => {
  try {
    const hashedContraseña = await bcrypt.hash(contraseña, saltRounds);
    return hashedContraseña;
  } catch (error) {
    console.error('Error en la encriptacion:', error);
    throw error;
  }
};

export const compareContraseña = async (contraseña, hashedContraseña) => {
  try {
    const match = await bcrypt.compare(contraseña, hashedContraseña);
    return match;
  } catch (error) {
    console.error('Error al comparar contraseña:', error);
    throw error;
  }
};

export default { encryptContraseña, compareContraseña };
