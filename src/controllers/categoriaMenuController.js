import { connect } from '../config/db/connect.js';

// Obtener todas las categorías de menú
export const showCategoriaMenu = async (req, res) => {
  try {
    const sqlQuery = "SELECT * FROM categoria_menu"; 
    const [result] = await connect.query(sqlQuery);
    res.status(200).json(result); 
  } catch (error) {
    res.status(500).json({ error: "Error al obtener las categorías de menú", details: error.message });
  }
};

// Obtener una categoría de menú por ID
export const showCategoriaMenuId = async (req, res) => {
  try {
    const sqlQuery = "SELECT * FROM categoria_menu WHERE id_categoria_menu = ?";
    const [result] = await connect.query(sqlQuery, [req.params.id]);

    if (result.length === 0) {
      return res.status(404).json({ error: "Categoría de menú no encontrada" });
    }

    res.status(200).json(result[0]); 
  } catch (error) {
    res.status(500).json({ error: "Error al obtener la categoría de menú por ID", details: error.message });
  }
};

// Crear una nueva categoría de menú
export const addCategoriaMenu = async (req, res) => {
  try {
    const { nombre, descripcion } = req.body;
    if (!nombre) {
      return res.status(400).json({ error: "El campo 'nombre' es obligatorio" });
    }

    const sqlQuery = "INSERT INTO categoria_menu (nombre, descripcion) VALUES (?, ?)";
    const [result] = await connect.query(sqlQuery, [nombre, descripcion]);

    res.status(201).json({
      data: [{ id: result.insertId, nombre, descripcion }],
      status: 201,
      message: "Categoría de menú creada con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al crear la categoría de menú", details: error.message });
  }
};

// Actualizar una categoría de menú existente
export const updateCategoriaMenu = async (req, res) => {
  try {
    const { nombre, descripcion } = req.body;
    if (!nombre) {
      return res.status(400).json({ error: "El campo 'nombre' es obligatorio" });
    }

    const updated_at = new Date().toLocaleString("en-CA", { timeZone: "America/Bogota" }).replace(",", "").replace("/", "-").replace("/", "-");

    const sqlQuery = "UPDATE categoria_menu SET nombre = ?, descripcion = ?, updated_at = ? WHERE id_categoria_menu = ?";
    const [result] = await connect.query(sqlQuery, [nombre, descripcion, updated_at, req.params.id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Categoría de menú no encontrada para actualizar" });
    }

    res.status(200).json({
      data: [{ nombre, descripcion, updated_at }],
      status: 200,
      updated: result.affectedRows,
      message: "Categoría de menú actualizada con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al actualizar la categoría de menú", details: error.message });
  }
};

// Eliminar una categoría de menú
export const deleteCategoriaMenu = async (req, res) => {
  try {
    const sqlQuery = "DELETE FROM categoria_menu WHERE id_categoria_menu = ?";
    const [result] = await connect.query(sqlQuery, [req.params.id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Categoría de menú no encontrada para eliminar" });
    }

    res.status(200).json({
      data: [],
      status: 200,
      deleted: result.affectedRows,
      message: "Categoría de menú eliminada con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al eliminar la categoría de menú", details: error.message });
  }
};
