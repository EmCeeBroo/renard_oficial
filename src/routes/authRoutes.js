const express = require("express");
const router = express.Router();
const { registerUsuario, loginUsuario } = require("../controllers/authController");

// Rutas de autenticación
router.post("/register", registerUsuario);
router.post("/login", loginUsuario);

module.exports = router;
