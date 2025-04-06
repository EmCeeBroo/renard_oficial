import { connect } from "../config/db/connect.js";

const modeloUsuario = {
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

export default modeloUsuario;
