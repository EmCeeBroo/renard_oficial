import { connect } from '../config/db/connect.js';
import {  encryptPassword, comparePassword } from '../library/appBcrypt.js';
import jwt from "jsonwebtoken";

export const loginApiUser = async (req, res) => {
    try {
        const { api_user, api_password } = req.body;
        let sqlQuery = "SELECT * FROM api_user WHERE Api_user=?";
        const [result] = await connect.query(sqlQuery, api_user);
        await connect.end();
        if (result.length ===0) return res.status(400).json({ error: "user not found" });
        const user = result[0];
        const validPassword = await comparePassword(api_password, user.Api_password);
        if (!validPassword) return res.status(400).json({ error: "Incorrect password" });
        const token = jwt.sign({ id: user.Api_user_id, role: user.Api_role, status: user.Api_status }, process.env.JWT_SECRET,{
            expiresIn: "1h",
        });
        res.json({ token });
    } catch (error) {
        res.status(500).json({ error: "Error deleting user", details: error.message });
    }
};

export const registerApiUser = async (req, res) => {
    try {
        const { api_user, api_password } = req.body;
        // Se encripta la contraseña antes de guardarla
        const hashedPassword = await encryptPassword(api_password);
        let sqlQuery = "INSERT INTO api_user (Api_user, Api_password) VALUES (?, ?)";
        const [result] = await connect.query(sqlQuery, [api_user, hashedPassword]);
        await connect.end();
        res.status(201).json({ message: 'Usuario registrado', id: result.insertId });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};