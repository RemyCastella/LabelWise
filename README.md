# LabelWise

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

LabelWise is a full-stack Ruby on Rails application designed to help users quickly understand food nutrition labels, regardless of the language they are written in. Simply scan a label, and LabelWise provides a breakdown of ingredients and key nutritional information in English.

**Live Application:** [**www.labelwise.online**](https://www.labelwise.online/)

![Screenshot of Scan Result](docs/images/labelwise_see.png)
![Screenshot of User Dashboard](docs/images/labelwise_eat.png)

## Table of Contents

*   [The Problem](#the-problem)
*   [The Solution](#the-solution)
*   [Key Features](#key-features)
*   [Technology Stack](#technology-stack)
*   [Setup Instructions](#setup-instructions)
*   [Usage](#usage)

## The Problem

During my time at Le Wagon Tokyo, I noticed a common challenge among my international classmates. Many had specific dietary restrictions (due to lifestyles, religions, etc.) and struggled to understand Japanese food labels. They often relied on others to translate or interpret ingredients, making it difficult to make confident and informed food choices independently.

## The Solution

LabelWise aims to bridge this gap. It empowers users to scan any nutrition label using their device's camera. The app uses OCR and AI to extract the text, translate it if necessary, and then presents a clear breakdown in English. Registered users can further personalize the experience by setting dietary preferences and tracking their nutritional intake against personal goals.

The goal is to provide users with the autonomy to understand what's in their food, anywhere, anytime.

## Key Features

*   **Multi-Language Label Scanning:** Upload an image of a nutrition label in any language.
*   **AI-Powered Ingredient Analysis:** Get an English breakdown of ingredients and nutritional information using the OpenAI API.
*   **Scan History:** View previously scanned items.
*   **User Accounts & Personalization:**
    *   **Dietary Profiles:** Specify diets (vegetarian, vegan, keto, etc.).
    *   **Allergen/Avoidance Tracking:** Mark specific ingredients to be highlighted if detected.
    *   **Nutritional Targets:** Set daily goals for calories, protein, fat, carbohydrates, and sodium.
*   **Favorites:** Save frequently consumed products/scans for quick access.
*   **Nutritional Dashboard:** Visualize consumption data with charts (powered by Chartkick), comparing intake against daily targets (calories, macros).

## Technology Stack

*   **Backend:** Ruby on Rails 7
*   **Frontend:** Hotwire (Turbo + Stimulus), Bootstrap 5
*   **Database:** PostgreSQL
*   **Image Uploads:** Cloudinary
*   **AI/OCR:** OpenAI API
*   **Authentication:** Devise
*   **Charting:** Chartkick

## Setup Instructions

To run LabelWise locally, follow these steps:

2.  **Clone the Repository:**
    ```bash
    git clone git@github.com:RemyCastella/LabelWise.git
    cd LabelWise
    ```

3.  **Install Dependencies:**
    ```bash
    bundle install
    ```

4.  **Set Up Environment Variables:**
    Create a `.env` file in the root of the project and add the following keys with your credentials:
    ```plaintext
    CLOUDINARY_URL=cloudinary://YOUR_API_KEY:YOUR_API_SECRET@YOUR_CLOUD_NAME
    OPENAI_ACCESS_TOKEN=YOUR_OPENAI_API_KEY
    MAPBOX_API_KEY=YOUR_MAPBOX_API_KEY
    ```

5.  **Database Setup:**
    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

6.  **Start the Server:**
    ```bash
    rails server
    ```

7.  **Access the Application:**
    Open your web browser and navigate to `http://localhost:3000`.

## Usage

1.  Visit the live site: [https://www.labelwise.online/](https://www.labelwise.online/)
2.  Or, after local setup, navigate to `http://localhost:3000`.
3.  **Sign up** for an account.
4.  Click the **Camera** button and upload an image of a nutrition label.
5.  View the analysis results.
6.  **Favorite** any items you will regularly consume.
7.  Add food to your **Daily Intake**.
8.  Explore your **Dashboard** and **Scan History**.
