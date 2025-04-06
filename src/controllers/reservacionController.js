import { connect } from '../config/db/connect.js';

// Obtener todas las reservaciones
export const showReservaciones = async (req, res) => {
  try {
    const sqlQuery = "SELECT * FROM reservacion"; 
    const [result] = await connect.query(sqlQuery);
    res.status(200).json(result); 
  } catch (error) {
    res.status(500).json({ error: "Error al obtener las reservaciones", details: error.message });
  }
};

// Obtener una reservación por ID
export const showReservacionId = async (req, res) => {
  try {
    const sqlQuery = "SELECT * FROM reservacion WHERE id_reservacion = ?";
    const [result] = await connect.query(sqlQuery, [req.params.id]);

    if (result.length === 0) {
      return res.status(404).json({ error: "Reservación no encontrada" });
    }

    res.status(200).json(result[0]); 
  } catch (error) {
    res.status(500).json({ error: "Error al obtener reservación por ID", details: error.message });
  }
};

// Crear una nueva reservación
export const addReservacion = async (req, res) => {
  try {
    const { numero_personas, fecha, usuario_fk, estado_reservacion, restaurante_fk } = req.body;
    if (!numero_personas || !fecha || !usuario_fk || !estado_reservacion || !restaurante_fk) {
      return res.status(400).json({ error: "Todos los campos son obligatorios" });
    }

    const sqlQuery = "INSERT INTO reservacion (numero_personas, fecha, usuario_fk, estado_reservacion, restaurante_fk) VALUES (?, ?, ?, ?, ?)";
    const [result] = await connect.query(sqlQuery, [numero_personas, fecha, usuario_fk, estado_reservacion, restaurante_fk]);

    res.status(201).json({
      data: [{ id: result.insertId, numero_personas, fecha, usuario_fk, estado_reservacion, restaurante_fk }],
      status: 201,
      message: "Reservación creada con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al crear la reservación", details: error.message });
  }
};

// Actualizar una reservación existente
export const updateReservacion = async (req, res) => {
  try {
    const { numero_personas, fecha, usuario_fk, estado_reservacion, restaurante_fk } = req.body;
    if (!numero_personas || !fecha || !usuario_fk || !estado_reservacion || !restaurante_fk) {
      return res.status(400).json({ error: "Todos los campos son obligatorios" });
    }

    const updated_at = new Date().toLocaleString("en-CA", { timeZone: "America/Bogota" }).replace(",", "").replace("/", "-").replace("/", "-");

    const sqlQuery = "UPDATE reservacion SET numero_personas = ?, fecha = ?, usuario_fk = ?, estado_reservacion = ?, restaurante_fk = ?, updated_at = ? WHERE id_reservacion = ?";
    const [result] = await connect.query(sqlQuery, [numero_personas, fecha, usuario_fk, estado_reservacion, restaurante_fk, updated_at, req.params.id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Reservación no encontrada para actualizar" });
    }

    res.status(200).json({
      data: [{ numero_personas, fecha, usuario_fk, estado_reservacion, restaurante_fk, updated_at }],
      status: 200,
      updated: result.affectedRows,
      message: "Reservación actualizada con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al actualizar la reservación", details: error.message });
  }
};

// Eliminar una reservación
export const deleteReservacion = async (req, res) => {
  try {
    const sqlQuery = "DELETE FROM reservacion WHERE id_reservacion = ?";
    const [result] = await connect.query(sqlQuery, [req.params.id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ error: "Reservación no encontrada para eliminar" });
    }

    res.status(200).json({
      data: [],
      status: 200,
      deleted: result.affectedRows,
      message: "Reservación eliminada con éxito"
    });
  } catch (error) {
    res.status(500).json({ error: "Error al eliminar la reservación", details: error.message });
  }
};
