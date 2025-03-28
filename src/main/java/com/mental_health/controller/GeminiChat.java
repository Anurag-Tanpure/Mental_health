package com.mental_health.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONArray;
import org.json.JSONObject;

public class GeminiChat {
    private static final String API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";
    private static final String API_KEY = "AIzaSyBnmTtxK7TBsAGWF2svmpfN7OnJWoOc1Ak"; // Replace with your actual Gemini API key

    public String getQuery(String query) {
        return query;
    }

    public String sendAnswer(String query) {
        HttpURLConnection connection = null;
        BufferedReader reader = null;
        try {
            // Create connection
            URL url = new URL(API_URL + "?key=" + API_KEY);
            connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Create JSON request body
            JSONObject jsonBody = new JSONObject();
            JSONArray contents = new JSONArray();
            JSONObject content = new JSONObject();
            JSONArray parts = new JSONArray();
            parts.put(new JSONObject().put("text", query));
            content.put("parts", parts);
            contents.put(content);
            jsonBody.put("contents", contents);

            // Send request
            try (OutputStream os = connection.getOutputStream()) {
                os.write(jsonBody.toString().getBytes());
                os.flush();
            }

            // Read response
            reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }

            // Parse JSON response
            JSONObject jsonResponse = new JSONObject(response.toString());
            if (jsonResponse.has("candidates")) {
                JSONArray candidates = jsonResponse.getJSONArray("candidates");
                if (candidates.length() > 0) {
                    JSONObject firstCandidate = candidates.getJSONObject(0);
                    if (firstCandidate.has("content")) {
                        JSONObject responseContent = firstCandidate.getJSONObject("content");
                        if (responseContent.has("parts")) {
                            JSONArray responseParts = responseContent.getJSONArray("parts");
                            if (responseParts.length() > 0) {
                                return responseParts.getJSONObject(0).getString("text").trim();
                            }
                        }
                    }
                }
            }
            return "Error: Could not parse response.";

        } catch (Exception e) {
            e.printStackTrace();
            return "Error: " + e.getMessage();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                connection.disconnect();
            }
        }
    }

    public static void main(String[] args) {
        GeminiChat chat = new GeminiChat();
        String userQuery = "What is Java?";
        System.out.println("User: " + userQuery);
        System.out.println("Gemini: " + chat.sendAnswer(userQuery));
    }
}