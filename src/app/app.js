import express from 'express';
import authRoutes from '../routes/authRoutes.js';
import menuRoutes from '../routes/menuRoutes';
import reservacionRoutes from '../routes/reservacionRoutes';
import usuarioRoutes from '../routes/usuarioRoutes.js'

const app = express();

app.use(express.json());

app.use("/auth", authRoutes);
app.use("/menus", menuRoutes);
app.use("/reservaciones", reservacionRoutes);
app.use("/usuarios", usuarioRoutes);

app.use((rep, res, nex)=> {
    res.status(404).json({
        message: 'Endpoint losses'
    });
});

export default app;