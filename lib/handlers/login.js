
async function login (req, res) {
    try {
        const { username, password } = req.body;
        // Validate request body (optional)
        if (!username || !password) {
            return res.status(400).json({ message: 'Missing username or password' });
        }

        const db = require('../firebase');

        // Create a query to find the user with matching username
        const queryRef = db.collection('users').where('username', '==', username);

        // Get the document (if it exists)
        const querySnapshot = await queryRef.get();

        // Check if a document was found
        if (querySnapshot.size === 1) {
            const userDoc = querySnapshot.docs[0];
            const userData = userDoc.data();

            // Secure password verification using a hashing algorithm (replace with a robust library)
            // const salt = 'your_secret_salt'; // Replace with a strong, random salt
            // const hashedPassword = crypto.createHash('sha256').update(password + salt).digest('hex');

            if (userData.password === password) {
                console.log('Status : Sucess');
                return res.json({ status: "sucess", count: 1, userData : userData });
            } else {
                return res.status(401).json({ status : 'failed', message: 'Invalid credentials' });
            }
        } else {
            return res.status(404).json({status : 'failed', message: 'User not found' });
        }
    } catch (error) {
        console.error('Error during login:', error);
        return res.status(500).json({status : 'failed', message: 'Internal Server Error' });
    }
}

module.exports = login;