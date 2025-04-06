import { connect } from '../config/db/connect.js';

// Obtener todos los menús
export const showMenus = async (req, res) => {
  try {
    const sqlQuery = "SELECT * FROM menu"; // Consulta a la tabla menu
    const [result] = await connect.query(sqlQuery);
    res.status(200).json(result); // Devuelve todos los registros
  } catch (error) {
    res.status(500).json({ error: "Error al obtener menús", details: error.message });
  }
};

// Obtener un menú por ID
export const showMenuId = async (req, res) => {
  try {
    const sqlQuery = "SELECT * FROM menu WHERE id_menu = ?"; // Consulta usando el ID
    const [result] = await connect.query(sqlQuery, [req.params.id]);

    if (result.length === 0) {
      return res.status(404).json({ error: "Menú no encontrado" });
    }

    res.status(200).json(result[0]); // Devuelve el menú encontrado
  } catch (error) {
    res.status(500).json({ error: "Error al obtener menú por ID", details: error.message });
  }
};

// Crear un nuevo menú
export const addMenu = async (req, res) => {
  try {
    const { nombre, descripcion, categoria_menu_fk, restaurante_fk } = req.body;
    if (!nombre || !categoria_menu_fk || !restaurante_fk) {
      return res.status(400).json({ error: "Los campos nombre, categoría y restaurante son obligatorios" });
    }

    const sqlQuery = "INSERT INTO menu (nombre, descripcion, categoria_menu_fk, restaurante_fk) VALUES (?, ?, ?, ?)";
    const [result] = await connect.query(sqlQuery, [nombre, descripcion, categoria_menu_fk, restaurante_fk]);

    res.status(201).json({
      data: [{ id: result.insertId, nombre, descripcion, categoria_menu_fk, restaurante_fk }],
      status: 201,
      message: "Menú creado con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al crear menú", details: error.message });
  }
};

// Actualizar un menú existente
export const updateMenu = async (req, res) => {
  try {
    const { nombre, descripcion, categoria_menu_fk, restaurante_fk } = req.body;
    if (!nombre || !categoria_menu_fk || !restaurante_fk) {
      return res.status(400).json({ error: "Los campos nombre, categoría y restaurante son obligatorios" });
    }

    const updated_at = new Date().toLocaleString("en-CA", { timeZone: "America/Bogota" }).replace(",", "").replace("/", "-").replace("/", "-");

    const sqlQuery = "UPDATE menu SET nombre = ?, descripcion = ?, categoria_menu_fk = ?, restaurante_fk = ?, updated_at = ? WHERE id_menu = ?";
    const [result] = await connect.query(sqlQuery, [nombre, descripcion, categoria_menu_fk, restaurante_fk, updated_at, req.params.id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Menú no encontrado para actualizar" });
    }

    res.status(200).json({
      data: [{ nombre, descripcion, categoria_menu_fk, restaurante_fk, updated_at }],
      status: 200,
      updated: result.affectedRows,
      message: "Menú actualizado con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al actualizar menú", details: error.message });
  }
};

// Eliminar un menú
export const deleteMenu = async (req, res) => {
  try {
    const sqlQuery = "DELETE FROM menu WHERE id_menu = ?";
    const [result] = await connect.query(sqlQuery, [req.params.id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Menú no encontrado para eliminar" });
    }

    res.status(200).json({
      data: [],
      status: 200,
      deleted: result.affectedRows,
      message: "Menú eliminado con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al eliminar menú", details: error.message });
  }
};
