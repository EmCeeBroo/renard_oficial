const db = require('../config/db/connect');

const userModel = {
  findByUsuario: (usuario) => {
    return new Promise((resolve, reject) => {
      const sql = 'SELECT * FROM usuario WHERE usuario = ?';
      db.query(sql, [usuario], (err, results) => {
        if (err) return reject(err);
        resolve(results[0]);
      });
    });
  },
};

export default userModel;
