/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

const functions = require('firebase-functions');
const axios = require('axios'); // Use axios to make HTTP requests

exports.sendContactMessage = functions.firestore
  .document('messages/{messageId}')
  .onCreate(async (snap, context) => {
    const data = snap.data();
    
    // Replace with your webhook URL
    const webhookUrl = 'https://your-webhook-url.com/endpoint'; 

    try {
      await axios.post(webhookUrl, {
        name: data.name,
        email: data.email,
        message: data.message,
      });
      console.log('Message sent to webhook:', data);
    } catch (error) {
      console.error('Error sending message to webhook:', error);
    }
  });
