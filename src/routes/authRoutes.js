//const express = require("express");
import { Router } from "express";
import { registerUsuario, loginUsuario } from '../controllers/authController.js';

const router = Router();

// Rutas de autenticación
router.post("/register", registerUsuario);
router.post("/login", loginUsuario);

export default router;
