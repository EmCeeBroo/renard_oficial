const express = require("express");
const app = express();
const authRoutes = require("./authRoutes");
const menuRoutes = require("./menuRoutes");
const reservacionRoutes = require("./reservacionRoutes");
const usuarioRoutes = require("./usuarioRoutes");

app.use("/auth", authRoutes);
app.use("/menus", menuRoutes);
app.use("/reservaciones", reservacionRoutes);
app.use("/usuarios", usuarioRoutes);

module.exports = app;
