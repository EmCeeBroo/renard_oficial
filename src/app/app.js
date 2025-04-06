import express from 'express';
import authRoutes from '../routes/authRoutes.js';
import menuRoutes from '../routes/menuRoutes.js';
import reservacionRoutes from '../routes/reservacionRoutes.js';
import usuarioRoutes from '../routes/usuarioRoutes.js';


const app = express();

app.use(express.json());

app.use("/renard", authRoutes);
app.use("/renard", menuRoutes);
app.use("/renard", reservacionRoutes);
app.use("/renard", usuarioRoutes);

app.use((rep, res, nex)=> {
    res.status(404).json({
        message: 'Endpoint losses'
    });
});

export default app;