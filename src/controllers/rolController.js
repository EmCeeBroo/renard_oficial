import { connect } from '../config/db/connect.js'

export const showRol = async (req, res) => {
  try {
    let sqlQuery = "SELECT * FROM rol";
    const [result] = await connect.query(sqlQuery);
    res.status(200).json(result);
  } catch (error) {
    res.status(500).json({ error: "Error al buscar Roles", details: error.message });
  }
};

export const showRolId = async (req, res) => {
  try {
    const [result] = await connect.query('SELECT * FROM rol WHERE Rol_id = ?', [req.params.id]);
    if (result.length === 0) return res.status(404).json({ error: "Rol no encontrado" });
    res.status(200).json(result[0]);
  } catch (error) {
    res.status(500).json({ error: "Error al buscar Roles", details: error.message });
  }
};

export const addRol = async (req, res) => {
  try {
    const { nombre, descripcion } = req.body;
    if (!nombre || !descripcion ) {
      return res.status(400).json({ error: "Los campos son obligatorios" });
    }
    let sqlQuery = "INSERT INTO rol (nombre_rol,descripcion_rol) VALUES (?,?)";
    const [result] = await connect.query(sqlQuery, [nombre, descripcion]);
    res.status(201).json({
      data: [{ id: result.insertId, nombre, descripcion }],
      status: 201
    });
  } catch (error) {
    res.status(500).json({ error: "Error al agregar nuevo rol", details: error.message });
  }
};

export const updateRol = async (req, res) => {
  try {
    const { nombre, descripcion } = req.body;
    if (!nombre || !descripcion ) {
      return res.status(400).json({ error: "Los campos son obligatorios" });
    }
    let sqlQuery = "UPDATE rol SET nombre_rol=?,descripcion_rol=?,Updated_at=? WHERE rol_id= ?";
    const updated_at = new Date().toLocaleString("en-CA", { timeZone: "America/Bogota" }).replace(",", "").replace("/", "-").replace("/", "-");
    const [result] = await connect.query(sqlQuery, [nombre, descripcion,updated_at, req.params.id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Role not found" });
    res.status(200).json({
      data: [{ nombre, descripcion,updated_at }],
      status: 200,
      updated: result.affectedRows
    });
  } catch (error) {
    res.status(500).json({ error: "Error al actualizar el Rol", details: error.message });
  }
};

export const deleteRol = async (req, res) => {
  try {
    let sqlQuery = "DELETE FROM rol WHERE role_id = ?";
    const [result] = await connect.query(sqlQuery, [req.params.id]);
    if (result.affectedRows === 0) return res.status(404).json({ error: "Rol no encontrado" });
    res.status(200).json({
      data: [],
      status: 200,
      deleted: result.affectedRows
    });
  } catch (error) {
    res.status(500).json({ error: "Error al eliminar Rol", details: error.message });
  }
};