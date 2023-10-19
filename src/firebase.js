// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAuth, signInWithEmailAndPassword, signOut} from "firebase/auth";
import {getFirestore} from "firebase/firestore";

/**Useful functions for using Firebase's hosting,
   authentication and database firestore service.**/

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: "AIzaSyCGU-J1rVl3riaZNGkjIE91ujEf1eeFDjg",
    authDomain: "dietplanner-f0792.firebaseapp.com",
    projectId: "dietplanner-f0792",
    storageBucket: "dietplanner-f0792.appspot.com",
    messagingSenderId: "182652350737",
    appId: "1:182652350737:web:31f1c354f91ba12bd31cb0"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const db = getFirestore(app);

const logInWithEmailAndPassword = async (email, password) => {
    try {
        await signInWithEmailAndPassword(auth, email, password);
    } catch (err) {
        console.error(err);
        alert(err.message);
    }
};

const logout = () => {
    signOut(auth);
};

export {auth, db, logInWithEmailAndPassword, logout}
