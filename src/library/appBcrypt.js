import appBcrypt from 'bcrypt';
const saltRounds = 10;

export const encryptContraseña = async (contraseña) => {
    try {
        const hashedContraseña = await appBcrypt.hash(contraseña, saltRounds);
        return hashedContraseña;
    } catch (error){
        console.error('Error en la encriptacion:', error);
        throw error;
    }
};

export const compareContraseña = async (contraseña, hashedContraseña) => {
    try {
        const match = await appBcrypt.compare(contraseña, hashedContraseña);
        return match;
    } catch (error){
        console.error('Error al comparar contraseña:', error);
        throw error;
    }
};