import { connect } from "../config/db/connect.js";

export const showProfile = async (req,res)=>{
    try {
        let sqlQuery = "SELECT * FROM profile";
        const [result] = await connect.query(sqlQuery);
        res.status(200).json(result);
    } catch (error) {
        res.status(500).json({ error: "Error fetching profiles", details: error.message });
    }
};

export const showProfileId = async (req, res)=> {
    try {
        const [result] = await connect.query('SELECT * FROM profile WHERE profile_id = ?', [req.params.id]);
        if (result.length ===0) return res.status(404).json({ error: "Profile not found" });
        res.status(200).json(result[0]);
    } catch (error){
        res.status(500).json({ error: "Error fetching profile", details: error.message});
    }
};

export const addProfile = async (req,res)=>{
    try {
        const { name, last_name, document, email, phone, photo, address, document_type } = req.body;
        if (!name || !last_name || !document || !email || !phone) {
            return res.status(400).json({ error: "Mising required fields" });
        }
        let sqlQuery = "INSERT INTO profile (Profile_name,Profile_last_name,Profile_document,Profile_email,Profile_phone,Profile_photo,Profile_address,Document_type_fk) VALUES (?,?,?,?,?,?,?,?)";
        const [result] = await connect.query(sqlQuery, [name, last_name, document, email, phone, photo, address, document_type]);
        res.status(201).json({
            data: [{id: result.insertId, name, last_name, document, email, phone, photo, address, document_type}],
            status: 201
        });
    } catch (error){
        res.status(500).json({error: "Error adding profile", details: error.message});
    }
};

export const updateProfile = async (req,res)=>{
    try {
        const { name, last_name, document, email, phone, photo, address, document_type } = req.body;
        if (!name || !last_name || !document || !email || !phone) {
            return res.status(400).json({error: "Mising required fields"});
        }
        let sqlQuery = "UPDATE profile SET profile_name=?,Profile_last_name=?,Profile_document=?,Profile_email=?,Profile_phone=?,Profile_photo=?,Profile_address=?,Document_type_fk=? WHERE Profile_id=?";
        const [result] = await connect.query(sqlQuery, [name, last_name, document, email, phone, photo, address, document_type, req.params.id]);
        if (result.affectedRows === 0) return res.status(404).json({ error: "Profile not found"});
        res.status(200).json({
            data: [{name, last_name, document, email, phone, photo, address, document_type}],
            status: 200,
            update: result.affectedRows
        });
    } catch (error){
        res.status(500).json({ error: "Error updating profile", details: error.message});
    }
};

export const deleteProfile = async (req,res) => {
    try {
        let sqlQuery = "DELETE FROM profile WHERE Profile_id=?";
        const [result] = await connect.query(sqlQuery, [req.params.id]);
        if (result.affectedRows === 0) return res.status(404).json({ error: "Profile not found"});
        res.status(200).json({
            data: [],
            status: 200,
            deleted: result.affectedRows
        });
    } catch (error){
        res.status(500).json({ error: "Error deleting profile", details: error.message});
    }
};