import { connect } from '../config/db/connect.js'

export const showPerfil = async (req, res) => {
  try {
    let sqlQuery = "SELECT * FROM perfil";
    const [result] = await connect.query(sqlQuery);
    res.status(200).json(result);
  } catch (error) {
    res.status(500).json({ error: "Error al buscar perfiles", details: error.message });
  }
};

export const showPerfilId = async (req, res) => {
  try {
    const [result] = await connect.query('SELECT * FROM perfil WHERE Perfil_id = ?', [req.params.id]);
    if (result.length === 0) return res.status(404).json({ error: "Perfil no encontrado" });
    res.status(200).json(result[0]);
  } catch (error) {
    res.status(500).json({ error: "Error al buscar Perfil", details: error.message });
  }
};

export const addPerfil = async (req, res) => {
  try {
    const { nombre, documento, correo, telefono, foto, direccion, tipo_documento,usuario_id } = req.body;
    if (!nombre || !documento || !correo || !telefono) {
      return res.status(400).json({ error: "Los campos son obligatorios" });
    }
    let sqlQuery = "INSERT INTO perfil (nombre_perfil,documento_perfil,correo_perfil,telefono_perfil,foto_perfil,direccion_perfil,tipo_documento_fk,usuario_fk) VALUES (?,?,?,?,?,?,?,?)";
    const [result] = await connect.query(sqlQuery, [nombre, documento, correo, telefono, foto, direccion, tipo_documento,usuario_id]);
    res.status(201).json({
      data: [{ id: result.insertId, nombre, documento, correo, telefono, foto, direccion, tipo_documento,usuario_id }],
      status: 201
    });
  } catch (error) {
    res.status(500).json({ error: "Error al agregar usuario", details: error.message });
  }
};

export const updatePerfil = async (req, res) => {
  try {
    const { nombre, documento, correo, telefono, foto, direccion, tipo_documento } = req.body;
    if (!nombre || !documento || !correo || !telefono) {
      return res.status(400).json({ error: "Los campos son obligatorios" });
    }
    let sqlQuery = "UPDATE perfil SET nombre_perfil=?,documento_perfil=?,correo_perfil=?,telefono_perfil=?,foto_perfil=?,direccion_perfil=?,tipo_documento_fk=?,Updated_at=? WHERE Perfil_id = ?";
    const updated_at = new Date().toLocaleString("en-CA", { timeZone: "America/Bogota" }).replace(",", "").replace("/", "-").replace("/", "-");
    const [result] = await connect.query(sqlQuery, [nombre, documento, correo, telefono, foto, direccion, tipo_documento, updated_at, req.params.id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Perfil no encontrado" });
    res.status(200).json({
      data: [{ nombre, documento, correo, telefono, foto, direccion, tipo_documento,updated_at}],
      status: 200,
      updated: result.affectedRows
    });
  } catch (error) {
    res.status(500).json({ error: "Error al actualizar Perfil", details: error.message });
  }
};

export const deletePerfil = async (req, res) => {
  try {
    let sqlQuery = "DELETE FROM perfil WHERE perfil_id = ?";
    const [result] = await connect.query(sqlQuery, [req.params.id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Perfil no encontrado" });
    res.status(200).json({
      data: [],
      status: 200,
      deleted: result.affectedRows
    });
  } catch (error) {
    res.status(500).json({ error: "Error al eliminar perfile", details: error.message });
  }
};