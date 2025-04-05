import { connect } from '../config/db/connect.js';
import {encryptContraseña} from '../library/appBcrypt.js';


export const showUsuario = async (req, res) => {
  try {
    let sqlQuery = "SELECT * FROM Usuario";
    const [result] = await connect.query(sqlQuery);
    res.status(200).json(result);
  } catch (error) {
    res.status(500).json({ error: "Error al buscar usuario", details: error.message });
  }
};

export const showUsuarioId = async (req, res) => {
  try {
    const [result] = await connect.query('SELECT * FROM usuario WHERE Usuario_id = ?', [req.params.id]);
    if (result.length === 0) return res.status(404).json({ error: "Usuario no encontrado" });
    res.status(200).json(result[0]);
  } catch (error) {
    res.status(500).json({ error: "Error al buscar usuario", details: error.message });
  }
};

export const addUsuario = async (req, res) => {
  try {
    const { usuario, contraseña, estado, rol } = req.body;
    if (!usuario || !contraseña || !estado || !rol ) {
      return res.status(400).json({ error: "Los campos son obligatorios" });
    }
     const hashedContraseña = await encryptContraseña(contraseña);
   
    let sqlQuery = "INSERT INTO usuario (Usuario_usuario,Usuario_contraseña,Usuario_estado_fk,Role_fk) VALUES (?,?,?,?)";
    const [result] = await connect.query(sqlQuery, [usuario, hashedContraseña, estado, rol]);
    res.status(201).json({
      data: [{ id: result.insertId, usuario, hashedContraseña, estado, rol }],
      status: 201
    });
  } catch (error) {
    res.status(500).json({ error: "Error al agregar Usuario", details: error.message });
  }
};

export const updateUsuario = async (req, res) => {
  try {
    const { usuario, estado, rol } = req.body;
    if (!usuario || !estado || !rol ) {
      return res.status(400).json({ error: "Los campos son obligatorios" });
    }
    let sqlQuery = "UPDATE usuario SET Usuario_usuario=?,Usuario_estado_fk=?,Rol_fk =?,Updated_at=? WHERE Usuario_id= ?";
    const updated_at = new Date().toLocaleString("en-CA", { timeZone: "America/Bogota" }).replace(",", "").replace("/", "-").replace("/", "-");
    const [result] = await connect.query(sqlQuery, [usuario, estado, rol,updated_at, req.params.id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Usuario no econtrado" });
    res.status(200).json({
      data: [{ usuario, estado, rol,updated_at }],
      status: 200,
      updated: result.affectedRows
    });
  } catch (error) {
    res.status(500).json({ error: "Error al actualizar Usuario", details: error.message });
  }
};

export const deleteUsuario = async (req, res) => {
  try {
    let sqlQuery = "DELETE FROM usuario WHERE Usuario_id = ?";
    const [result] = await connect.query(sqlQuery, [req.params.id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Usuario no encontrado" });
    res.status(200).json({
      data: [],
      status: 200,
      deleted: result.affectedRows
    });
  } catch (error) {
    res.status(500).json({ error: "Error al eliminar Usuario", details: error.message });
  }
};